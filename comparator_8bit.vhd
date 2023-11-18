----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:07 09/18/2023 
-- Design Name: 
-- Module Name:    comparator_8bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comparator_8bit is
    Port ( X : in std_logic_vector(7 downto 0); 
           Y : in std_logic_vector(7 downto 0);  
           XnteqY : out std_logic;                    
           XltY : out std_logic;                   
           XgtY : out std_logic                     
          );
end comparator_8bit;


architecture Behavioral of comparator_8bit is
begin
    process (X, Y)
    begin
	   if (X = Y) then
        XnteqY <= '0';
        XltY <= '0';
        XgtY <= '0';		  
      elsif (X < Y) then
		  XnteqY <= '1';
        XltY <= '1';
        XgtY <= '0';
		elsif (X > Y) then
		  XnteqY <= '1';
        XltY <= '0';
        XgtY <= '1';
		else
        XnteqY <= '0';
        XltY <= '0';
        XgtY <= '0';		
		end if;  
		
        
    end process;
end Behavioral;




