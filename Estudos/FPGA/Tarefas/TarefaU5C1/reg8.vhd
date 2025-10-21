library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg8 is
    Port (
        D_in : in  STD_LOGIC_VECTOR(7 downto 0);
        CLK  : in  STD_LOGIC;
        Q_out: out STD_LOGIC_VECTOR(7 downto 0);
        Qn_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end reg8;

architecture Structural of reg8 is
    component d_flip_flop
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;

begin
    gen_ff: for i in 0 to 7 generate
        ff_inst: d_flip_flop
            port map (
                D   => D_in(i),
                CLK => CLK,
                Q   => Q_out(i),
                Qn  => Qn_out(i)
            );
    end generate;
end Structural;
