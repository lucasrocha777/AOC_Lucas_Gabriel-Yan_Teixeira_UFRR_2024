library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM is
    Port (
         clk  : in  std_logic;
         we   : in  std_logic; 
         addr : in  std_logic_vector(7 downto 0);  
         din  : in  std_logic_vector(7 downto 0);  
         dout : out std_logic_vector(7 downto 0)   
    );
end RAM;

architecture Behavioral of RAM is
    type ram_type is array (0 to 255) of std_logic_vector(7 downto 0);
    signal mem : ram_type := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                mem(to_integer(unsigned(addr))) <= din;
            end if;
            dout <= mem(to_integer(unsigned(addr)));
        end if;
    end process;
end Behavioral;
