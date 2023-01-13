----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2023 22:16:22
-- Design Name: 
-- Module Name: RegTpCommande - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegTpCommande is
    Port ( RESET : in STD_LOGIC;
           clk : in STD_LOGIC;
           ChiffreIn : in STD_LOGIC_VECTOR (4 downto 0);
           ChiffreOut : out STD_LOGIC_VECTOR (4 downto 0);
           InputDispoLed0 : out STD_LOGIC
           );
           
end RegTpCommande;

architecture Behavioral of RegTpCommande is

    signal sclk :STD_LOGIC_VECTOR(31 downto 0);
    signal oneSecondPassed :STD_LOGIC; -- bool -> si une seconde est passée ou non sans input
begin
process(clk, RESET)
begin 
    if (RESET ='1') then
        sclk <= "00000000000000000000000000000000";
        ChiffreOut <= "10000";  --No OUTPUT
        oneSecondPassed <= '0';
    else
        if clk'event and clk = '1' then

            -- si sclk > 1 seconde  alors oneSecondPassed = TRUE
            if (sclk > "00000101111101011110000100000000") then 
                oneSecondPassed <= '1';
            end if;

            --Teste si un input est recu (chiffreIn)
            if (chiffreIn = "10000") then           --Pas d'Input detecté 
                 -- alors incrémente seulement sclk
                sclk <= sclk+1;
            else                                    --Input detecté
                -- sinnon Resete la sclk et teste si une seconde est passée
                sclk <= "00000000000000000000000000000000"; --reset sclk

                -- si plus d'une seconde est passée sans input -> renvoie l'input
                if (oneSecondPassed = '1') then
                    chiffreOut <= chiffreIn;
                    oneSecondPassed <= '0'; --oneSecondPassed = FALSE
                end if;
            end if;
        end if;
    end if;
end process;

InputDispoLed0 <= oneSecondPassed;

end Behavioral;
