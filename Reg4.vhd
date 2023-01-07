----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 12:42:19
-- Design Name: 
-- Module Name: Reg4 - Behavioral
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

entity Reg4 is
Port (
    RESET, clk : IN std_logic;
    An_out : IN STD_LOGIC_VECTOR (3 downto 0);
    Anodex : OUT STD_LOGIC_VECTOR (3 downto 0)
);
end Reg4;

architecture Behavioral of Reg4 is

begin
    CLK_front_montant : process (clk, RESET)
    begin 
        if (RESET ='1') then    --Reset la valeur à 0
            Anodex <= "0000";
        elsif (clk'EVENT and clk='1') then --front montant
            Anodex <= An_out;
        end if;
    end process CLK_front_montant ;
end Behavioral;
