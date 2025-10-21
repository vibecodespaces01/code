-- RESIDÊNCIA PROFISSIONAL EM FPGA
-- EmbarcaTech IFMA MTC
-- Discente: Renato da Fonseca Oliveira

-- ATIVIDADE
-- Faça um exemplo que detecte a ordem de vetores 001, 100, 101, 011 em Mealy

library ieee;
use ieee.std_logic_1164.all;

entity DetectorVetorialdeMealy is
    port (
        clk       : in std_logic;
        reset     : in std_logic;
        digit     : in std_logic_vector(2 downto 0); -- vetor de 3 bits (0-7)
        detected  : out std_logic                    -- sequência detectada
    );
end DetectorVetorialdeMealy;

architecture mealy of DetectorVetorialdeMealy is
    type state_type is (S0, S1, S2, S3);
    signal state, next_state : state_type;
begin
    
    -- Registrador de estado (síncrono)
    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    
    -- Lógica de transição de estados e saída (Mealy)
    process(state, digit)
    begin
        -- Valores padrão
        next_state <= S0;
        detected <= '0';
        
        case state is
            when S0 =>
                if digit = "001" then 
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                if digit = "100" then 
                    next_state <= S2;
                elsif digit = "001" then
                    next_state <= S1; -- possível reinício imediato
                else
                    next_state <= S0;
                end if;

            when S2 =>
                if digit = "101" then
                    next_state <= S3;
                elsif digit = "001" then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S3 =>
                if digit = "011" then
                    detected <= '1'; -- Mealy: saída depende do estado atual e da entrada
                    next_state <= S0;
                elsif digit = "001" then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when others =>
                next_state <= S0;
                detected <= '0';
        end case;
    end process;

end architecture mealy;