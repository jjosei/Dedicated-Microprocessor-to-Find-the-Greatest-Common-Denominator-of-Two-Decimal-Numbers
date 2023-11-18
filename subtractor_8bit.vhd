----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:51 09/18/2023 
-- Design Name: 
-- Module Name:    subtractor_8bit - Behavioral 
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

entity subtractor_8bit is
    Port ( A : in std_logic_vector(7 downto 0);  
           B : in std_logic_vector(7 downto 0);  
           Y : out std_logic_vector(7 downto 0)  
          );
end subtractor_8bit;

architecture Behavioral of subtractor_8bit is
begin
    process (A, B)
    begin
        Y <= A - B;
    end process;
end Behavioral;



