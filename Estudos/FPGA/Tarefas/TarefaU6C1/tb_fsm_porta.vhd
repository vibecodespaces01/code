-- RESIDÊNCIA PROFISSIONAL EM FPGA
-- EmbarcaTech IFMA MTC
-- Discente: Renato da Fonseca Oliveira
-- VHDL: Máquinas de Estados e Bibliotecas.
-- Banco de testes (testbench) para a FSM da porta.
-- Testbench corrigido: usa o pacote local correto, inicializa sinais e ajusta waits.

library ieee;
use ieee.std_logic_1164.all;
use work.porta_local_pkg.all;  -- usar o pacote definido em fsm_porta.vhd

entity tb_fsm_porta is
end entity tb_fsm_porta;

architecture behavior of tb_fsm_porta is
    constant CLK_PERIOD      : time := 20 ns;                  -- período do clock de simulação
    constant T_ABRINDO_SIM   : time := 200 ms;                 -- tempo simulado para abrir a porta
    constant T_FECHANDO_SIM  : time := 200 ms;                 -- tempo simulado para fechar a porta
    constant T_ABERTA_SEGUNDOS_SIM : natural := 3;             -- tempo (em segundos) que a porta fica aberta na simulação

    component fsm_porta is
        generic ( CLK_FREQUENCY   : natural; T_ABERTA_SEGUNDOS : natural );
        port ( clk : in std_logic;
               rst_n : in std_logic;
               sensor : in std_logic;
               fechar_manual : in std_logic;
               fim_curso_aberta : in std_logic;
               fim_curso_fechada: in std_logic;
               motor_abrir : out std_logic;
               motor_fechar : out std_logic;
               debug_estado : out t_estado );
    end component;                                             -- declaração do componente UUT (unit under test)

    -- sinais do testbench conectados à UUT
    signal s_clk              : std_logic := '0';              -- clock de teste
    signal s_rst_n            : std_logic := '1';              -- reset ativo-baixo (inicializado em '1')
    signal s_sensor           : std_logic := '0';              -- sinal do sensor (presença)
    signal s_fechar_manual    : std_logic := '0';              -- comando manual de fechar
    signal s_fim_curso_aberta : std_logic := '0';              -- fim de curso aberto (simulado)
    signal s_fim_curso_fechada: std_logic := '0';              -- fim de curso fechado (simulado)
    signal s_motor_abrir      : std_logic := '0';              -- saída do motor abrir da UUT (inicializada)
    signal s_motor_fechar     : std_logic := '0';              -- saída do motor fechar da UUT (inicializada)
    signal s_debug_estado     : t_estado;                      -- estado atual exposto pela UUT (enum)
    signal s_debug_estado_vcd : std_logic_vector(2 downto 0);  -- versão codificada do estado para VCD/visualização

begin
    -- Instanciação da UUT com generics reduzidos para acelerar a simulação
    UUT: fsm_porta
        generic map ( CLK_FREQUENCY => 1000, T_ABERTA_SEGUNDOS => T_ABERTA_SEGUNDOS_SIM )
        port map ( clk => s_clk,
                   rst_n => s_rst_n,
                   sensor => s_sensor,
                   fechar_manual => s_fechar_manual,
                   fim_curso_aberta => s_fim_curso_aberta,
                   fim_curso_fechada => s_fim_curso_fechada,
                   motor_abrir => s_motor_abrir,
                   motor_fechar => s_motor_fechar,
                   debug_estado => s_debug_estado );

    -- Codifica o estado enumerado em vetor lógico para facilitar gravação/visualização
    with s_debug_estado select
        s_debug_estado_vcd <= "001" when FECHADA,    -- FECHADA  -> 001
                              "010" when ABRINDO,    -- ABRINDO  -> 010
                              "100" when ABERTA,     -- ABERTA   -> 100
                              "101" when FECHANDO,   -- FECHANDO -> 101
                              "000" when others;     -- default  -> 000

    -- Gerador de clock simples (processo sem sensibilidade, loop infinito)
    clk_process: process
    begin
        s_clk <= '0'; wait for CLK_PERIOD / 2;            -- metade do período em nível baixo
        s_clk <= '1'; wait for CLK_PERIOD / 2;            -- metade do período em nível alto
    end process;

    -- Processo de estímulos: sequências de entrada para validar cenários da FSM
    stimulus_process: process
    begin
        report "Iniciando..."; 
        s_rst_n <= '0'; wait for 100 ns; 
        s_rst_n <= '1'; wait for CLK_PERIOD;
            -- aplica reset inicial (ativo-baixo) e aguarda alguns clocks

        report "Cenario 1"; 
        s_sensor <= '1'; wait for CLK_PERIOD; s_sensor <= '0';
            -- presença detectada: inicia abertura
        wait for T_ABRINDO_SIM; 
        s_fim_curso_aberta <= '1'; wait for CLK_PERIOD; s_fim_curso_aberta <= '0';
            -- simula tempo de abertura e aciona fim de curso aberto
        wait for T_ABERTA_SEGUNDOS_SIM * 1 sec + 100 ms;
            -- aguarda o tempo que a porta deve permanecer aberta (timeout)
        wait for T_FECHANDO_SIM; 
        s_fim_curso_fechada <= '1'; wait for CLK_PERIOD; s_fim_curso_fechada <= '0';
            -- simula fechamento e fim de curso fechado
        wait for 1 sec;

        report "Cenario 2"; 
        s_sensor <= '1'; wait for CLK_PERIOD; s_sensor <= '0';
            -- novo ciclo: abre novamente
        wait for T_ABRINDO_SIM; 
        s_fim_curso_aberta <= '1'; wait for CLK_PERIOD; s_fim_curso_aberta <= '0';
            -- confirma aberta
        wait for (T_ABERTA_SEGUNDOS_SIM / 2) * 1 sec;
            -- espera metade do tempo de permanência aberta
        report "Sensor ativado novamente"; 
        s_sensor <= '1'; wait for 100 ms; s_sensor <= '0';
            -- detecta presença novamente para reiniciar temporizador (testa reinício de contador)
        wait for T_ABERTA_SEGUNDOS_SIM * 1 sec + 100 ms;
            -- espera para verificar comportamento do timeout após reinício
        wait for T_FECHANDO_SIM; 
        s_fim_curso_fechada <= '1'; wait for CLK_PERIOD; s_fim_curso_fechada <= '0';
        wait for 1 sec;

        report "Cenario 3"; 
        s_sensor <= '1'; wait for CLK_PERIOD; s_sensor <= '0';
            -- outro ciclo de abertura
        wait for T_ABRINDO_SIM; 
        s_fim_curso_aberta <= '1'; wait for CLK_PERIOD; s_fim_curso_aberta <= '0';
        wait for 1 sec;

        report "Fechamento manual"; 
        s_fechar_manual <= '1'; wait for CLK_PERIOD; s_fechar_manual <= '0';
            -- comando manual de fechamento enquanto porta está aberta
        wait for T_FECHANDO_SIM; 
        s_fim_curso_fechada <= '1'; wait for CLK_PERIOD; s_fim_curso_fechada <= '0';
            -- confirma que fechou
        report "Fim."; wait;                                  -- fim da simulação (espera indefinidamente)
    end process;
end architecture;