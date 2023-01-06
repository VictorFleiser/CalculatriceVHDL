library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegistreUniv is
    Port ( RESET : in STD_LOGIC;
           clk : in STD_LOGIC;
           Mode : in STD_LOGIC_VECTOR (1 downto 0);
           InRegistre : in STD_LOGIC_VECTOR (11 downto 0);
           InDecalLeftRegistre : in STD_LOGIC_VECTOR (3 downto 0);
           InDecalRightRegistre : in STD_LOGIC_VECTOR (3 downto 0);
           OutRegistre : out STD_LOGIC_VECTOR (11 downto 0));
end RegistreUniv;

architecture Behavioral of RegistreUniv is
signal Qa,Qb,Qc,Da,Db,Dc:std_logic_vector(3 DOWNTO 0);
signal Q,Qplus:std_logic_vector(11 DOWNTO 11);
begin
--process (Mode,InDecalLeftRegistre,InDecalRightRegistre,InRegistre,Qa,Qb,Qc,Da,Db,Dc)
--begin
RegistreA: entity work.Regi4Univ port map(RESET=>RESET,clk=>clk,InRegistre=>Da,OutRegistre=>Qa);
Registreb: entity work.Regi4Univ port map(RESET=>RESET,clk=>clk,InRegistre=>Db,OutRegistre=>Qb);
Registrec: entity work.Regi4Univ port map(RESET=>RESET,clk=>clk,InRegistre=>Dc,OutRegistre=>Qc);

MuxA : entity work.MuxReg port map (RESET=>reset,NONE=>Qa,LEFT=>Qb,RIGHT=>InDecalRightRegistre,LOAD=>InRegistre(11 DOWNTO 8),Sel=>Mode,Out_4=>Da);
Muxb : entity work.MuxReg port map(RESET=>reset,NONE=>Qb,LEFT=>Qc,RIGHT=>Qc,LOAD=>InRegistre(7 DOWNTO 4),Sel=>Mode,Out_4=>Db);
Muxc : entity work.MuxReg port map(RESET=>reset,NONE=>Qc,LEFT=>InDecalLeftRegistre,RIGHT=>Qb,LOAD=>InRegistre(3 DOWNTO 0),Sel=>Mode,Out_4=>Dc);

Q<=Qa&Qb&Qc;
--end process;

process (clk,RESET)
begin
if RESET= '0' then
    if rising_edge(clk) then
    Q<=Qplus;
    end if;
end if;
end process;
OutRegistre<=Q;


end Behavioral;