----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 12:38:30
-- Design Name: 
-- Module Name: Reg7 - Behavioral
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

entity Reg7 is
Port (
    RESET, IN_100 : IN std_logic;
    OUT_7 : IN unsigned( 6 downto 0);
    Sept_seg : OUT unsigned( 6 downto 0)
);
end Reg7;

architecture Behavioral of Reg7 is

begin
    CLK_front_montant : process (IN_100, RESET)
    begin 
        if (RESET ='1') then    --Reset la valeur à 0
            Sept_seg <= "0000000";
        elsif (IN_100'EVENT and IN_100='1') then --front montant
            Sept_seg <= OUT_7;
        end if;
    end process CLK_front_montant ;
end Behavioral;

