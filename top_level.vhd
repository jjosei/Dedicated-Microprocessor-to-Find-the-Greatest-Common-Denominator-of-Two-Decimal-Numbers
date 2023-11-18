----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:30:10 09/19/2023 
-- Design Name: 
-- Module Name:    top_level - Behavioral 
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


entity top_level is PORT(
  INPUT_X, INPUT_Y : STD_LOGIC_VECTOR(7 DOWNTO 0);
  CLK, RESET : IN STD_LOGIC;
  OUTPUT_X : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end top_level;

architecture Behavioral of top_level is


 COMPONENT Datapath is port(
   INPUT_X, INPUT_Y : STD_LOGIC_VECTOR(7 DOWNTO 0);
   y_load, x_load : in std_logic;
	outX : in std_logic;
	muxsel1, muxsel2 : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	XnteqY : out std_logic;                    
   XltY : out std_logic;                    
   XgtY : out std_logic;
	OUTPUT_X : out std_logic_vector(7 downto 0));
	  
 END COMPONENT;

 COMPONENT controlunit is port(
  XnteqY, XltY ,XgtY: in std_logic;
  reset, clk : in std_logic;
  y_load, x_load, muxsel1, muxsel2, outX : out std_logic);
 END COMPONENT;
 
 
 
 

 SIGNAL XnteqY : STD_LOGIC;
 SIGNAL XltY : STD_LOGIC;
 SIGNAL XgtY : STD_LOGIC;
 SIGNAL x_load : STD_LOGIC;
 SIGNAL y_load : STD_LOGIC;
 SIGNAL muxsel1, muxsel2 : STD_LOGIC;
 SIGNAL outX : STD_LOGIC;

begin

   unit1 : controlunit port map(XnteqY => XnteqY,
                             XltY => XltY,
									  XgtY => XgtY,
									  reset => RESET,
									  clk => CLK,
									  y_load => y_load,
									  x_load => x_load,
									  muxsel1 => muxsel1,
									  muxsel2 => muxsel2,
									  outX => outX);
									  
   unit2 : Datapath port map(INPUT_X => INPUT_X,
	                          INPUT_Y => INPUT_Y,
									  y_load => y_load,
									  x_load => x_load,
									  muxsel1 => muxsel1,
                             muxsel2 => muxsel2,									  
									  clk => CLK,
									  reset => RESET,
									  XnteqY => XnteqY,
                             XltY => XltY,
									  XgtY => XgtY,
									  outX => outX,
									  OUTPUT_X => OUTPUT_X);
								  
									  


end Behavioral;

