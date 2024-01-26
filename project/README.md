# VHDL project

### Topics

* TBD

## Instructions

TBD

The aim of the project is to cooperate in small teams, to study the subject, to design own solutions, to simulate, to implement, to create project documentation and to demonstrate the results. The distribution of roles and tasks within the team belongs to its members.

* Students work on a project **in the labs** during the 9th to 13th week of the semester. The practical demonstration will take place last week.

* Using BUT e-learning, students submit a link to the GitHub repository, which contains the project in Vivado, the necessary images, documents and a descriptive README file. **The submission deadline is the day before the demonstration.**

* The FPGA source codes must be written in VHDL and implementable on the Nexys A7-50T board in the development tools used in the laboratory during the semester.

* Make testbenches for all your new components.

* Physical implementation on FPGA is necessary, computer simulation is not sufficient.

## Help

* **Never, ever** use `rising_edge` or `falling_edge` to test edges of non-clock signals under any circumstances!

* Use hierarchical design, ie. instances, top-level, several files, etc.

* Use synchronous entities with `clk`.

* In a synchronous process, the first thing to do is test the clock edge, then synchronous reset. The only exception is asynchronous operations.

* Use only input `in` or output `out` ports and not ~~inout~~.

* Use `wait` statements [only in simulations](https://www.vhdl-online.de/courses/system_design/vhdl_language_and_syntax/sequential_statements/wait_statement).

* Except Vivado, you can use the following tools to simulate your VHDL design(s):
  * [EDA Playground](https://www.edaplayground.com/)
  * [TerosHDL](https://github.com/tomas-fryza/digital-electronics-1/wiki/How-to-install-TerosHDL-on-Windows-and-Linux)
  * [ghdl + GtkWave](https://github.com/tomas-fryza/digital-electronics-1/wiki/How-to-install-ghdl-on-Windows-and-Linux)

# Recommended README.md file structure

### Team members

* Member 1 (responsible for ...)
* Member 2 (responsible for ...)
* Member 3 (responsible for ...)

## Theoretical description and explanation

Enter a description of the problem and how to solve it.

## Hardware description of demo application

Insert descriptive text and schematic(s) of your implementation.

## Software description

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Component(s) simulation

Write descriptive text and simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos or a link to a video.

## References

1. Put here the literature references you used.
2. ...