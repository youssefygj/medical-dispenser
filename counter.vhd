library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY counter is
port(clock: in std_logic;
    seconds: buffer std_logic);
end counter;

architecture behaviour of counter is
signal counter : integer range 0 to 50000000;
begin
process(clock)
begin 
if counter = 50000000 then
    seconds <= '1';
    counter <= 0;
elsif  Clock'event and Clock = '1' then
    counter <= counter + 1;
    if seconds <= '1' then
        seconds <= '0';
    end if;
end if;
end process;
end behaviour;