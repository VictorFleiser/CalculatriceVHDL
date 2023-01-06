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

entity Registre is
Port (
    RESET : IN std_logic;
    clk : IN std_logic;
    InRegistre : IN STD_LOGIC_VECTOR (1 downto 0);
    OutRegistre : OUT STD_LOGIC_VECTOR (1 downto 0)
);
end Registre;

architecture Behavioral of Registre is

begin
    CLK_front_montant : process (clk, RESET)
    begin 
        if (RESET ='1') then    --Reset la valeur à 0
            OutRegistre <= "00";
        elsif (clk'EVENT and clk='1') then --front montant
            OutRegistre <= InRegistre;
        end if;
    end process CLK_front_montant ;
end Behavioral;