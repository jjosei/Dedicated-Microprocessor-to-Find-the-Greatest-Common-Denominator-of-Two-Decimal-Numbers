----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:13 09/17/2023 
-- Design Name: 
-- Module Name:    Datapath - Behavioral 
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








library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Datapath is port(
   INPUT_X : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	INPUT_Y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
   y_load, x_load : in std_logic;
	outX : in std_logic;
	muxsel1, muxsel2 : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	XnteqY : out std_logic;                    
   XltY : out std_logic;                    
   XgtY : out std_logic; 
   OUTPUT_X : out std_logic_vector(7 downto 0));	
end Datapath;




architecture Behavioral of Datapath is

    component dff_register is
      port ( D : in std_logic_vector(7 downto 0);
		       reset : in std_logic;
		       load : in std_logic;
             clk : in std_logic; 
             Q : out std_logic_vector(7 downto 0));
    end component dff_register;
	 
	 component dff_register2 is
      port ( D : in std_logic_vector(7 downto 0);
		       reset : in std_logic;
		       load : in std_logic;
             clk : in std_logic; 
             Q : out std_logic_vector(7 downto 0));
    end component dff_register2;
	 
    component multiplexer_2to1 is
    Port ( A : in std_logic_vector(7 downto 0);  
           B : in std_logic_vector(7 downto 0);  
           s : in std_logic;  
           Y : out std_logic_vector(7 downto 0) 
          );
    end component multiplexer_2to1;
	 
	 
	 component subtractor_8bit is
    Port ( A : in std_logic_vector(7 downto 0);  
           B : in std_logic_vector(7 downto 0);  
           Y : out std_logic_vector(7 downto 0)  
          );
    end component subtractor_8bit;
	 
	 
	 component comparator_8bit is
    Port ( X : in std_logic_vector(7 downto 0); 
           Y : in std_logic_vector(7 downto 0);  
           XnteqY : out std_logic;                    
           XltY : out std_logic;                    
           XgtY : out std_logic                     
          );
    end component comparator_8bit;
	 
	 
	 component tristate is
    Port (
        a    : in  STD_LOGIC_vector(7 downto 0);      
        s  : in  STD_LOGIC;   
        b    : out STD_LOGIC_vector(7 downto 0)    
    );
    end component tristate;
	 
	 
	 signal x_out : std_logic_vector(7 downto 0); 
	 signal y_out : std_logic_vector(7 downto 0);
	 signal x_in, y_in : std_logic_vector(7 downto 0); 
	 signal sub_in1, sub_in2 : std_logic_vector(7 downto 0); 
	 signal sub_out : std_logic_vector(7 downto 0);
	 signal tri_out : std_logic_vector(7 downto 0);
   begin
    reg1 : dff_register port map(D => x_in,
	                   reset => reset,
	                   load => x_load,
	                   Q => x_out,
							 clk => clk);

    reg2 : dff_register2 port map(D => y_in,
	                   reset => reset,
	                   load => y_load,
	                   Q => y_out,
							 clk => clk);

    m1 : multiplexer_2to1 port map(A => INPUT_X,
                                   B => sub_out,
                                   s => muxsel1, 											  
							              Y => x_in);
											  
	 m2 : multiplexer_2to1 port map(A => INPUT_Y,
                                   B => sub_out,
                                   s => muxsel1, 											  
							              Y => y_in);	
											  
    m3 : multiplexer_2to1 port map(A => x_out,
                                   B => y_out,
                                   s => muxsel2, 											  
							              Y => sub_in1);
											  
	 m4 : multiplexer_2to1 port map(A => y_out,
                                   B => x_out,
                                   s => muxsel2, 											  
							              Y => sub_in2);	

    sub1 :	subtractor_8bit port map(A => sub_in1,
                                     B => sub_in2,
                                     Y => sub_out);

    compara1 : comparator_8bit port map(X => x_out,												 
                                        Y => y_out,
													 XnteqY => XnteqY,
													 XltY => XltY,
													 XgtY => XgtY);
													 
	 tristate1 : tristate port map(a => x_out,
                                  s => outX,
                                  b => tri_out);											 
													 
												 
	OUTPUT_X <= tri_out;
	
end Behavioral;









