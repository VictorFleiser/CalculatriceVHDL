-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 12:06:20
-- Design Name: 
-- Module Name: Mux_1 - Behavioral
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

entity MuxReg is
    Port ( RESET : in STD_LOGIC;
           NONE : in STD_LOGIC_VECTOR (3 downto 0);
           LEFT : in STD_LOGIC_VECTOR (3 downto 0);
           RIGHT : in STD_LOGIC_VECTOR (3 downto 0);
           LOAD : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           OUT_4 : out STD_LOGIC_VECTOR (3 downto 0));
end MuxReg;

architecture Behavioral of MuxReg is

begin
SEL_modifie : process (Sel, RESET)
    begin
    if (RESET ='1') then
            OUT_4 <= "0000";
    else
    case Sel is
        when "00" => OUT_4 <= NONE;
		when "01" => OUT_4 <= LEFT;
		when "10" => OUT_4 <= RIGHT;
		when "11" => OUT_4 <= LOAD;
		when others => OUT_4 <= "0000"; --ne devrait pas se produire
	end case;
	end if;
 end process SEL_Modifie;

end Behavioral;
