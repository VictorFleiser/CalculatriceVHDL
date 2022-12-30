----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2022 22:25:33
-- Design Name: 
-- Module Name: stockage - Behavioral
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

entity stockage is
    Port ( RESET : in STD_LOGIC;
           clk : in STD_LOGIC;
           Chiffre : in STD_LOGIC_VECTOR (3 downto 0);
           Nb1 : out STD_LOGIC_VECTOR (15 downto 0);
           Nb2 : out STD_LOGIC_VECTOR (15 downto 0);
           Operator : out STD_LOGIC_VECTOR (1 downto 0);
           Progress : out STD_LOGIC_VECTOR (1 downto 0));
end stockage;

architecture Behavioral of stockage is

begin


end Behavioral;
