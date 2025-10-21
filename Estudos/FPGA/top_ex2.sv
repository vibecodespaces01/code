// Exemplo 2 — Partida direta com push-buttons NA
// Placa: Colorlight i9 v7.2 | clk=25 MHz (P3)
// Entradas: I1=LIGA (D1), I2=DESLIGA (C1), NA com PULLDOWN (solto=0, pressionado=1)
// Saída:   O1 (E2) ativo-alto

module top_ex2 (
    input  wire clk,         // 25 MHz
    input  wire I1,          // LIGA
    input  wire I2,          // DESLIGA
    input  wire I3, I4, I5,  // não usados
    output logic O1,
    output logic O2, O3, O4, O5
);
    // ------------------------
    // 1) Sincronização 2-flops
    // ------------------------
    logic [1:0] s1, s2;
    always_ff @(posedge clk) begin
        s1 <= {s1[0], I1};
        s2 <= {s2[0], I2};
    end

    // ------------------------
    // 2) Debounce simples (~20 ms) por nível
    // ------------------------
    localparam int DB_TICKS = 25_000_000/50; // ~20 ms
    logic i1_stable, i2_stable;
    logic [$clog2(DB_TICKS):0] c1, c2;

    // Debounce I1
    always_ff @(posedge clk) begin
        if (s1[1] == i1_stable) c1 <= '0;
        else if (c1 == DB_TICKS) begin
            i1_stable <= s1[1]; c1 <= '0;
        end else c1 <= c1 + 1'b1;
    end

    // Debounce I2
    always_ff @(posedge clk) begin
        if (s2[1] == i2_stable) c2 <= '0;
        else if (c2 == DB_TICKS) begin
            i2_stable <= s2[1]; c2 <= '0;
        end else c2 <= c2 + 1'b1;
    end

    // ------------------------
    // 3) Latch de partida direta (SET/RESET)
    //    NA: pressionado=1 ; solto=0
    // ------------------------
    logic selo;
    always_ff @(posedge clk) begin
        if (i2_stable)       selo <= 1'b0; // DESLIGA tem prioridade
        else if (i1_stable)  selo <= 1'b1; // LIGA
        else                 selo <= selo; // mantém
    end

    // Saídas (somente O1 usado)
    always_comb begin
        O1 = selo;
        O2 = 1'b0; O3 = 1'b0; O4 = 1'b0; O5 = 1'b0;
    end
endmodule
