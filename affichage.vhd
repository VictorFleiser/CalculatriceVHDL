----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2022 22:25:33
-- Design Name: 
-- Module Name: affichage - Behavioral
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

entity affichage is
    Port ( RESET : in STD_LOGIC;
           clk : in STD_LOGIC;
           Nb1 : in STD_LOGIC_VECTOR (15 downto 0);
           Nb2 : in STD_LOGIC_VECTOR (15 downto 0);
           Resultat : in STD_LOGIC_VECTOR (15 downto 0);
           Progress : in STD_LOGIC_VECTOR (1 downto 0);
           Anodex : out STD_LOGIC_VECTOR (3 downto 0);
           Sept_seg : OUT STD_LOGIC_VECTOR( 6 downto 0)
           );
end affichage;

architecture Behavioral of affichage is

signal U : Std_Logic_Vector ( 3 downto 0);
signal D : Std_Logic_Vector ( 3 downto 0);
signal C : Std_Logic_Vector ( 3 downto 0);
signal M : Std_Logic_Vector ( 3 downto 0);
signal OUT_4 : Std_Logic_Vector ( 3 downto 0);
signal An_out : Std_Logic_Vector ( 3 downto 0);
signal OUT_7 : Std_Logic_Vector( 6 downto 0);
signal Sel : Std_Logic_Vector ( 1 downto 0);


begin

Mux3v1 : entity work.Mux3v1 port map (RESET => RESET, clk => clk, Nb1 => Nb1, Nb2 => Nb2, Resultat => Resultat, Progress => Progress, U => U, D => D, C => C, M => M);
Mux_1 : entity work.Mux_1 port map (RESET => RESET, U => U, D => D, C => C, M => M, Sel => Sel, OUT_4 => OUT_4);
Decod_7_SegNew : entity work.Decod_7_SegNew port map (RESET => RESET, OUT_4 => OUT_4, OUT_7 => OUT_7);
Reg7 : entity work.Reg7 port map (RESET => RESET, clk => clk, OUT_7 => OUT_7, Sept_seg => Sept_seg);
--Compt_1 : entity work.Compt_2 port map (RESET => RESET, clk => clk, Sel => Sel);
Compt_2cor : entity work.Compt_2cor port map (RESET => RESET, clk => clk, Sel => Sel);
Mux_2 : entity work.Mux_2 port map (RESET => RESET, Sel => Sel, An_out => An_out);
Reg4 : entity work.Reg4 port map (RESET => RESET, clk => clk, An_out => An_out, Anodex => Anodex);

end Behavioral;
