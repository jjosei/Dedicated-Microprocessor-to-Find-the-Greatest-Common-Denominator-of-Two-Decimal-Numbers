library ieee;
use ieee.std_logic_1164.all;


entity tristate is
    Port (
        a    : in  STD_LOGIC_vector(7 downto 0);      
        s  : in  STD_LOGIC;   
        b    : out STD_LOGIC_vector(7 downto 0)   
    );
end tristate;

architecture Behavioral of tristate is
   
begin
    process (s,a)
    begin
        if s ='1' then 
            b <= a;   
        else
            b <= (others => 'Z');
        end if;
    end process;
	 
  
end Behavioral;
