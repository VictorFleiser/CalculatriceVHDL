----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2022 22:11:52
-- Design Name: 
-- Module Name: calculatrice - Behavioral
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

entity calculatrice is
    Port ( RESET : in STD_LOGIC;
           clk : in STD_LOGIC);
end calculatrice;

architecture Behavioral of calculatrice is

signal Chiffre : Std_Logic_Vector (3 downto 0);
signal Nb1 : Std_Logic_Vector (15 downto 0);
signal Nb2 : Std_Logic_Vector (15 downto 0);
signal Resultat : Std_Logic_Vector (15 downto 0);
signal Operator : Std_Logic_Vector (1 downto 0);
signal Progress : Std_Logic_Vector (1 downto 0);

begin

    commandes : entity work.commandes port map (RESET => RESET, clk => clk, Chiffre => Chiffre);
    stockage : entity work.stockage port map (RESET => RESET, clk => clk, Chiffre => Chiffre, Nb1 => Nb1, Nb2 => Nb2, Operator => Operator, Progress => Progress);
    calcul : entity work.calcul port map (RESET => RESET, clk => clk, Nb1 => Nb1, Nb2 => Nb2, Operator => Operator, Resultat => Resultat);
    affichage : entity work.affichage port map (RESET => RESET, clk => clk, Nb1 => Nb1, Nb2 => Nb2, Resultat => Resultat, Progress => Progress);

end Behavioral;
