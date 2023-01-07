library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity Compt_1cor is
generic (
   n : integer := 26
);
port (
   IN_100: in std_logic;
   Reset : in std_logic;
   OUT_1 : out std_logic
);
end Compt_1cor;

			
architecture struct of Compt_1cor is

signal compteur : std_logic_vector(n+1 downto 0);
signal out1_temp : std_logic;

begin

OUT_1 <= out1_temp;

 process(IN_100, Reset) is
 begin 
  if Reset ='1' then 
  compteur <= (others => '0' ); 
  out1_temp <= '1';
  elsif IN_100'event and IN_100 = '1' then
    if compteur < x"2FAF07F" then 
       compteur <= compteur + x"0000001"; 
    elsif compteur = x"2FAF07F" then
       compteur <= (others => '0' );
       out1_temp <= not(out1_temp);
    end if; 
  end if;
 end process; 


  
end struct;