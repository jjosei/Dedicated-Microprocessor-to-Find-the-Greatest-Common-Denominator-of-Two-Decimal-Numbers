----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:33 09/18/2023 
-- Design Name: 
-- Module Name:    d_ff - Behavioral 
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

entity dff_register2 is
  port ( D : in std_logic_vector(7 downto 0);
         reset : in std_logic;
         load : in std_logic;
         clk : in std_logic; 
         Q : out std_logic_vector(7 downto 0));
end dff_register2;


architecture my_d_ff of dff_register2 is
 begin
  dff: process(clk, load,reset)
   begin
	 if (reset = '1')then
	   Q <= "00000000";
    elsif (rising_edge(clk)) then
	  if(load = '1') then
      Q <= D;
	  end if;
    end if;
  end process dff;
end my_d_ff;
