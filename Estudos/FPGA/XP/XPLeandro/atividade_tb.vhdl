library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- USE O  .\atividade.bat   PARA IR DIRETO AO GTKWAVE
entity atividade_tb is
end atividade_tb;

architecture sim of atividade_tb is
    signal A, B, C, D : STD_LOGIC := '0';
    signal Lamp : STD_LOGIC;
begin
    uut: entity work.atividade
        port map (A => A, B => B, C => C, D => D, Lamp => Lamp);

    process
    begin
    A <= '0'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
    A <= '0'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
    A <= '0'; B <= '0'; C <= '1'; D <= '0'; wait for 10 ns;
    A <= '0'; B <= '0'; C <= '1'; D <= '1'; wait for 10 ns;

    A <= '0'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
    A <= '0'; B <= '1'; C <= '0'; D <= '1'; wait for 10 ns;
    A <= '0'; B <= '1'; C <= '1'; D <= '0'; wait for 10 ns;
    A <= '0'; B <= '1'; C <= '1'; D <= '1'; wait for 10 ns;

    A <= '1'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
    A <= '1'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
    A <= '1'; B <= '0'; C <= '1'; D <= '0'; wait for 10 ns;
    A <= '1'; B <= '0'; C <= '1'; D <= '1'; wait for 10 ns;

    A <= '1'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
    A <= '1'; B <= '1'; C <= '0'; D <= '1'; wait for 10 ns;
    A <= '1'; B <= '1'; C <= '1'; D <= '0'; wait for 10 ns;
    A <= '1'; B <= '1'; C <= '1'; D <= '1'; wait for 10 ns;

    wait; -- encerra simulação
end process;
end sim;
