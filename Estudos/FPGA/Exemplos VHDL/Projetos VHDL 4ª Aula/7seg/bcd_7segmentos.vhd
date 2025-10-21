-- Decodificador BCD para display de 7 segmentos (cátodo comum)
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd_7segmentos is
    port (
        bcd    : in std_logic_vector(3 downto 0);    -- Entrada BCD
        seg    : out std_logic_vector(6 downto 0)    -- Saída: segmentos a–g
    );
end bcd_7segmentos;

architecture behavioral of bcd_7segmentos is
begin
    process(bcd)
    begin
        case bcd is
        when "0000" => seg <= "1001000"; -- ASCII 'H' = 72
        when "0001" => seg <= "1001001"; -- ASCII 'I' = 73
        when "0010" => seg <= "1010010"; -- ASCII 'R' = 82
        when "0011" => seg <= "1001001"; -- ASCII 'I' = 73
        when "0100" => seg <= "1010011"; -- ASCII 'S' = 83
        when "0101" => seg <= "1001100"; -- ASCII 'L' = 76
        when "0110" => seg <= "1000001"; -- ASCII 'A' = 65
        when "0111" => seg <= "1011001"; -- ASCII 'Y' = 89
        when "1000" => seg <= "1001110"; -- ASCII 'N' = 78
        when "1001" => seg <= "1000101"; -- ASCII 'E' = 69
        when others => seg <= "0000000"; -- nada aceso
        end case;
    end process;
end behavioral;
