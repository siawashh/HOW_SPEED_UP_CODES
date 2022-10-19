----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:37:43 01/14/2022 
-- Design Name: 
-- Module Name:    GCD - Behavioral 
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
use IEEE.NUMERIC_STD.ALL; 
-- standard library(std)
entity GCD is
generic (n : integer := 4);
port(
x ,y 	  : in  unsigned (n-1 downto 0);				-- use unsigned when do math(std)
output  : out unsigned (n-1 downto 0);
clk ,En : in  std_logic;								-- use std_logic for 1 bit (std)
done	  : out std_logic
);
end GCD;

architecture Behavioral of GCD is
--FSM
type state is(idle,check,finish) ;
signal GCD1 : state := idle;
signal reg :  unsigned ((2*n)-1 downto 0) := (others => '0');
signal x1 ,y1,output1 :  unsigned (n-1 downto 0) 		:= (others => '0');
signal en1,done1 : std_logic;
begin

output 	<= output1;			-- wire out reg to out (std)
done		<= done1;
process(clk) -- synch code(std)
	begin
		if rising_edge(clk) then	
		done1 <= '0';				-- over read preventer
		en1 <= en;					-- register all I/O ports except clk then work with regs(std)
			case GCD1 is 
			when idle =>			
				x1 <= x;
				Y1 <= y;
				GCD1 <= check;
			when check =>
					if x1 < y1 then			-- use lesser of elsif(std)
						y1 <= Y1 - x1;			--- bigger = bigger - smaller
					end if;
					if x1 > y1 then
						x1 <= x1 - y1;			--- bigger = bigger - smaller
					end if;
					if x1 = y1 then
						GCD1 <= finish;
					end if;
			when finish =>	
				output1 <= y1;
				done1 <= '1';
			end case;
			
			if En1 = '0' then 				-- synch en (std)
			output1 <= (others => '0');
			GCD1 <= idle;
			end if;
		end if;		-- all of the code must be inside clk's if (std)
end process;
end Behavioral;

