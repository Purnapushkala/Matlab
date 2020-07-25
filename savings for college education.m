%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
% This program calculates savings for college education.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
stream = input('Select a program: 1.Arts; 2.Science; 3. Engineering:'); % The user inputs the required stream.
old_blnc = 2000;
saving = zeros(1,216); % Initialing the saving vector to a zero vector
count = zeros(1,21); % Initialing the count vector to a zero vector
cost=0;
for month=1:216 % The for loop calculates the total savings every month and saves it in the saving vector.
    old_blnc = (old_blnc.*(1+0.06./12)) + 200;
    saving(month) = old_blnc;
end

fprintf('At the end of 18 years you will have saved $ %6.2f\n', old_blnc);
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
        disp('Invalid input for stream'); % If value of the variable stream does not match with any of the case expresions, then the statements under otherwise is executed.
end
fee = sum(count(19:22));% the built-in function sum takes the sum of values from the 19th to the 22nd elements of the count vector.
fprintf('The cost of a 4-year college tuition fee is $ %6.2f\n', fee);
if (fee >= old_blnc) % The if statements checks whether the fee is greated than old_blnc.
    less = fee - old_blnc;% The difference between fee and old_blnc is calculated and saved in less.
    fprintf('The savings is $ %6.2f short.\n', less);
else
    fprintf ('Congratulations!!!! You have saved enough.\n');
end
time = [1:216]/12; % Converting the months to years.
plot(time,saving,'-g'); % The plot function plotes the time vs saving in green color.
hold on; % The hold function keeps the first graph while plotting the other one too.
plot(time,ones(size(time))*fee,'-b'); % The plot function plotes the time vs fee in blue color.
title('College Savings vs. Tuition Fee'); %The title function is used to give the title of the plot.
xlabel('Year'); % The xlabel function is used to label the x-axis of the plot.
ylabel('Balance'); % The ylabel function is used to label the y-axis of the plot.





