library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity alarmmaker is
PORT(w,button,clk :in std_logic;LED: out std_logic);
end alarmmaker;

architecture behavior of alarmmaker is
begin
process
begin
wait until clk'EVENT and clk='1';
if button='1' THEN
LED<='0';
ELSIF w='1' THEN
LED<='1';
END IF;
END PROCESS;
end behavior;