%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Description:
% This program calculates savings for college education.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
stream = input('Select a program: 1.Arts; 2.Science; 3. Engineering:');% The user inputs the required stream.
old_blnc = 2000;
monthpay=50;
switch stream %The switch statement compares the calculated value to each of the expressions in the subsequenct cases.
    case 1
        cost = 6000;
        for tuityr=2:22 % The for loop runs from 2 to 22 (21 times) and the following statements are executed.
            cost = cost.*1.0575;
            count(tuityr) = cost;
        end
    case 2
        cost = 6500;
        for tuityr=2:22 % The for loop runs from 2 to 22 (21 times) and the following statements are executed.
            cost = cost.*1.0575;
            count(tuityr) = cost;
        end
    case 3
        cost = 7000;
        for tuityr=2:22 % The for loop runs from 2 to 22 (21 times) and the following statements are executed.
            cost = cost.*1.0575;
            count(tuityr) = cost;
        end
    otherwise
        disp('Invalid input for stream');% If value of the variable stream does not match with any of the case expresions, then the statements under otherwise is executed.
end
fee = sum(count(19:22)); % The built-in function sum takes the sum of values from the 19th to the 22nd elements of the count vector.
while old_blnc < fee %This is a conditional loop where the following statements are executed till the expression in while becomes false.
    monthpay = monthpay + 10; %Incrementing the monthly pay until the condition is met.
    old_blnc = 2000;
    for month=2:216 % Calculating the balance for the new monthly pay value
        old_blnc = (old_blnc.*(1+0.06./12)) + monthpay;
    end
end
fprintf('The cost of a 4-year college tuition fee is $ %6.2f\n', fee);
fprintf('You will need to save $ %6.2f each month to reach the goal\n', monthpay);
