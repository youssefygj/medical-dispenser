library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

ENTITY MUX IS
PORT(Slct: in std_logic;in0,in1 : integer range 0 to 172800;
	output: out integer range 0 to 172800);
end MUX;

architecture behaviour of MUX is
begin
output <= in0 when slct = '0' else in1;
end behaviour;