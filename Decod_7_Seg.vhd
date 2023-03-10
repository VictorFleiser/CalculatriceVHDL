----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 12:28:01
-- Design Name: 
-- Module Name: Decod_7_Seg - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decod_7_SegNew is
    Port ( RESET : in STD_LOGIC;
           OUT_4 : in STD_LOGIC_VECTOR (3 downto 0);
           OUT_7 : out Std_Logic_Vector( 6 downto 0) );
end Decod_7_SegNew;

architecture Behavioral of Decod_7_SegNew is

begin
OUT_4_Modifie : process (OUT_4, RESET)
    begin
    if (RESET ='1') then
        OUT_7 <= "1111111";
    else
    case OUT_4 is
        when "0000" => OUT_7 <= "1000000";  --0
        when "0001" => OUT_7 <= "1111001";  --1
        when "0010" => OUT_7 <= "0100100";  --2
        when "0011" => OUT_7 <= "0110000";  --3
        when "0100" => OUT_7 <= "0011001";  --4
        when "0101" => OUT_7 <= "0010010";  --5
        when "0110" => OUT_7 <= "0000010";  --6
        when "0111" => OUT_7 <= "1111000";  --7
        when "1000" => OUT_7 <= "0000000";  --8
        when "1001" => OUT_7 <= "0010000";  --9
		when others => OUT_7 <= "1111111";  --ne devrait pas se produire
	end case;
	end if;
 end process OUT_4_Modifie;

end Behavioral;
