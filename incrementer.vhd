library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity incrementer is 
port( incButton,ResetButton, Enable: in std_logic;
timer : buffer integer range 0 to 172800); 
end incrementer;

architecture behaviour of incrementer is
begin
process(incButton,ResetButton)
begin
if Enable = '0' then
    if ResetButton = '0' then
        timer <= 0;
    elsif incButton'event and incButton = '0' then
        timer <= timer + 1;
    end if;
end if;
end process;
end behaviour;