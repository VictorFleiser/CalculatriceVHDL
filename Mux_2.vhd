----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 12:22:23
-- Design Name: 
-- Module Name: Mux_2 - Behavioral
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

entity Mux_2 is
    Port (
        RESET : in STD_LOGIC;
        Sel : in STD_LOGIC_VECTOR (1 downto 0);
        An_out : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2;

architecture Behavioral of Mux_2 is

begin
SEL_modifie : process (Sel, RESET)
    begin
    if (RESET ='1') then
        An_out <= "1110";
    else
    case Sel is
        when "00" => An_out <= "1110";
		when "01" => An_out <= "1101";
		when "10" => An_out <= "1011";
		when "11" => An_out <= "0111";
		when others => An_out <= "1111";  --ne devrait pas se produire
	end case;
	end if;
 end process SEL_Modifie;

end Behavioral;

