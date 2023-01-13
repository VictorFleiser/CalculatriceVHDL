----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 10:53:03
-- Design Name: 
-- Module Name: Compt_Codage_BCD - Behavioral
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

entity Compt_Codage_BCD is
    Port ( 
        RESET : in STD_LOGIC;
        Out_1a1Hz : in STD_LOGIC;
        U : out STD_LOGIC_VECTOR (3 downto 0);
        D : out STD_LOGIC_VECTOR (3 downto 0);
        C : out STD_LOGIC_VECTOR (3 downto 0);
        M : out STD_LOGIC_VECTOR (3 downto 0));
        
end Compt_Codage_BCD;

architecture Behavioral of Compt_Codage_BCD is

signal U_int : integer := 0;
signal D_int : integer := 0;
signal C_int : integer := 0;
signal M_int : integer := 0;

begin

CLK_front_montant : process (Out_1a1Hz, RESET)
    begin
    if (RESET ='1') then
        U_int <= 0;
        C_int <= 0;
        D_int <= 0;
        M_int <= 0;
    else
        if (Out_1a1Hz'EVENT and Out_1a1Hz='1') then --front montant
            U_int <= U_int + 1;     -- +1 seconde

            if (U_int = 9) then        -- +1 dizaine de secondes 
                U_int <= 0;
                D_int <= D_int + 1;
        
                if (D_int = 5) then        -- +1 minute
                    D_int <= 0;
                    C_int <= C_int + 1;
    
                    if (C_int = 9) then        -- +1 dizaine de minutes
                        C_int <= 0;
                        M_int <= M_int + 1;
        
                        if (M_int = 5) then        -- +1 heure (revient a 0)
                            M_int <= 0;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end if;
    end process CLK_front_montant;

-- Conversion du integer en logic vector grace a : https://electronics.stackexchange.com/a/461510

    U <= std_logic_vector(to_unsigned( U_int, 4));
    D <= std_logic_vector(to_unsigned( D_int, 4));
    C <= std_logic_vector(to_unsigned( C_int, 4));
    M <= std_logic_vector(to_unsigned( M_int, 4));
    
end Behavioral;
