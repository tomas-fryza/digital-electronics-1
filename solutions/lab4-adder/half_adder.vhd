-------------------------------------------------
--! @brief Half adder
--! @version 1.1
--! @copyright (c) 2019 Tomas Fryza, MIT license
--!
--! <detail>
--!
--! Developed using TerosHDL, Vivado 2020.2, and
--! EDA Playground. Tested on the Nexys A7-50T
--! board featuring the xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-------------------------------------------------

entity half_adder is
  port (
    b     : in    std_logic; --! Input b
    a     : in    std_logic; --! Input a
    carry : out   std_logic; --! Output carry
    sum   : out   std_logic  --! Output sum
  );
end entity half_adder;

-------------------------------------------------

architecture behavioral of half_adder is

begin

  -- Logic functions for carry and sum outputs
  carry <= b and a;
  sum   <= b xor a;

end architecture behavioral;