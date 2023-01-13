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
        Chiffre : out  STD_LOGIC_VECTOR (4 downto 0));
end Codeur;

architecture Behavioral of Codeur is

signal sclk :STD_LOGIC_VECTOR(19 downto 0);
--signal sclk :STD_LOGIC_VECTOR(31 downto 0);
begin
	process(clk, RESET)
		begin 
        if (RESET ='1') then
            sclk <= "00000000000000000000";
--            sclk <= "00000000000000000000000000000000";
            --seule valeur à reset ?
        else

		if clk'event and clk = '1' then   --quand clock passe de 0 a 1
			-- 1s
			if sclk = "00011000011010100000" then    --quand sclock passe de 0 a 1   ;  1ms
--			if sclk = "00000101111101011110000100000000" then    --quand sclock passe de 0 a 1   ;  1s
				--C1
				Col<= "1110";   --1000 inversé, MSB et LSB inversés
				sclk <= sclk+1;  --incrémente sclk
			-- check row pins
			elsif sclk = "00011000011010101000" then	--on attend un petit peu pour que valeur soit stabilisée à 0   ;     1,0...01ms
--			elsif sclk = "00000101111101011110000100001000" then	--on attend un petit peu pour que valeur soit stabilisée à 0   ;     1,0...01s
				--R1
--				if Row = "1000" then    -- MSB et LSB inversés
                if Row = "1110" then
					Chiffre <= "00001";	--1
				--R2
--				elsif Row = "0100" then
				elsif Row = "1101" then
					Chiffre <= "00100"; --4
				--R3
--				elsif Row = "0010" then
				elsif Row = "1011" then
					Chiffre <= "00111"; --7
				--R4
--				elsif Row = "0001" then
				elsif Row = "0111" then
					Chiffre <= "00000"; --0
                else
                    Chiffre <= "10000"; --no input
				end if;
				sclk <= sclk+1;
			-- 2ms
			elsif sclk = "00110000110101000000" then	    --2ms ; 1ms décalé à gauche de 1
--			elsif sclk = "00001011111010111100001000000000" then	    --2s ; 1s décalé à gauche de 1
				--C2
				Col<= "1101";   --0100 inversé
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "00110000110101001000" then	    --2,0...01ms
--			elsif sclk = "00001011111010111100001000001000" then	    --2,0...01s
				--R1
--				if Row = "1000" then		
                if Row = "1110" then
					Chiffre <= "00010"; --2
				--R2
--				elsif Row = "0100" then
				elsif Row = "1101" then
					Chiffre <= "00101"; --5
				--R3
--				elsif Row = "0010" then
				elsif Row = "1011" then
					Chiffre <= "01000"; --8
				--R4
--				elsif Row = "0001" then
				elsif Row = "0111" then
					Chiffre <= "01111"; --F
                else
                    Chiffre <= "10000"; --no input
				end if;
				sclk <= sclk+1;	
			--3ms
			elsif sclk = "01001001001111100000" then     --3ms ; 1ms + 2ms binaire
--			elsif sclk = "00010001111000011010001100000000" then     --3s ; 1s + 2s binaire
				--C3
				Col<= "1011";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "01001001001111101000" then     --3,0...01ms
--			elsif sclk = "00010001111000011010001100001000" then     --3,0...01s
				--R1
--				if Row = "1000" then
                if Row = "1110" then
					Chiffre <= "00011"; --3	
				--R2
--				elsif Row = "0100" then
				elsif Row = "1101" then
					Chiffre <= "00110"; --6
				--R3
--				elsif Row = "0010" then
				elsif Row = "1011" then
					Chiffre <= "01001"; --9
				--R4
--				elsif Row = "0001" then
				elsif Row = "0111" then
					Chiffre <= "01110"; --E
                else
                    Chiffre <= "10000"; --no input
				end if;
				sclk <= sclk+1;
			--4ms
			elsif sclk = "01100001101010000000" then 	--4ms ; 2ms décalé à gauche de 1
--			elsif sclk = "00010111110101111000010000000000" then 	--4s ; 2s décalé à gauche de 1
				--C4
				Col<= "0111";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "01100001101010001000" then     --4,0...01ms
--			elsif sclk = "00010111110101111000010000001000" then     --4,0...01s
				--R1
--				if Row = "1000" then
                if Row = "1110" then
					Chiffre <= "01010"; --A
				--R2
--				elsif Row = "0100" then
				elsif Row = "1101" then
					Chiffre <= "01011"; --B
				--R3
--				elsif Row = "0010" then
				elsif Row = "1011" then
					Chiffre <= "01100"; --C
				--R4
--				elsif Row = "0001" then
				elsif Row = "0111" then
					Chiffre <= "01101"; --D
                else
                    Chiffre <= "10000"; --no input
				end if;
				sclk <= "00000000000000000000";	
--				sclk <= "00000000000000000000000000000000";	
			else 
				sclk <= sclk+1;	
			end if;
		end if;
		
		end if;
	end process;
		
		
						 
end Behavioral;

