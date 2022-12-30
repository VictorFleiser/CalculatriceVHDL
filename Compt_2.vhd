----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 10:24:17
-- Design Name: 
-- Module Name: Compt_2 - Behavioral
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

entity Compt_2 is
    Port ( RESET : in STD_LOGIC;
           IN_100 : in STD_LOGIC;
           Sel : out STD_LOGIC_VECTOR (1 downto 0));
end Compt_2;

architecture Behavioral of Compt_2 is

signal compteur_int1 : integer := 0;
signal compteur_int2 : STD_LOGIC_VECTOR(1 downto 0);

begin
CLK_front_montant : process (IN_100, RESET)
    begin
    if (RESET ='1') then
        compteur_int2 <= "00";
    else
        if (IN_100'EVENT and IN_100='1') then --front montant
            compteur_int1 <= compteur_int1 + 1;
        end if;
        if (compteur_int1 = 1) then
            compteur_int2 <= "01";
        elsif (compteur_int1 = 2) then
            compteur_int2 <= "10";
        elsif (compteur_int1 = 3) then
            compteur_int2 <= "11";
        elsif (compteur_int1 = 4) then
            compteur_int2 <= "00";
            compteur_int1 <= 0;
        end if;
    end if;
    end process CLK_front_montant;
    
    Sel <= compteur_int2;
    
end Behavioral;
