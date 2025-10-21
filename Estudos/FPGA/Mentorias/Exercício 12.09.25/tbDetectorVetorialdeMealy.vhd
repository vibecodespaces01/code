-- RESIDÊNCIA PROFISSIONAL EM FPGA
-- EmbarcaTech IFMA MTC
-- Discente: Renato da Fonseca Oliveira

-- ATIVIDADE
-- Faça um exemplo que detecte a ordem de vetores 001, 100, 101, 011 em Mealey

library ieee;
use ieee.std_logic_1164.all;

entity tbDetectorVetorialdeMealy  is
end tbDetectorVetorialdeMealy ;

architecture sim of tbDetectorVetorialdeMealy  is
    signal clk       : std_logic := '0';
    signal reset     : std_logic := '1';
    signal digit     : std_logic_vector(2 downto 0) := "000";
    signal detected  : std_logic;

    component DetectorVetorialdeMealy 
        port (
            clk       : in std_logic;
            reset     : in std_logic;
            digit     : in std_logic_vector(2 downto 0);
            detected  : out std_logic
        );
    end component;
begin
    uut: DetectorVetorialdeMealy
        port map (
            clk       => clk,
            reset     => reset,
            digit     => digit,
            detected  => detected
        );

    -- Clock de 20 ns
    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Estímulos alinhados a borda de clock (cada wait for 20 ns = um período)
    stim_proc: process
    begin
        -- Reset inicial
        reset <= '1'; wait for 25 ns;
        reset <= '0'; wait for 15 ns; -- alinhado para cair antes do próximo posedge

        -- Teste 1: Sequência CORRETA: 001 -> 100 -> 101 -> 011 (deve detectar)
        report "Teste 1: Sequencia CORRETA: 001 -> 100 -> 101 -> 011";
        digit <= "001"; wait for 20 ns;
        digit <= "100"; wait for 20 ns;
        digit <= "101"; wait for 20 ns;
        digit <= "011"; wait for 20 ns; -- aqui detected deve ser '1'
        wait for 20 ns;

        -- Teste 2: Sequência com erro no meio: 001 -> 100 -> 000 -> 011 (não detecta)
        report "Teste 2: Sequencia com erro: 001 -> 100 -> 000 -> 011";
        digit <= "001"; wait for 20 ns;
        digit <= "100"; wait for 20 ns;
        digit <= "000"; wait for 20 ns;
        digit <= "011"; wait for 20 ns; -- não deve detectar
        wait for 20 ns;

        -- Teste 3: Reinício imediato se aparecer 001 no meio
        report "Teste 3: Reinicio imediato: 001 -> 100 -> 001 -> 100 -> 101 -> 011";
        digit <= "001"; wait for 20 ns; -- S1
        digit <= "100"; wait for 20 ns; -- S2
        digit <= "001"; wait for 20 ns; -- detecta reinício -> S1
        digit <= "100"; wait for 20 ns; -- S2
        digit <= "101"; wait for 20 ns; -- S3
        digit <= "011"; wait for 20 ns; -- detecta ('1')
        wait for 20 ns;

        -- Teste 4: Duas detecções consecutivas (sequências seguidas)
        report "Teste 4: Duas detecoes consecutivas";
        digit <= "001"; wait for 20 ns;
        digit <= "100"; wait for 20 ns;
        digit <= "101"; wait for 20 ns;
        digit <= "011"; wait for 20 ns; -- detect 1
        digit <= "001"; wait for 20 ns; -- inicia nova possível sequência
        digit <= "100"; wait for 20 ns;
        digit <= "101"; wait for 20 ns;
        digit <= "011"; wait for 20 ns; -- detect 1 novamente
        wait for 40 ns;

        report "Fim dos testes";
        wait;
    end process;
end sim;