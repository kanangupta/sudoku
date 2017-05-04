Sudoku Solver in MATLAB(R)
--------------------------

This is a MATLAB(R) program designed to solve 9x9 sudoku puzzles using
candidate-checking and a brute force algorithm called backtracking. 

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

#### HOW TO USE THIS PROGRAM

######	I	PURPOSE
######	II	SYSTEM REQUIREMENTS
######	III	INSTALLATION
######	IV	EXECUTION
######	V	SAMPLES
######	VI	SUPPORT

####	I	PURPOSE

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

####	II	SYSTEM REQUIREMENTS
   
   This program was made and tested on two systems with the following specifications:
   
######	System 1

	Intel Core i7 2.5 Ghz (Turbo Boost 3.5 Ghz)
	8 GB DDR3 RAM
	Intel HD 4600 Integrated Graphics
	NVIDIA GTX 860M Dedicated GPU with 4 GB GDDR5 Memory
	Windows 10 Pro 64-bit Build 1703 (Creator's Update)
	MATLAB(R) R2015a
	
######	System 2

	Intel Core i3 1.8 Ghz
	6 GB DDR3 RAM
	Intel HD 4000 Integrated Graphics
	Windows 10 Home Single Language 64-bit Build 1607
	MATLAB(R) R2016a

   Any computer with Internet access which is powerful enough to run
   MATLAB(R) R2015a or later should be able to run this program just fine.
   
   To run on MATLAB(R) Online, you'll need a computer with a web browser capable
   of running MATLAB(R) Online (Chrome 50 or later should be fine).

####	III	INSTALLATION
	
This program doesn't need to be installed to run. However, you need to have either
MATLAB(R) R2015a or later installed or access to a MATLAB(R) Online account to run
this program. Depending upon what you have, either upload the 'sudoku.m' file to
your MATLAB(R) Online working directory or open it in MATLAB(R) installed in your
system. This program has been written in MATLAB(R) R2015a, MATLAB(R) R2016a and
MATLAB(R) Online (R2017a at the time of writing), so it will run fine on any of these
versions of MATLAB(R). It will run on newer versions and may run on older versions,
but this hasn't been tested.
	
####	IV	EXECUTION
	
Once you have the file open in MATLAB(R), run this program by clicking on the 'Run'
button in the EDITOR tab. Alternatively, change the working directory to the one
containing the 'sudoku.m' file, and enter 'sudoku' in the command window. The code will
run without any arguments and ask the user for the input Sudoku puzzle before proceeding.

If the user already has 9x9 matrices of Sudoku puzzles in the workspace, then typing
'sudoku(Sample1)' in the command window will run the program where 'Sample1' is an
example input matrix.
	
####	V	SAMPLES
	
Here are some sample Sudoku puzzles pretyped for testing the code:
	
	S1 = [7 9 0 0 0 0 3 0 0; 0 0 0 0 0 6 9 0 0;8 0 0 0 3 0 0 7 6;0 0 0 0 0 5 0 0 2;0 0 5 4 1 8 7 0 0; 4 0 0 7 0 0 0 0 0;6 1 0 0 9 0 0 0 8;0 0 2 3 0 0 0 0 0;0 0 9 0 0 0 0 5 4]
	S2 = [0 8 0 0 0 0 2 0 0;0 0 0 0 8 4 0 9 0;0 0 6 3 2 0 0 1 0;0 9 7 0 0 0 0 8 0;8 0 0 9 0 3 0 0 2;0 1 0 0 0 0 9 5 0;0 7 0 0 4 5 8 0 0;0 3 0 7 1 0 0 0 0;0 0 8 0 0 0 0 4 0]
	S3 = [0 0 5 0 0 9 0 0 1; 0 1 0 0 6 0 0 9 0;7 0 0 1 0 0 2 0 0;9 0 0 7 0 0 4 0 0;0 8 0 0 4 0 0 3 0; 0 0 2 0 0 8 0 0 6;0 0 9 0 0 6 0 0 2;0 5 0 0 9 0 0 1 0;8 0 0 4 0 0 7 0 0]
	S4 = [4 0 0 0 2 0 0 0 3; 0 0 0 8 0 6 0 0 0;0 0 1 0 5 0 7 0 0;0 7 0 0 0 0 0 1 0;5 0 2 0 9 0 4 0 7; 0 4 4 0 0 0 0 6 0;0 0 9 0 8 0 2 0 0;0 0 0 2 0 1 0 0 0;8 0 0 0 6 0 0 0 5]
	B = [ 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0 1]
	
#####	SAMPLE RUN WITHOUT ARGUMENT
	
	>> sudoku
                   Sudoku Solver
    Copyright(C) 2017  Kanan Gupta & Sk Zafar Ali
 
	 This program comes with ABSOLUTELY NO WARRANTY; 
	 This is free software under the GNU GPLv3 license and you are welcome to
	 redistribute it under certain conditions.
	 For more information, read the LICENSE and README files. 
	 
	 Please input the sudoku puzzle as a 9x9 matrix of integers 1 to 9, and 0 for blank spaces.
	 Each entry in each row should be an integer from 0 to 9, separated by a space.
	 Each row should be separated by a semicolon (;). The input should be enclosed in square brackets [ ].
	 For example, a 3x3 matrix would be written like this: [1 2 3;4 5 6;7 8 9].
	 [0 0 5 0 0 9 0 0 1; 0 1 0 0 6 0 0 9 0;7 0 0 1 0 0 2 0 0;9 0 0 7 0 0 4 0 0;0 8 0 0 4 0 0 3 0; 0 0 2 0 0 8 0 0 6;0 0 9 0 0 6 0 0 2;0 5 0 0 9 0 0 1 0;8 0 0 4 0 0 7 0 0]

	X =

		 0     0     5     0     0     9     0     0     1
		 0     1     0     0     6     0     0     9     0
		 7     0     0     1     0     0     2     0     0
		 9     0     0     7     0     0     4     0     0
		 0     8     0     0     4     0     0     3     0
		 0     0     2     0     0     8     0     0     6
		 0     0     9     0     0     6     0     0     2
		 0     5     0     0     9     0     0     1     0
		 8     0     0     4     0     0     7     0     0

	The solved sudoku is :

	 6  2  5  3  7  9  8  4  1 
	 3  1  8  2  6  4  5  9  7 
	 7  9  4  1  8  5  2  6  3 
	 9  3  6  7  5  1  4  2  8 
	 1  8  7  6  4  2  9  3  5 
	 5  4  2  9  3  8  1  7  6 
	 4  7  9  5  1  6  3  8  2 
	 2  5  3  8  9  7  6  1  4 
	 8  6  1  4  2  3  7  5  9 

	 Do you want to solve another sudoku puzzle? Enter 0 for No, and any non-zero number for Yes.
	0
	>> 
	
#####	SAMPLE RUN WITH ARGUMENT
	
	>> S2 = [0 8 0 0 0 0 2 0 0;0 0 0 0 8 4 0 9 0;0 0 6 3 2 0 0 1 0;0 9 7 0 0 0 0 8 0;8 0 0 9 0 3 0 0 2;0 1 0 0 0 0 9 5 0;0 7 0 0 4 5 8 0 0;0 3 0 7 1 0 0 0 0;0 0 8 0 0 0 0 4 0]

	S2 =

		 0     8     0     0     0     0     2     0     0
		 0     0     0     0     8     4     0     9     0
		 0     0     6     3     2     0     0     1     0
		 0     9     7     0     0     0     0     8     0
		 8     0     0     9     0     3     0     0     2
		 0     1     0     0     0     0     9     5     0
		 0     7     0     0     4     5     8     0     0
		 0     3     0     7     1     0     0     0     0
		 0     0     8     0     0     0     0     4     0

	>> sudoku(S2)
	The solved sudoku is :

	 7  8  4  1  9  6  2  3  5 
	 3  2  1  5  8  4  6  9  7 
	 9  5  6  3  2  7  4  1  8 
	 2  9  7  4  5  1  3  8  6 
	 8  4  5  9  6  3  1  7  2 
	 6  1  3  8  7  2  9  5  4 
	 1  7  9  6  4  5  8  2  3 
	 4  3  2  7  1  8  5  6  9 
	 5  6  8  2  3  9  7  4  1 

	 Do you want to solve another sudoku puzzle? Enter 0 for No, and any non-zero number for Yes.
	0
	>> 
	
Read the HTML readme for images. 

####	VI	SUPPORT
	
If you have issues with running the code or need technical support in general with
issues relating to running the program, you can get in touch with the developers at
skzafar.ali_ug19@ashoka.edu.in or kanan.gupta_ug19@ashoka.edu.in