
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2022 00:08:22
-- Design Name: 
-- Module Name: RegistreUniv - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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
signal Q,Qplus:std_logic_vector(11 DOWNTO 0);
begin
process (Mode,InDecalLeftRegistre,InDecalRightRegistre,InRegistre,Q)
begin
if Mode="00" then --Mode est reglé sur None, rien ne se passe
Qplus<=Q;
elsif Mode="01" then --Mode est reglé sur Left
Qplus<=InDecalLeftRegistre & Q(7 DOWNTO 0);
elsif Mode="10" then --Mode est reglé sur Right
Qplus<=Q(11 DOWNTO 4) & InDecalRightRegistre;
else -- donc si mode vaut 11 alors Mode est reglé sur Load
Qplus<=InRegistre;
end if;
end process;

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
