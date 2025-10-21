library ieee;
use ieee.std_logic_1164.all;

entity tb_protocolo_moore is
end tb_protocolo_moore;

architecture test of tb_protocolo_moore is
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '1';
    signal start  : std_logic := '0';
    signal ack    : std_logic := '0';
    signal busy   : std_logic;
    signal done   : std_logic;

    component protocolo_moore
        port (
            clk    : in std_logic;
            reset  : in std_logic;
            start  : in std_logic;
            ack    : in std_logic;
            busy   : out std_logic;
            done   : out std_logic
        );
    end component;

begin
    uut: protocolo_moore port map(clk, reset, start, ack, busy, done);

    -- Clock: 20 ns período (50 MHz)
    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Reset ativo
        reset <= '1'; wait for 30 ns;
        reset <= '0'; wait for 20 ns;

        -- Inicia protocolo de envio
        start <= '1'; 
        wait for 40 ns;

        -- Reconhecimento de confirmação
        ack <= '1'; 
        wait for 20 ns;

        ack <= '0'; 
        wait for 20 ns;

        -- Finaliza o comando start
        start <= '0';
        wait for 40 ns;

        -- Teste de ciclo sem começar envio
        wait for 60 ns;

        -- Novo comando start sem ack para testar espera
        start <= '1'; 
        wait for 60 ns;

        -- Confirma recebimento
        ack <= '1'; 
        wait for 20 ns;

        wait;
    end process;

end test;
