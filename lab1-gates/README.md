# Lab 1: Introduction to VHDL and basic gates

<!--
![Logo](../../logolink_eng.jpg)
<p align="center">
  The Study of Modern and Developing Engineering BUT<br>
  CZ.02.2.69/0.0/0.0/18_056/0013325
</p>

![Screenshot od EDA Playground](images/screenshot_eda.png)
-->

* [Pre-Lab preparation](#preparation)
* [Part 1: Vivado](#part1)
* [Part 2: DeMorgans laws](#part2)
* [Experiments on your own](#experiments)
* [References](#references)

### Learning objectives

After completing this lab you will be able to:

* Understand basic structure of VHDL files
* Use Vivado development tool

In this laboratory exercise, you will learn how to compose a basic VHDL code using Vivado development tool.

<a name="preparation"></a>

## Pre-Lab preparation

1. Remind yourself the AND, OR, XOR gates.

2. Optional: If you don't have/want to use Google or Facebook account, register your account on [EDA Playground](https://www.edaplayground.com/home).

<a name="part1"></a>

## Part 1: Vivado

[Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html) is a comprehensive design environment developed by Xilinx (AMD) for the design, analysis, and implementation of programmable logic devices, such as FPGAs (Field-Programmable Gate Arrays) and SoCs (System on Chips). It provides a set of tools and features for digital design, synthesis, simulation, and implementation of electronic systems.

1. Run Vivado and create a new project:

   * Project name: `BasicGates`
   * Project location: your working folder, such as `Documents`
   * Project type: **RTL Project**
   * Create a new VHDL source file: `gates`
   * Do not add any constraints now
   * Choose a default board: `Nexys A7-50T` (will be used later in the lab)
   * Click **Finish** to create the project
   * Click **OK** to define an empty module

2. Open generated `gates.vhd` file in **Design Sources** and copy/paste the following code to it.

   ```vhdl
   library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

   entity gates is
      Port (
         A, B, C : in  STD_LOGIC;
         AND_Out, OR_Out, NOT_Out : out  STD_LOGIC
      );
   end gates;

   architecture Behavioral of gates is
   begin
      -- 2-input AND gate
      AND_Out <= A and B;

      -- 2-input OR gate
      OR_Out <= A or B;

      -- NOT gate
      NOT_Out <= not C;

   end Behavioral;
   ```

3. Take a look at the basic parts of the VHDL source code, such as [entity](https://github.com/tomas-fryza/vhdl-course/wiki/Entity), [architecture](https://github.com/tomas-fryza/vhdl-course/wiki/Architecture), and testbench.

   The usefull VHDL operators are shown in the table.

   | **Operator** | **Description** |
   | :-: | :-- |
   | `<=` | Value assignment |
   | `and` | Logical AND |
   | `nand` | Logical AND with negated output |
   | `or` | Logical OR |
   | `nor` | Logical OR with negated output |
   | `not` | Nagation |
   | `xor` | Exclusive OR |
   | `xnor` | Exclusive OR with negated output |
   | `-- comment` | Comments |

4. Use **File** > **Add Sources... Alt+A** > **Add or create simulation sources** and create a new VHDL file `tb_gates` (same filename as tested entity with prefix `tb_`). Again, click **OK** to define an empty module. You will find the new simulation file in **Simulation Sources > sim_1**. Copy/pase the following testbench to `tb_gates.vhd` file. **Important:** Make sure you are modifying `tb_*.vhd` file!

   ```vhdl
   library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

   entity tb_gates is
     -- Entity of testbench is always empty
   end tb_gates;

   architecture testbench of tb_gates is
      signal sig_A, sig_B, sig_C : STD_LOGIC;
      signal sig_AND_Out, sig_OR_Out, sig_NOT_Out : STD_LOGIC;

   begin
      -- Instantiate the design under test (DUT)
      DUT : entity work.gates
         port map (
            sig_A, sig_B, sig_C,
            sig_AND_Out, sig_OR_Out, sig_NOT_Out
         );

      -- Test stimulus
      stimulus_process: process
      begin
         sig_C <= '0'; sig_B <= '0'; sig_A <= '0'; wait for 100 ns;
         sig_C <= '0'; sig_B <= '0'; sig_A <= '1'; wait for 100 ns;
         sig_C <= '0'; sig_B <= '1'; sig_A <= '0'; wait for 100 ns;
         sig_C <= '0'; sig_B <= '1'; sig_A <= '1'; wait for 100 ns;

         -- WRITE OTHER TEST CASES HERE

         wait;
      end process stimulus_process;

   end testbench;
   ```

4. Use **Flow** > **Run Simulation** > **Run Behavioral Simulation** and run Vivado simulator. To see the whole simulated signals, it is recommended to select **View > Zoom Fit**.

   > To cleanup generated files, close simulation window, right click to SIMULATION or Run Simulation option, and select **Reset Behavioral Simulation**.
   >
   > ![Reset simulation](images/screenshot_vivado_reset_simul.png)

5. Use **Flow** > **Open Elaborated design** and see the schematic after RTL analysis. Note that RTL (Register Transfer Level) represents digital circuit at the abstract level.

<a name="part2"></a>

## Part 2: DeMorgans laws

De Morgan's laws are two fundamental rules in Boolean algebra that are used to simplify Boolean expressions. There are two versions of De Morgan's laws. De Morgan's law for AND: The complement of the product of two operands is equal to the sum of the complements of the operands. De Morgan's law for OR: The complement of the sum of two operands is equal to the product of the complements of the operands.

1. Create a new Vivado project or modify both files `gates.vhd` and `tb_gates.vhd` from the previous example according to [Example of basic gates](https://www.edaplayground.com/x/5L92) from EDA Playground.

2. Use De Morgan's laws and modify the original function to the form with NAND and NOR gates only. Verify all three functions in Vivado.

   > **Help:** De Morgan's laws are defined as follows:
   >
   > ![demorgan](images/demorgan.png)

   <!--
   \begin{align*}
      \overline{a\cdot b} =&~ \overline{a} + \overline{b}\\
      \overline{a+b} =&~ \overline{a}\cdot \overline{b}\\
   \end{align*}
   -->

   ![Logic function](images/equations.png)

   > Note that, equations were generated by [Online LaTeX Equation Editor](https://www.codecogs.com/latex/eqneditor.php) using the following code.
   >
   > ```LaTeX
   > \begin{align*}
   >    f_{\textup{ORIG}}(c,b,a) =&~ (\overline{c\cdot b}) + (\overline{b}\cdot a)\\
   >    f_{\textup{(N)AND}}(c,b,a) =&\\
   >    f_{\textup{(N)OR}}(c,b,a) =&\\
   > \end{align*}
   > ```

<a name="experiments"></a>

## Experiments on your own

1. In Vivado, verify the Distributive laws:

  First Distributive law:

  ![Distributive law1](images/distributive1.png)

<!--
\begin{align*}
   \textup{left}(c,b,a)  =&~a\cdot b + a\cdot c\\
   \textup{right}(c,b,a) =&~a\cdot (b+c)\\
\end{align*}
-->

  Second Distributive law:

  ![Distributive law2](images/distributive2.png)

<!--
\begin{align*}
    \textup{left}(c,b,a)  =&~(a+b)\cdot (a+c)\\
    \textup{right}(c,b,a) =&~a+ (b\cdot c)\\
\end{align*}
-->

2. Apart from the professional Vivado tool that takes up a significant amount of local disk storage, there are other simulation tools available, such as TerosHDL and ghdl.

TerosHDL is a high-performance VHDL simulator that is designed for FPGA and ASIC design. It is known for its speed and accuracy, and it is often used for large-scale designs. GHDL is a free and open-source VHDL simulator that is a popular choice for hobbyists and students. It is a good option for learning VHDL and for simulating small-scale designs.

* [How to install TerosHDL on Windows and Linux](https://github.com/tomas-fryza/vhdl-course/wiki/How-to-install-TerosHDL-on-Windows-and-Linux)
* [How to install ghdl on Windows and Linux](https://github.com/tomas-fryza/vhdl-course/wiki/How-to-install-ghdl-on-Windows-and-Linux)

3. You can also try several online graphics simulators, such as [CircuitVerse](https://circuitverse.org/), [Logicly](https://logic.ly/), [CircuitLab](https://www.circuitlab.com/), [simulatorIO](https://simulator.io/), [LogicEmu](https://lodev.org/logicemu/), and compare their options.

<a name="references"></a>

## References

1. Tomas Fryza. [Example of basic OR, AND, XOR gates](https://www.edaplayground.com/x/5L92)

2. CodeCogs. [Online LaTeX Equation Editor](https://www.codecogs.com/latex/eqneditor.php)

3. CircuitVerse. [Online Digital Logic Circuit Simulator](https://circuitverse.org/)

4. Bowler Hat LLC. [Logicly - A logic circuit simulator for Windows and macOS](https://logic.ly/)

5. CircuitLab, Inc. [Online circuit simulation & schematic editor](https://www.circuitlab.com/)

6. Bastian Born. [simulatorIO - Build and simulate logic circuits](https://simulator.io/)

7. Lode Vandevenne. [LogicEmu: Online Logic Simulator](https://lodev.org/logicemu/)