library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY proj is 
    PORT(    increment, reset,clock,enable,button        :     in     std_logic; Alarm: buffer std_logic;
            le1,le2,le3,le4,le5,le6    :    out     std_logic_vector(6 downto 0));
    end proj;
    
architecture behaviour of proj is
signal incout,decout,muxout : integer range 0 to 172800;
signal count,Al,Dout: std_logic;
component counter
port(clock: in std_logic;
    seconds : buffer std_Logic);
end component;
component incrementer
port( incButton,ResetButton, Enable: in std_logic;
timer : buffer integer range 0 to 172800); 
end component;
component decrementer
port(Enable,Clock,pressed : in std_logic; oldtimer : in integer range 0 to 172800;
 currenttimer : buffer integer range 0 to 172800;Alarm : out std_logic);
end component;
component BCD
PORT(timer : IN integer range 0 to 172800; LED1,LED2,LED3,LED4,LED5,LED6 : out std_logic_vector(6 downto 0));
end component;
component MUX
PORT(Slct: in std_logic;in0,in1 : integer range 0 to 172800;
    output: out integer range 0 to 172800);
end component;
component converter
port(int : in std_logic_vector(3 downto 0);
    led: out std_logic_vector(6 downto 0));
end component;
component alarmmaker 
PORT(w,button,clk :in std_logic;LED :out std_logic);
end component;
begin
setting: incrementer port map(increment,reset,enable,incout);
counting: counter port map(clock,count);
timing: decrementer port map(enable,count,Alarm,incout,decout,Al);
df: alarmmaker port map(Al,button,clock,Alarm);
selecting: MUX port map(enable,incout,decout,muxout);
displaying: BCD port map(muxout,le1,le2,le3,le4,le5,le6);
end behaviour;
