----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2022 10:26:27
-- Design Name: 
-- Module Name: Add - Behavioral
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

entity Add is
Port (
    RESET : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    Nb1 : IN STD_LOGIC_VECTOR(15 downto 0);
    Nb2 : IN STD_LOGIC_VECTOR(15 downto 0);
    IntPlus : OUT STD_LOGIC_VECTOR(15 downto 0)
);
end Add;

architecture Behavioral of Add is

signal int1 : unsigned(4 downto 0);
signal int2 : unsigned(4 downto 0);
signal int3 : unsigned(4 downto 0);
signal int4 : unsigned(4 downto 0);
signal retenue1 : unsigned(1 downto 0);
signal retenue2 : unsigned(1 downto 0);
signal retenue3 : unsigned(1 downto 0);
signal retenue4 : unsigned(1 downto 0);

begin

ResetProcess : process (clk, RESET)
    begin
    if (RESET ='1') then
        IntPlus <= "0000000000000000";
    else

        -- addition du 1er chiffre :
        int1 <= unsigned( Nb1(3 downto 0) ) + unsigned( Nb2(3 downto 0) );
        if (int1 > 9) then
            IntPlus(3 downto 0) <= STD_LOGIC_VECTOR( int1(3 downto 0) - 9);
            retenue1 <= "01";  -- 1ere retenue
        else
            IntPlus(3 downto 0) <= STD_LOGIC_VECTOR( int1(3 downto 0) );
            retenue1 <= "00";
        end if;

        -- addition du 2eme chiffre :
        int2 <= unsigned( Nb1(7 downto 4) ) + unsigned( Nb2(7 downto 4) ) + retenue1;
        if (int2 > 9) then
            IntPlus(7 downto 4) <= STD_LOGIC_VECTOR( int2(3 downto 0) - 9);
            retenue2 <= "01";  -- 2eme retenue
        else
            IntPlus(7 downto 4) <= STD_LOGIC_VECTOR( int2(3 downto 0) );
            retenue2 <= "00";
        end if;
 
        -- addition du 3eme chiffre :
        int3 <= unsigned( Nb1(11 downto 8) ) + unsigned( Nb2(11 downto 8) ) + retenue2;
        if (int3 > 9) then
            IntPlus(11 downto 8) <= STD_LOGIC_VECTOR( int3(3 downto 0) - 9);
            retenue3 <= "01";  -- 3eme retenue
        else
            IntPlus(11 downto 8) <= STD_LOGIC_VECTOR( int3(3 downto 0) );
            retenue3 <= "00";
        end if;



	end if;
    end process ResetProcess;

end Behavioral;
