----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:32 09/14/2023 
-- Design Name: 
-- Module Name:    controlunit - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlunit is port(
  XnteqY, XltY ,XgtY: in std_logic;
  reset, clk : in std_logic;
  outX, y_load, x_load, muxsel1, muxsel2  : out std_logic);
end controlunit;

architecture Behavioral of controlunit is
  type state_type is (S0,S1,S2,S3,S4);
  signal PS, NS : state_type;
  signal control: std_logic_vector(4 downto 0);
begin
  x_load <= control(4);
  y_load <= control(3);
  muxsel1 <= control(2);
  muxsel2 <= control(1);
  outX <= control(0);
  
  sync:process(reset,clk,NS)
	begin
		if (reset='1') then 
			PS <= S0;
		elsif (rising_edge(clk)) then
			PS <= NS;
		end if;
		
	end process sync;
	
	
  combinato:process(XnteqY,XltY,XgtY,PS)
   begin
	   case (PS) is 
		   when S0 =>
			   control <= "11000";
				NS <= S1;
				
			when S1 =>
				control <= "00000";
				if (XnteqY = '0') then 
					NS <= S4;
				elsif(XltY = '1') then 
					NS <= S2;
				elsif(XgtY = '1') then
               NS <= S3;	
            else 
				   NS <= S0;
				
				end if;
				
			when S2 =>
				control <= "01110";
					NS <= S1;
			when S3 =>
				control <= "10100";
					NS <= S1;
			when S4 =>
				control <= "00001";
				   NS <= S4;
			when OTHERS =>
				control <= "00000";
					NS <= S0;
				
		end case;
	end process combinato;
	

end Behavioral;

