----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2022 22:25:33
-- Design Name: 
-- Module Name: commandes - Behavioral
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

entity commandes is
    Port ( RESET : in STD_LOGIC;
           clk : in STD_LOGIC;
           Row : in Std_Logic_Vector (3 downto 0);
           Col : out Std_Logic_Vector (3 downto 0);
           Chiffre : out STD_LOGIC_VECTOR (4 downto 0);
           InputDispoLed0 : out STD_LOGIC
           );
end commandes;

architecture Behavioral of commandes is

signal ChiffreIn : Std_Logic_Vector (4 downto 0);
--signal Row : Std_Logic_Vector (3 downto 0);
--signal Col : Std_Logic_Vector (3 downto 0);

begin

Codeur : entity work.Codeur port map (RESET => RESET, clk => clk, Row => Row, Col => Col, Chiffre => ChiffreIn);
RegTpCommande : entity work.RegTpCommande port map (RESET => RESET, clk => clk, ChiffreIn => ChiffreIn, ChiffreOut => Chiffre, InputDispoLed0 => InputDispoLed0);

end Behavioral;
