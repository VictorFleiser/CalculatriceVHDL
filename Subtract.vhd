----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2022 01:12:43
-- Design Name: 
-- Module Name: Subtract - Behavioral
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

entity Subtract is
Port (
    RESET : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    Nb1 : IN unsigned(15 downto 0);
    Nb2 : IN unsigned(15 downto 0);
    IntMoins : OUT unsigned(15 downto 0)    --unsigned type ?
);
end Subtract;

architecture Behavioral of Subtract is

begin

ResetProcess : process (clk, RESET)
    begin
    if (RESET ='1') then
        IntMoins <= "0000000000000000";
    else
        IntMoins <= Nb1 - Nb2;
	end if;
    end process ResetProcess;

end Behavioral;
