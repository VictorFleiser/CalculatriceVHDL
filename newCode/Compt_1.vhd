----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 09:11:31
-- Design Name: 
-- Module Name: Compt_1 - Behavioral
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

entity Compt_1 is
    Port ( 
        RESET : in STD_LOGIC;
        clk : in STD_LOGIC;
        Out_1a1Hz : out STD_LOGIC);
end Compt_1;

architecture Behavioral of Compt_1 is

signal compteur_int : integer := 0;

begin
CLK_front_montant : process (clk, RESET)
    begin
    if (RESET ='1') then
        compteur_int <= 0;
    else
        if (clk'EVENT and clk='1') then --front montant
            compteur_int <= compteur_int + 1;
        end if;
        if (compteur_int = 50000000) then -- si = 10^8 /2
            Out_1a1Hz <= '1';
        elsif (compteur_int = 100000000) then -- si = 10^8
            Out_1a1Hz <= '0';
            compteur_int <= 0;
        end if;
    end if;
    end process CLK_front_montant;
end Behavioral;
