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

begin


end Behavioral;
