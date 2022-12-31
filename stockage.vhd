----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2022 22:25:33
-- Design Name: 
-- Module Name: stockage - Behavioral
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

entity stockage is
    Port ( RESET : out STD_LOGIC;
           clk : in STD_LOGIC;
           Chiffre : in STD_LOGIC_VECTOR (3 downto 0);
           Nb1 : out STD_LOGIC_VECTOR (15 downto 0);
           Nb2 : out STD_LOGIC_VECTOR (15 downto 0);
           Operator : out STD_LOGIC_VECTOR (1 downto 0);
           Progress : out STD_LOGIC_VECTOR (1 downto 0));
end stockage;

architecture Behavioral of stockage is

signal intReset : STD_LOGIC := '0';

signal intProgress : STD_LOGIC_VECTOR (1 downto 0) := "00";

signal intOperator : STD_LOGIC_VECTOR (1 downto 0) := "00";

signal modeReg1 : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal modeReg2 : STD_LOGIC_VECTOR (1 downto 0) := "00";

signal InDecalRightRegistreNb : STD_LOGIC_VECTOR (3 downto 0) := "1111";
signal InDecalLeftRegistreNb1 : STD_LOGIC_VECTOR (3 downto 0) := "1111";
signal InDecalLeftRegistreNb2 : STD_LOGIC_VECTOR (3 downto 0) := "1111";

signal signNb1registre : STD_LOGIC_VECTOR (3 downto 0) := "1111";
signal signNb2registre : STD_LOGIC_VECTOR (3 downto 0) := "1111";

signal EntreRegistreNb1 : STD_LOGIC_VECTOR (15 downto 0) := "1010111111111111";
signal EntreRegistreNb2 : STD_LOGIC_VECTOR (15 downto 0) := "1010111111111111";

signal registreNb1 : STD_LOGIC_VECTOR (15 downto 0) := "1010111111111111";
signal registreNb2 : STD_LOGIC_VECTOR (15 downto 0) := "1010111111111111";

begin

InDecalLeftRegistreNb1 <= Chiffre;
InDecalLeftRegistreNb2 <= Chiffre;
Nb1 <= registreNb1;
Nb2 <= registreNb2;

registreProgress : entity work.registre port map (RESET => intRESET, clk => clk, InRegistre => intProgress, OutRegistre => Progress);
registreOperator : entity work.registre port map (RESET => intRESET, clk => clk, InRegistre => intOperator, OutRegistre => Operator);
registreUnivNb1 : entity work.RegistreUniv port map (RESET => intRESET, clk => clk, Mode => modeReg1, InRegistre => EntreRegistreNb1, InDecalLeftRegistre => InDecalLeftRegistreNb1, InDecalRightRegistre => InDecalRightRegistreNb, OutRegistre => registreNb1);
registreUnivNb2 : entity work.RegistreUniv port map (RESET => intRESET, clk => clk, Mode => modeReg2, InRegistre => EntreRegistreNb2, InDecalLeftRegistre => InDecalLeftRegistreNb2, InDecalRightRegistre => InDecalRightRegistreNb, OutRegistre => registreNb2);

fonctionement : process (clk)
begin
	if (Chiffre = "0000" or Chiffre = "0001" or Chiffre = "0010" or Chiffre = "0011" or Chiffre = "0100" or Chiffre = "0101" or Chiffre = "0110" or Chiffre = "0111" or Chiffre = "1000" or Chiffre = "1001") then	--nombre
		if (intProgress = "10") then      --Progress = 2 => RESET
			intReset <= '1';
		elsif (intProgress = "00") then
            modeReg1 <= "01";             --decal left regNB1
            modeReg2 <= "00";             --ne rien faire avec reg2
		else				              --Progress = 1
            modeReg1 <= "00";             --ne rien faire avec reg1
            modeReg2 <= "01";             --decal left regNB2
		end if;
	end if;

	if (Chiffre = "1010" or Chiffre = "1011") then  -- + ou -
		if (intProgress = "10") then      --Progress = 2 => RESET
			intReset <= '1';
		else
			if (intProgress = "00" and registreNb1(3 downto 0) = "1111") then -- reg1 vide => signe
				signNb1registre <= Chiffre;
			elsif (intProgress = "01" and registreNb2(3 downto 0) = "1111") then -- reg2 vide => signe
				signNb2registre <= Chiffre;
			else 		                  -- => operation
				intProgress <= "01";
				if (Chiffre = "1010") then  -- +
					intOperator <= "00";  -- +
				else
					intOperator <= "01";  -- -
				end if;
			end if;
		end if;
        modeReg1 <= "00";                 --ne rien faire avec reg1
        modeReg2 <= "00";                 --ne rien faire avec reg2
	end if;

	if (Chiffre = "1100") then            --*
		if (intProgress = "10") then      --Progress = 2 => RESET
			intReset <= '1';
		else
			intProgress <= "01";
			intOperator <= "10"; 		  --*
        end if;
        modeReg1 <= "00";                 --ne rien faire avec reg1
        modeReg2 <= "00";                 --ne rien faire avec reg2

    end if;
  

	if (Chiffre = "1101") then            --delete
		if (intProgress = "10") then      --Progress = 2 => RESET
			intReset <= '1';
		elsif (intProgress = "00") then   --progress = 0
            modeReg1 <= "10";             --decal right regNB1
            modeReg2 <= "00";             --ne rien faire avec reg2
		else                              --progress = 1
            modeReg1 <= "00";             --ne rien faire avec reg1
            modeReg2 <= "10";             --decal right regNB2
        end if;
    end if;

	if (Chiffre = "1110") then	          --Calc
		if (intProgress = "00") then      --Progress = 0 => RESET
			intReset <= '1';
		elsif (intProgress = "01") then   --progress = 1 => Calcul
			intProgress <= "10";
		-- if Progress = 2 => do nothing
        end if;
        modeReg1 <= "00";                 --ne rien faire avec reg1
        modeReg2 <= "00";                 --ne rien faire avec reg2
    end if;

	if (Chiffre = "1111" or intReset = '1') then --reset
		reset <= '1';
        modeReg1 <= "11";                 --charge valeurs default de reg1
        modeReg2 <= "11";                 --charge valeurs default de reg2
		intProgress <= "00";
		intOperator <= "11";			  -- aucune valeur
	end if;

end process fonctionement;
end Behavioral;
