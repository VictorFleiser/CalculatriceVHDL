----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.01.2023 09:34:32
-- Design Name: 
-- Module Name: Mux3v1 - Behavioral
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

entity Mux3v1 is
    Port ( RESET : in STD_LOGIC;
           clk : in STD_LOGIC;
           Nb1 : in STD_LOGIC_VECTOR (15 downto 0);
           Nb2 : in STD_LOGIC_VECTOR (15 downto 0);
           Resultat : in STD_LOGIC_VECTOR (15 downto 0);
           Progress : in STD_LOGIC_VECTOR (1 downto 0);
           U : out STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0);
           C : out STD_LOGIC_VECTOR (3 downto 0);
           M : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Mux3v1;

architecture Behavioral of Mux3v1 is

signal UDCM : STD_LOGIC_VECTOR (15 downto 0);

begin

U <= UDCM(3 downto 0);
D <= UDCM(7 downto 4);
C <= UDCM(11 downto 8);
M <= UDCM(15 downto 12);

selectionneNb : process (clk, Progress, RESET)
    begin
    if (RESET ='1') then
            UDCM <= "0000000000000000";
    else
    case Progress is
        when "00" => UDCM <= Nb1;
		when "01" => UDCM <= Nb2;
		when "10" => UDCM <= Resultat;
		when "11" => UDCM <= "1111111111111111";  --"1111" correspond à une case vide
		when others => UDCM <= "0000000000000000"; --ne devrait pas se produire
	end case;
	end if;
 end process selectionneNb;

end Behavioral;