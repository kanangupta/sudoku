%% Sudoku Solver
% This is a MATLAB(R) program designed to solve sudoku puzzles of the 9x9 
% kind using a brute force algorithm called backtracking. This html
% documentation has been generated using MATLAB(R)'s publishing feature.
% Text highlighted in green within code snippets are comments. The code
% snippets here, combined, form the complete program. There is no code that
% this program uses which isn't present here.

%% Main Function
%
% This is the main function that gets executed first when the program is
% run. Typing "sudoku" in the MATLAB(R) command window will run the program
% without any arguments. In such a case, the program will ask the user to
% enter a 9x9 sudoku matrix as the input argument.
% Alternatively, the user can call the program with the 9x9 grid as an
% argument.
% 

function sudoku(X)
if ~nargin
    X = input([' Please input the sudoku puzzle as a 9x9 matrix of '...
        'integers 1 to 9, and 0 for blank spaces.\n Each entry in'...
        ' each row should be an integer from 0 to 9, separated by a '...
        'space.\n Each row should be separated by a semicolon (;). The'...
        ' input should be enclosed in square brackets [ ].\n For example,'...
        ' a 3x3 matrix would be written like this: [1 2 3;4 5 6;7 8 9].\n '])
end

%  The 9x9 matrix is tested for validity before the solver is run.

[valid,invalid]=valid_sudoku(X);
if ~valid
    fprintf(invalid)
    sudoku
end

% Once the matrix is determined to be valid, then the solver is called. If
% the solver solves the sudoku, then the solution is printed. Else, the
% sudoku is declared to be unsolvable.
% Either way, the program asks whether the user wants to solve another
% sudoku puzzle, and depending upon the input, either restarts or quits.

[X,solved]=solver(X);
if solved
    fprintf('The solved sudoku is :\n\n')
    fprintf([repmat(' %d ', 1,9) '\n'], X')
else
    fprintf('The given sudoku is an unsolvable puzzle.\n')
end
again=input(['\n Do you want to solve another sudoku puzzle? Enter 0'...
    ' for No, and any non-zero number for Yes.\n']);
if again
    sudoku
end
end

%% Solver Main Function
% 
% 
% 

function [X,solved]=solver(X)
[X,Xcell]=RepeatCandidates(X);
if ~valid_sudoku(X) || any(any(cellfun(@isempty,Xcell)))
    solved=false;
    return %unsolvable
end
if any(X(:)==0)
    firstzero=find(X==0,1);
    Y=X;
    for i=Xcell{firstzero}
        X=Y;
        X(firstzero)=i;
        X=solver(X);
        if X>0
            if valid_sudoku(X)
                solved=true;
                return %solved
            end
        end
        end
    end
end

%% Validity Check
% 
% This function checks the validity of the input 9x9 matrix and determines
% if it's a valid sudoku puzzle.
%
% The funtion, by default, assumes that the
% input is valid and checks against some conditions.
% If even one of the conditions is not met, then the input 
% is declared as invalid and the
% program asks the user to reenter the input matrix.
% 

function [valid,invalid]=valid_sudoku(X)
invalid=false;

% The following part of the code checks if the input is a 9x9 matrix.
% Input anything else and the program will tell you that the input is not
% valid.

if size(X)~=[9,9] 
    invalid='The input is not a 9x9 matrix.\n';
    valid=false;
    return;
end

% This part of the code checks if the 9x9 matrix contains only integers
% from 0 to 9. Anything else would make the input invalid, and ask for a
% reenter.

if ~(fix(X)==X & X<=9 & X>=0)
    invalid='The input should contain only integers 0 to 9.\n'
    valid=false;
    return;
end

% Then the input matrix is tested for violations within the same row or
% column, a violation being repetition of entries within the same row or
% column.

for row=1:9
    if ~isequal(sort(nonzeros(X(row,1:end))),nonzeros(unique(X(row,1:end))))
                invalid=sprintf('The input is an invalid puzzle. Some entries are being repeated in row %d.\n',row);
                valid=false;
                return;
    end
end
for col=1:9
    if ~isequal(sort(nonzeros(X(1:end,col))),nonzeros(unique(X(1:end,col))))
                invalid=sprintf('The input is an invalid puzzle. Some entries are being repeated in column %d\n.',col);
                valid=false;
                return;
    end
end

% Each 3x3 sub-grid is then tested for repetition of elements. If a
% repetition has occurred, then the input is regarded as invalid.

for row=1:3:7
        for col=1:3:7
            temp=X(row:row+2,col:col+2);
            if ~isequal(sort(nonzeros(temp)),nonzeros(unique(temp)))
                valid=false;
                invalid=sprintf('Some elements are being repeated in the subblock starting at the position (%d,%d)\n.',row,col);
                return;
            end
        end
end
valid=true;
end

%% Obtain Sub-Grid for a Position
% 
% This function breaks the 9x9 input grid into 9 grids of of 3x3 each so
% that it becomes easy for the program to check for violation within the
% grid when a particular position is accessed.
% 
% More specifically, this function determines the sub-grid that a position
% belongs to when its row number and column number are supplied.
% 

function block=sub_block(X,row,col)

%  Creates position indexes for the starting positions of sub-grids. Start
%  at 1, increment by 3, stop at 7.

index=1:3:7;

%  Obtain the sub-grid's first row's number and first column's number from
%  the row number and column number of the position supplied.
%  'ceil' function rounds the result of the division to the next integer.

sub_row=index(ceil(row/3));
sub_col=index(ceil(col/3));

% Use the first row and first column to obtain the subgrid by incrementing
% twice.

block=X(sub_row:sub_row+2,sub_col:sub_col+2);
end

%% Find Possible Candidates
% 
% This function evaluates the possible candidates at a position by
% elimination.
% 

function candidates=missingcandidates(X,row,col)

% The first line declares an array containing the integers 1
% through 9.

full = 1:9; 

% The second line checks what elements are present in the same row and
% converts those elements to 0 in the array. The third line does the same
% for the elements in the same column and the fourth repeats that for
% elements in the same sub-grid.

full(nonzeros(X(row,:))) = 0; 
full(nonzeros(X(:,col))) = 0; 
full(nonzeros(sub_block(X,row,col)))= 0; 

% The final line declares an array which contains all the non zero elements
% of the array declared in the first line after the operation on the array
% is complete. The function returns this array whenever called.

candidates = nonzeros(full)'; 
end

%% Generate Cell Array
% 
% This function first creates a cell matrix from the input matrix. The blank
% places are zeroes and the filled places contain the respective digits. A
% cell matrix 
%

function Xcell=CandidateCell(X)
    Xcell=num2cell(X);
    for col=1:9
        for row=1:9
            if X(row,col)==0
                Xcell{row,col}=missingcandidates(X,row,col);
            end
        end
    end
end
                
%% Fill Singletons
% 
% This function checks the cell array for positions where only one
% possibility exists and then proceeds to fill these singletons. 
% 

function X=FillSingletons(X,Xcell)
    for col=1:9
        for row=1:9
            if size(Xcell{row,col},2)==1
                X(row,col)=Xcell{row,col};
            end
        end
    end
end

%% Recursive Call
%
% The
%

function [Xnew, XCell]=RepeatCandidates(X)
    XCell=CandidateCell(X);
    Xnew=FillSingletons(X,XCell);
    while abs(sum(sum(Xnew-X)))>0
        X=Xnew;
        XCell=CandidateCell(X);
        Xnew=FillSingletons(X,XCell);
    end
end
