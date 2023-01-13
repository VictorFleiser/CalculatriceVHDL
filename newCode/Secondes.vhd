----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2022 08:54:53
-- Design Name: 
-- Module Name: Secondes - Behavioral
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

entity Secondes is
    Port ( clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Anodex : out STD_LOGIC_VECTOR (3 downto 0);
           Sept_seg : OUT unsigned( 6 downto 0) );
end Secondes;

architecture Behavioral of Secondes is

signal U : Std_Logic_Vector ( 3 downto 0);
signal D : Std_Logic_Vector ( 3 downto 0);
signal C : Std_Logic_Vector ( 3 downto 0);
signal M : Std_Logic_Vector ( 3 downto 0);
signal OUT_4 : Std_Logic_Vector ( 3 downto 0);
signal An_out : Std_Logic_Vector ( 3 downto 0);
signal OUT_7 : unsigned( 6 downto 0);
signal Sel : Std_Logic_Vector ( 1 downto 0);
signal Out_1a1Hz : Std_Logic;



begin

Compt_Codage_BCD : entity work.Compt_Codage_BCD port map (RESET => RESET, Out_1a1Hz => Out_1a1Hz, U => U, D => D, C => C, M => M);
Mux_1 : entity work.Mux_1 port map (RESET => RESET, U => U, D => D, C => C, M => M, Sel => Sel, OUT_4 => OUT_4);
Decod_7_Seg : entity work.Decod_7_Seg port map (RESET => RESET, OUT_4 => OUT_4, OUT_7 => OUT_7);
Reg7 : entity work.Reg7 port map (RESET => RESET, IN_100 => clk, OUT_7 => OUT_7, Sept_seg => Sept_seg);
Compt_1 : entity work.Compt_1 port map (RESET => RESET, IN_100 => clk, Out_1a1Hz => Out_1a1Hz);
Compt_2 : entity work.Compt_2 port map (RESET => RESET, IN_100 => clk, Sel => Sel);
Mux_2 : entity work.Mux_2 port map (RESET => RESET, Sel => Sel, An_out => An_out);
Reg4 : entity work.Reg4 port map (RESET => RESET, IN_100 => clk, An_out => An_out, Anodex => Anodex);


end Behavioral;
