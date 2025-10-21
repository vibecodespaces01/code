library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_reg8 is
end tb_reg8;

architecture sim of tb_reg8 is
    signal D_in   : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal CLK    : STD_LOGIC := '0';
    signal Q_out  : STD_LOGIC_VECTOR(7 downto 0);
    signal Qn_out : STD_LOGIC_VECTOR(7 downto 0);

    component reg8
        Port (
            D_in : in  STD_LOGIC_VECTOR(7 downto 0);
            CLK  : in  STD_LOGIC;
            Q_out: out STD_LOGIC_VECTOR(7 downto 0);
            Qn_out: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
begin
    uut: reg8
        port map (
            D_in   => D_in,
            CLK    => CLK,
            Q_out  => Q_out,
            Qn_out => Qn_out
        );

    -- Geração do clock
    clk_process: process
    begin
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        wait for 5 ns;
        D_in <= "10101010";
        wait for 20 ns;
        D_in <= "11110000";
        wait for 20 ns;
        D_in <= "00001111";
        wait for 20 ns;
        D_in <= "11001100";
        wait for 20 ns;
        wait;
    end process;
end sim;
