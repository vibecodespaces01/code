library ieee;
use ieee.std_logic_1164.all;

entity elevator_mealy is
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
end elevator_mealy;

architecture behavior of elevator_mealy is
    type state_type is (IDLE, MOVING_UP, MOVING_DOWN, STATE_DOOR);
    signal state, next_state : state_type;
begin
    -- Registro do estado síncrono
    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    -- Máquina Mealy: transições e saídas dependem de estado e entradas
    process(state, call_up, call_down, floor_sensor, door_closed)
    begin
        -- Saídas padrão
        move_up   <= '0';
        move_down <= '0';
        door_open <= '0';
        next_state <= state;

        case state is
            when IDLE =>
                if call_up = '1' then
                    next_state <= MOVING_UP;
                elsif call_down = '1' then
                    next_state <= MOVING_DOWN;
                end if;

            when MOVING_UP =>
                move_up <= '1';
                if floor_sensor = '1' then
                    next_state <= STATE_DOOR;
                end if;

            when MOVING_DOWN =>
                move_down <= '1';
                if floor_sensor = '1' then
                    next_state <= STATE_DOOR;
                end if;

            when STATE_DOOR =>
                door_open <= '1';
                if door_closed = '1' then
                    next_state <= IDLE;
                end if;

            when others =>
                next_state <= IDLE;
        end case;
    end process;

end behavior;
