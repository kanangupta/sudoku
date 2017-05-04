Sudoku Solver in MATLAB(R)

This is a MATLAB(R) program designed to solve sudoku puzzles of the 9x9 
kind using a brute force algorithm called backtracking. 

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License in the LICENSE.md file for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Backtracking is a type of brute force search for possible solutions. 
Backtracking is a depth-first search (in contrast to a breadth-first 
search), because it will completely explore one branch to a possible 
solution before moving to another branch. Due to the vast amount of
computational power available in modern personal computers, brute force
is a practical method to solve Sudoku puzzles. This program solves most
Sudoku puzzles in about a second, which is an acceptable execution time
for brute force approach to solving Sudokus.

HOW TO USE THIS PROGRAM

	I	PURPOSE
	II	SYSTEM REQUIREMENTS
	III	INSTALLATION
	IV	EXECUTION
	V	SUPPORT

I	PURPOSE

	This program solves 9x9 Sudoku puzzles using a brute force algorithm called
	Backtracking. This brute force algorithm visits the empty cells in some order,
	filling in digits sequentially, or backtracking when the number is found to
	be not valid. Briefly, a program would solve a puzzle by placing the
	digit "1" in the first cell and checking if it is allowed to be there.
	If there are no violations (checking row, column, and box constraints) then
	the algorithm advances to the next cell, and places a "1" in that cell.
	When checking for violations, if it is discovered that the "1" is not allowed,
	the value is advanced to "2". If a cell is discovered where none of the 9
	digits is allowed, then the algorithm leaves that cell blank and moves back
	to the previous cell. The value in that cell is then incremented by one.
	This is repeated until the allowed value in the last (81st) cell is discovered.

	Advantages of this method are:

		1.	A solution is guaranteed (as long as the puzzle is valid).
		2.	Solving time is mostly unrelated to degree of difficulty.

II	SYSTEM REQUIREMENTS

		1 gigahertz (GHz) or faster 32-bit (x86) or 64-bit (x64) processor
		1 gigabyte (GB) RAM (32-bit) or 2 GB RAM (64-bit)
		MATLAB(R) R2015a or later installed
		
	-OR-

		Computer with Internet access
		Browser capable of running MATLAB(R) Online (Chrome 50 or later should be fine)
	
III	INSTALLATION
	
	This program doesn't need to be installed to run. However, you need to have either
	MATLAB(R) R2015a or later installed or access to a MATLAB(R) Online account to run
	this program. Depending upon what you have, either upload the 'sudoku.m' file to
	your MATLAB(R) Online working directory or open it in MATLAB(R) installed in your
	system. This program has been written in MATLAB(R) R2015a, MATLAB(R) R2016a and
	MATLAB(R) Online (R2017a at the time of writing), so it will run fine on any of these
	versions of MATLAB(R). It will run on newer versions and may run on older versions,
	but this hasn't been tested.
	
IV	EXECUTION
	
	Once you have the file open in MATLAB(R), run this program by clicking on the 'Run'
	button in the EDITOR tab. The code will run without any arguments and ask the user 
	for the input Sudoku puzzle before proceeding.

	If the user already has 9x9 matrices of Sudoku puzzles in the workspace, then typing
	'sudoku(Sample1)' in the command window will run the program where 'Sample1' is an
	example input matrix.
	
	Read the HTML readme for more help on this.
	
V	SUPPORT
	
	
	
This program has been written in MATLAB(R) R2015a, MATLAB(R) R2016a and
MATLAB(R) Online (R2017a at the time of writing)