library ieee;
use ieee.std_logic_1164.all;

entity protocolo_moore is
    port (
        clk       : in std_logic;
        reset     : in std_logic;
        start     : in std_logic;  -- comando para iniciar envio
        ack       : in std_logic;  -- sinal de confirmação (acknowledge)
        busy      : out std_logic; -- indica que está enviando/durante espera
        done      : out std_logic  -- indica confirmação recebida
    );
end protocolo_moore;

architecture behavior of protocolo_moore is
    type state_type is (IDLE, SEND, WAIT_ACK, CONFIRMED);
    signal state, next_state : state_type;
begin
    -- Registro do estado
    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    -- Transição de estados e saídas (Moore: saída depende só do estado)
    process(state, start, ack)
    begin
        -- Saídas padrão
        busy <= '0';
        done <= '0';
        next_state <= state;

        case state is
            when IDLE =>
                if start = '1' then
                    next_state <= SEND;
                end if;

            when SEND =>
                busy <= '1';  -- enviando dados
                next_state <= WAIT_ACK;

            when WAIT_ACK =>
                busy <= '1';  -- aguardando confirmação
                if ack = '1' then
                    next_state <= CONFIRMED;
                end if;

            when CONFIRMED =>
                done <= '1';  -- confirmação recebida
                if start = '0' then
                    next_state <= IDLE;
                end if;

            when others =>
                next_state <= IDLE;
        end case;
    end process;

end behavior;
