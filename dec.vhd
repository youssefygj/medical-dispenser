library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity decrementer is
port(Enable,Clock,pressed : in std_logic; oldtimer : in integer range 0 to 172800;
 currenttimer : buffer integer range 0 to 172800; alarm : out std_logic);
end decrementer;

ARCHITECTURE behaviour of decrementer is
begin

process(Clock)
begin
if Enable = '1' then
    if Clock'event and Clock = '1' then
        if currenttimer  = 0 then
            Alarm <= '1';
            currenttimer <= oldtimer;
        elsif  pressed='0' then
        currenttimer <= currenttimer - 1;
		  Alarm<='0';
        end if;
    end if;
else
currenttimer <= oldtimer;
end if;
end process;

end behaviour;