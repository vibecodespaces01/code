library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;-- USE O  .\atividade.bat   PARA IR DIRETO AO GTKWAVE
 entity atividade is
    Port (
        A : in STD_LOGIC; -- 40%
        B : in STD_LOGIC; -- 30%
        C : in STD_LOGIC; -- 20%
        D : in STD_LOGIC; -- 10%
        Lamp : out STD_LOGIC
    );
 end atividade;
 architecture Behavioral of atividade is
 begin
    -- Expressão simplificada
    Lamp <= (A and C) or (A and B) or (B and C and D);
 end Behavioral;
