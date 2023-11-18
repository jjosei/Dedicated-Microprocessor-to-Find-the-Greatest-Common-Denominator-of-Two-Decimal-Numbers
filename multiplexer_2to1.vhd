----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:47 09/18/2023 
-- Design Name: 
-- Module Name:    multiplexer_2to1 - Behavioral 
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
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexer_2to1 is
    Port ( A : in std_logic_vector(7 downto 0);  
           B : in std_logic_vector(7 downto 0);  
           s : in std_logic;  
           Y : out std_logic_vector(7 downto 0) 
          );
end multiplexer_2to1;

architecture Behavioral of multiplexer_2to1 is
begin
    process (A, B, s)
    begin
        if s = '0' then
            Y <= A;
        else
            Y <= B;
        end if;
    end process;
end Behavioral;


