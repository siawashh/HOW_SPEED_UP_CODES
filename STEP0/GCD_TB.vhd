--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:09:30 01/14/2022
-- Design Name:   
-- Module Name:   E:/learning/last/electronic/FPGA/maktabkhune base/FALSE 3/projects/Use_Of_ForGenerate/GCD_TB.vhd
-- Project Name:  Use_Of_ForGenerate
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GCD
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- unsigned for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
use IEEE.NUMERIC_STD.ALL;
 
ENTITY GCD_TB IS
END GCD_TB;
 
ARCHITECTURE behavior OF GCD_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GCD
    PORT(
         x 		 : IN  unsigned(3 downto 0);
         y 		 : IN  unsigned(3 downto 0);
         output : OUT  unsigned(3 downto 0);
         clk	 : IN  std_logic;
         En 	 : IN  std_logic;
			done	 : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : unsigned(3 downto 0) := (others => '0');
   signal y : unsigned(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal En : std_logic := '0';
   signal done : std_logic := '0';

 	--Outputs
   signal output : unsigned(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GCD PORT MAP (
          x => x,
          y => y,
          output => output,
          clk => clk,
          En => En,
			 done => done
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait for clk_period*10;
		wait until rising_edge(clk);
      -- insert stimulus here 
		en <= '0';
		X  <= to_unsigned(3,4); 
		y  <= to_unsigned(6,4); 
      wait for 10 ns;
		en <= '1';
		wait until done = '1';
		wait for 50 ns;
		
		en <= '0';
		X  <= to_unsigned(15,4); 
		y  <= to_unsigned(5,4); 
		wait for 10 ns;
		en <= '1';
		wait until done = '1';
		wait for 50 ns;
		
		en <= '0';
		X  <= to_unsigned(3,4); 
		y  <= to_unsigned(3,4); 
		wait for 10 ns;
		en <= '1';
		wait until done = '1';
		wait for 50 ns;
		en <= '0';
		
      wait;
   end process;

END;
-------------SIMULATION and CLK works only when the code is a TOP MODULE





