%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 2
% Name: Purnapushkala Hariharan
% CCID: purnapus
% U of A ID: 1623714
% Acknowledgements:
%
% Description:
% This program contains four rules which can be used to crack the
% secret code to save Maverick the co-op student.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
day = '';
place = ' ';
code_input= input('Please enter a code to break: ','s');%A code is input by the user and saved in the variable code_input as a character vector.
code = code_input - '0';% The character vector code_input is converted to a numerical vector code.
if (length(code))~= 9 %The if statement checks whether the length of the code is NOT 9.
    disp('Decoy Message: Not a nine-digit number.');
else % The programs executes the else statement when the length of the code is 9.
    sum_code = sum(code);%The sum function takes the sum of the value of the elements of the vector code and saves it into the variable sum_code.
    switch(mod(sum_code,2)) % The switch statement evaluates the remainder when the sum_code is divided by 2 and then compares the calculated value to each of the expressions in the subsequenct cases.
        case 1
            disp('Decoy Message: Sum is odd.')% If the remainder calculated above is 1, then the sum is odd and this is displayed.
        case 0
            resday = code(1)*code(3) - code(5); %If the remainder calculated above is 0, then the sum is even and the value of the variable resday is calculated.
            
            switch(resday) % The switch statement compares the value of the variable resday to each of the expressions in the subsequenct cases.
                case 1
                    day ='Monday';
                case 2
                    day = 'Tuesday';
                case 3
                    day ='Wednesday';
                case 4
                    day ='Thursday';
                case 5
                    day ='Friday';
                case 6
                    day ='Saturday';
                case 7
                    day ='Sunday';
                otherwise % If value of the variable resday does not match with any of the case expresions, then the statements under otherwise is executed.
                    disp('Decoy Message: Invalid rescue day.');
                    resday = 8;
            end  % This terminates the innermost (resday) Switch function.
            point = code(2)*code(4) - code(6);
            if(mod(point,3)==0)% The if statement checks whether the value of point is divisible by 3.
                rendpoint = code(7)- code(9);
            else % If the value of point is NOT divisible by 3, then the else statement is executed.
                rendpoint = code(8)- code(9);
            end% This terminates the innermost (mod of point) if statement.
            
            if resday <=7 %% This if statement checks whether the resday is lesser than 7.
                switch (rendpoint)% The switch statement compares the value of the variable rendpoint to each of the expressions in the subsequenct cases.
                    case 1
                        place = ('the bridge');
                    case 2
                        place = ('the library');
                    case 3
                        place = ('the river crossing');
                    case 4
                        place = ('the airport');
                    case 5
                        place = ('bus terminal');
                    case 6
                        place = ('the hospital');
                    case 7
                        place = ('St. Petes Church');
                    otherwise % If value of the variable rendpoint does not match with any of the case expresions, then the statements under otherwise is executed.
                        disp('Decoy Message: Invalid rendezvous point.');
                end %% This terminates the rendpoint switch statement.
            end
            if place ==' '%% This statements checks whether the place is empty.
                disp('')
            else
                fprintf('Rescue on %s at %s. \n',day,place);% This prints the final output on screen.
            end
    end
    
end