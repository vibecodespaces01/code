library ieee;
use ieee.std_logic_1164.all;

entity tb_elevator_mealy is
end tb_elevator_mealy;

architecture test of tb_elevator_mealy is
    signal clk          : std_logic := '0';
    signal reset        : std_logic := '1';
    signal call_up      : std_logic := '0';
    signal call_down    : std_logic := '0';
    signal floor_sensor : std_logic := '0';
    signal door_closed  : std_logic := '1';
    signal move_up      : std_logic;
    signal move_down    : std_logic;
    signal door_open    : std_logic;

    component elevator_mealy
        port (
            clk          : in std_logic;
            reset        : in std_logic;
            call_up      : in std_logic;
            call_down    : in std_logic;
            floor_sensor : in std_logic;
            door_closed  : in std_logic;
            move_up      : out std_logic;
            move_down    : out std_logic;
            door_open    : out std_logic
        );
    end component;

begin
    uut: elevator_mealy port map(clk, reset, call_up, call_down, floor_sensor, door_closed, move_up, move_down, door_open);

    -- Clock de 20 ns (50 MHz)
    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        -- Reset ativo inicial
        reset <= '1'; wait for 40 ns;
        reset <= '0'; wait for 20 ns;

        -- Chamada para subir
        call_up <= '1';
        wait for 40 ns;
        call_up <= '0';

        -- O elevador está se movendo para cima, simular chegada no andar
        wait for 60 ns;
        floor_sensor <= '1'; -- elevador chegou no andar
        wait for 20 ns;
        floor_sensor <= '0';

        -- Porta abre
        door_closed <= '0';
        wait for 50 ns;

        -- Porta fecha
        door_closed <= '1';
        wait for 30 ns;

        -- Pausa
        wait for 40 ns;

        -- Chamada para descer
        call_down <= '1';
        wait for 40 ns;
        call_down <= '0';

        -- O elevador está se movendo para baixo, simular chegada no andar
        wait for 60 ns;
        floor_sensor <= '1';
        wait for 20 ns;
        floor_sensor <= '0';

        -- Porta abre
        door_closed <= '0';
        wait for 50 ns;

        -- Porta fecha
        door_closed <= '1';
        wait for 30 ns;

        wait;
    end process;

end test;
