----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.01.2023 00:33:28
-- Design Name: 
-- Module Name: BCDtoBIN - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCDtoBIN is
  Port (  RESET : in STD_LOGIC;
           InBCD : in STD_LOGIC_VECTOR (15 downto 0);
           OutBIN : out signed (15 downto 0)
           );
end BCDtoBIN;

architecture Behavioral of BCDtoBIN is

signal chiffre1 : unsigned(15 downto 0);
signal chiffre2 : unsigned(15 downto 0);
signal chiffre3 : unsigned(15 downto 0);
signal signe : STD_LOGIC;

signal int1 : unsigned(15 downto 0);
signal int2 : unsigned(15 downto 0);
signal int3 : unsigned(15 downto 0);

begin

-- "1111" correspond à la valeur indéfinie d'un chiffre (un zéro non tapé)
-- ce qui correspond à un 0
-- sinon il prend la valeur du n eme chiffre
chiffre1 <= "0000000000000000" when InBCD(3 downto 0) = "1111" else
            "000000000000" + unsigned(InBCD(3 downto 0));
chiffre2 <= "0000000000000000" when InBCD(7 downto 4) = "1111" else
            "000000000000" + unsigned(InBCD(7 downto 4));
chiffre3 <= "0000000000000000" when InBCD(11 downto 8) = "1111" else
            "000000000000" + unsigned(InBCD(11 downto 8));
-- "1010" : signe +
-- "1011" : signe -
signe <= '0' when InBCD(15 downto 12) = "1010" else
         '1';



ConvertProcess : process (InBCD, RESET)
    begin
    if (RESET ='1') then
        OutBIN <= "0000000000000000";
    else
        if (signe = '0') then   -- positif
            OutBIN <= signed(chiffre1 + (chiffre2 * 10) + (chiffre3 * 100));
        else    -- negatif
            OutBIN <= (-1)*signed(chiffre1 + (chiffre2 * 10) + (chiffre3 * 100));
        end if;
    end if;
end process;

end Behavioral;
