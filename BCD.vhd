library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

ENTITY BCD IS
PORT(timer : IN integer range 0 to 172800; LED1,LED2,LED3,LED4,LED5,LED6 : out std_logic_vector(6 downto 0));
END BCD;

architecture behaviour of BCD is
component converter 
port(int : in std_logic_vector(3 downto 0);
    led: out std_logic_vector(6 downto 0));
end component;


signal l1,l2,l3,l4,l5,l6 : std_logic_vector(3 downto 0);
signal sec,min,hr: integer range 0 to 59;
signal totalMinutes : integer range 0 to 172800;
begin


sec <= timer MOD 60;
totalMinutes <= (timer - sec)/60;
min <= totalMinutes MOD 60;
hr <= ( totalMinutes- min)/60;


l1 <= conv_std_logic_vector((sec MOD 10),4);
l2 <= conv_std_logic_vector(((sec - (sec MOD 10))/10),4);
l3 <= conv_std_logic_vector((min MOD 10),4);
l4 <= conv_std_logic_vector(((min - (min MOD 10))/10),4);
l5 <= conv_std_logic_vector((hr MOD 10),4);
l6 <= conv_std_logic_vector(((hr - (hr MOD 10))/10),4);

Dis1: converter port map(l1,LED1);
Dis2:    converter port map(l2,LED2);
Dis3: converter port map(l3,LED3);
Dis4: converter port map(l4,LED4);
Dis5: converter port map(l5,LED5);
Dis6: converter port map(l6,LED6);
end behaviour;