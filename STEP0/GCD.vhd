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
use IEEE.NUMERIC_STD.ALL; --- for can do + or - or = even can + 1 or = 7 at 
										----"unsigned" without converting type
entity GCD is
generic (n : integer := 4);
port(
x ,y 	  : in  unsigned (n-1 downto 0);
output  : out unsigned (n-1 downto 0);
clk ,En : in  std_logic;
done	  : out std_logic
);
end GCD;

architecture Behavioral of GCD is
--FSM
type state is(idle,check,finish) ;
signal GCD1 : state := idle;
signal reg :  unsigned ((2*n)-1 downto 0) := (others => '0');
signal x1 ,y1 :  unsigned (n-1 downto 0) 		:= (others => '0');
begin

process(clk,en)
	begin
		if En = '0' then 
			output <= (others => '0');
			GCD1 <= idle;
		elsif rising_edge(clk) then
		done <= '0';
			case GCD1 is 
			when idle =>
				x1 <= x;
				Y1 <= y;
				GCD1 <= check;
			when check =>
					if x1 < y1 then
						y1 <= Y1 - x1;			--- bigger = bigger - smaller
					elsif x1 > y1 then
						x1 <= x1 - y1;			--- bigger = bigger - smaller
					elsif x1 = y1 then
						GCD1 <= finish;
					end if;
			when finish =>	
				output <= y1;
				done <= '1';
			end case;
		end if;		
end process;
end Behavioral;

