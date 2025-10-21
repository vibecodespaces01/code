// =================================================================
// RESIDÊNCIA PROFISSIONAL EM FPGA
// EmbarcaTech IFMA MTC
// Discente: Renato da Fonseca Oliveira
// Tarefa FPU7C2
// =================================================================
// Circuito para acionamento de 2 motores alternados (30 s; modo teste 3 s)
// Placa: Colorlight i9 v7.2  |  clk = 25 MHz em P3
// Entradas (push-buttons NA, ativo-alto):
//   I1 = START   |   I2 = STOP   |   I3 = RESET   |   I4 = MODO_TESTE (1=>3s, 0=>30s)   |   I5 = livre
// Saídas (LEDs cát. comum, ativo-alto):
//   O1 = M1   |   O2 = M2   |   O3 = Cronômetro ativo (pisca 1 Hz)   |   O4 = Em ciclo   |   O5 = Heartbeat (~2 Hz)

module top_ex17_misturador (
    input  wire        clk,                 // 25 MHz
    input  wire        I1, I2, I3, I4, I5,  // botões/entradas
    output logic       O1, O2, O3, O4, O5   // saídas
);
    // ========= 0) Utilidades =========
    localparam int F_CLK   = 25_000_000;

    // Heartbeat ~2 Hz em O5
    localparam int DIVHB   = F_CLK/4;
    logic [$clog2(DIVHB)-1:0] hb_cnt = '0;
    always_ff @(posedge clk) hb_cnt <= (hb_cnt==DIVHB-1) ? '0 : hb_cnt + 1;
    logic hb_ff = 1'b0;
    always_ff @(posedge clk) if (hb_cnt==DIVHB-1) hb_ff <= ~hb_ff;

    // Blinker 1 Hz para O3 (cronômetro ativo)
    localparam int DIV1HZ  = F_CLK/2; // toggle a cada 0,5 s → 1 Hz
    logic [$clog2(DIV1HZ)-1:0] b1_cnt = '0;
    always_ff @(posedge clk) b1_cnt <= (b1_cnt==DIV1HZ-1) ? '0 : b1_cnt + 1;
    logic blink1 = 1'b0;
    always_ff @(posedge clk) if (b1_cnt==DIV1HZ-1) blink1 <= ~blink1;

    // ========= 1) Sincronização + Debounce (≈5 ms) para START/STOP/RESET =========
    function int DB_CYCLES_5MS(); DB_CYCLES_5MS = F_CLK/200; endfunction // 125_000
    localparam int DB_MAX = DB_CYCLES_5MS();
    localparam int DB_W   = $clog2(DB_MAX);

    typedef struct packed {
        logic [1:0] sync;
        logic [DB_W-1:0] cnt;
        logic q;
        logic q_d;
    } db_t;

    db_t st, sp, rs;

    always_ff @(posedge clk) begin
        // sincroniza entradas
        st.sync <= {st.sync[0], I1};
        sp.sync <= {sp.sync[0], I2};
        rs.sync <= {rs.sync[0], I3};

        // debounce START
        if (st.sync[1] == st.q) st.cnt <= '0;
        else if (st.cnt == DB_MAX-1) begin st.cnt <= '0; st.q <= st.sync[1]; end
        else st.cnt <= st.cnt + 1;

        // debounce STOP
        if (sp.sync[1] == sp.q) sp.cnt <= '0;
        else if (sp.cnt == DB_MAX-1) begin sp.cnt <= '0; sp.q <= sp.sync[1]; end
        else sp.cnt <= sp.cnt + 1;

        // debounce RESET
        if (rs.sync[1] == rs.q) rs.cnt <= '0;
        else if (rs.cnt == DB_MAX-1) begin rs.cnt <= '0; rs.q <= rs.sync[1]; end
        else rs.cnt <= rs.cnt + 1;

        // registra nível anterior para borda ↑
        st.q_d <= st.q;
        sp.q_d <= sp.q;
        rs.q_d <= rs.q;
    end

    wire start_rise  =  st.q & ~st.q_d;
    wire stop_rise   =  sp.q & ~sp.q_d;
    wire reset_rise  =  rs.q & ~rs.q_d;

    // I4 (modo teste) só precisa sincronizar (sem debounce)
    logic [1:0] test_sync;
    always_ff @(posedge clk) test_sync <= {test_sync[0], I4};
    wire mode_test = test_sync[1]; // 1 => períodos de 3 s

    // ========= 2) Tick de 1 segundo =========
    localparam int DIV_SEC = F_CLK; // 25M ciclos = 1 s
    logic [$clog2(DIV_SEC)-1:0] s_cnt = '0;
    logic tick_1s = 1'b0;
    always_ff @(posedge clk) begin
        if (s_cnt == DIV_SEC-1) begin
            s_cnt   <= '0;
            tick_1s <= 1'b1;
        end else begin
            s_cnt   <= s_cnt + 1;
            tick_1s <= 1'b0;
        end
    end

    // ========= 3) FSM: IDLE -> M1_ON -> M2_ON -> M1_ON ... =========
    typedef enum logic [1:0] {IDLE, M1_ON, M2_ON} state_t;
    state_t stt = IDLE;

    // contador de segundos do período
    localparam int T_NORMAL = 30;
    localparam int T_TEST   = 3;
    logic [5:0] sec_cnt = '0; // até 60s é suficiente

    // saídas internas
    logic m1 = 1'b0, m2 = 1'b0;
    logic running = 1'b0;

    always_ff @(posedge clk) begin
        // Prioridade: RESET/STOP
        if (reset_rise || stop_rise) begin
            stt     <= IDLE;
            m1      <= 1'b0;
            m2      <= 1'b0;
            running <= 1'b0;
            sec_cnt <= '0;
        end else begin
            unique case (stt)
                IDLE: begin
                    m1 <= 1'b0; m2 <= 1'b0; running <= 1'b0; sec_cnt <= '0;
                    if (start_rise) begin
                        stt     <= M1_ON;
                        m1      <= 1'b1;
                        running <= 1'b1;
                        sec_cnt <= '0;
                    end
                end

                M1_ON: begin
                    m1 <= 1'b1; m2 <= 1'b0; running <= 1'b1;
                    if (tick_1s) begin
                        sec_cnt <= sec_cnt + 1;
                        if (sec_cnt == ((mode_test ? T_TEST : T_NORMAL) - 1)) begin
                            stt     <= M2_ON;
                            m1      <= 1'b0;
                            m2      <= 1'b1;
                            sec_cnt <= '0;
                        end
                    end
                end

                M2_ON: begin
                    m1 <= 1'b0; m2 <= 1'b1; running <= 1'b1;
                    if (tick_1s) begin
                        sec_cnt <= sec_cnt + 1;
                        if (sec_cnt == ((mode_test ? T_TEST : T_NORMAL) - 1)) begin
                            stt     <= M1_ON;
                            m2      <= 1'b0;
                            m1      <= 1'b1;
                            sec_cnt <= '0;
                        end
                    end
                end
            endcase
        end
    end

    // ========= 4) Saídas externas =========
    always_comb begin
        O1 = m1;                     // Motor 1
        O2 = m2;                     // Motor 2
        O3 = running ? blink1 : 1'b0;// Cronômetro pisca 1 Hz quando em período ativo
        O4 = running;                // Em ciclo
        O5 = hb_ff;                  // Heartbeat ~2 Hz
    end
endmodule
