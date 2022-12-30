----------------------------------------------------------------------------------
-- Company: Digilent Inc 2011
-- Engineer: Michelle Yu  
-- Create Date:      17:18:24 08/23/2011 
--
-- Module Name:    Codeur - Behavioral 

-- Description: 
-- This file defines a component Codeur for the demo project PmodKYPD. 
-- The Codeur scans each column by asserting a low to the pin corresponding to the column 
-- at 1KHz. After a column is asserted low, each row pin is checked. 
-- When a row pin is detected to be low, the key that was pressed could be determined.
--
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Codeur is
    Port (
        RESET : in STD_LOGIC;
        clk : in STD_LOGIC;
        Row : in  STD_LOGIC_VECTOR (3 downto 0);
        Col : out  STD_LOGIC_VECTOR (3 downto 0);
        Chiffre : out  STD_LOGIC_VECTOR (3 downto 0));
end Codeur;

architecture Behavioral of Codeur is

signal sclk :STD_LOGIC_VECTOR(19 downto 0);
begin
	process(clk, RESET)
		begin 
        if (RESET ='1') then
            sclk <= "00000000000000000000";
            --seule valeur à reset ?
        else

		if clk'event and clk = '1' then   --quand clock passe de 0 a 1
			-- 1ms
			if sclk = "00011000011010100000" then    --quand sclock passe de 0 a 1   ;  1ms
				--C1
				Col<= "0111";   --1000 inversé, MSB et LSB inversés
				sclk <= sclk+1;  --incrémente sclk
			-- check row pins
			elsif sclk = "00011000011010101000" then	--on attend un petit peu pour que valeur soit stabilisée à 0   ;     1,0...01ms
				--R1
				if Row = "1000" then    -- MSB et LSB inversés
					Chiffre <= "0001";	--1
				--R2
				elsif Row = "0100" then
					Chiffre <= "0100"; --4
				--R3
				elsif Row = "0010" then
					Chiffre <= "0111"; --7
				--R4
				elsif Row = "0001" then
					Chiffre <= "0000"; --0
				end if;
				sclk <= sclk+1;
			-- 2ms
			elsif sclk = "00110000110101000000" then	    --2ms ; 1ms décalé à gauche de 1
				--C2
				Col<= "1011";   --0100 inversé
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "00110000110101001000" then	    --2,0...01ms
				--R1
				if Row = "1000" then		
					Chiffre <= "0010"; --2
				--R2
				elsif Row = "0100" then
					Chiffre <= "0101"; --5
				--R3
				elsif Row = "0010" then
					Chiffre <= "1000"; --8
				--R4
				elsif Row = "0001" then
					Chiffre <= "1111"; --F
				end if;
				sclk <= sclk+1;	
			--3ms
			elsif sclk = "01001001001111100000" then     --3ms ; 1ms + 2ms binaire
				--C3
				Col<= "1101";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "01001001001111101000" then     --3,0...01ms
				--R1
				if Row = "1000" then
					Chiffre <= "0011"; --3	
				--R2
				elsif Row = "0100" then
					Chiffre <= "0110"; --6
				--R3
				elsif Row = "0010" then
					Chiffre <= "1001"; --9
				--R4
				elsif Row = "0001" then
					Chiffre <= "1110"; --E
				end if;
				sclk <= sclk+1;
			--4ms
			elsif sclk = "01100001101010000000" then 	--4ms ; 2ms décalé à gauche de 1
				--C4
				Col<= "1110";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "01100001101010001000" then     --4,0...01ms
				--R1
				if Row = "1000" then
					Chiffre <= "1010"; --A
				--R2
				elsif Row = "0100" then
					Chiffre <= "1011"; --B
				--R3
				elsif Row = "0010" then
					Chiffre <= "1100"; --C
				--R4
				elsif Row = "0001" then
					Chiffre <= "1101"; --D
				end if;
				sclk <= "00000000000000000000";	
			else
				sclk <= sclk+1;	
			end if;
		end if;
		
		end if;
	end process;
		
		
						 
end Behavioral;

