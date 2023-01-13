----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2022 10:11:06
-- Design Name: 
-- Module Name: Multiplieur - Behavioral
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

entity MultiplieurBCD is
Port (
    RESET : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    Nb1 : IN unsigned(15 downto 0);
    Nb2 : IN unsigned(15 downto 0);
    IntMult : OUT unsigned(15 downto 0)
);
end MultiplieurBCD;

architecture Behavioral of MultiplieurBCD is

signal U : Std_Logic_Vector ( 3 downto 0);

begin

CalculProcess : process (clk, RESET)
    begin
    if (RESET ='1') then
        IntMult <= "0000000000000000";
    else
        IntMult <= Nb1 * Nb2;
	end if;
    end process CalculProcess;

end Behavioral;
