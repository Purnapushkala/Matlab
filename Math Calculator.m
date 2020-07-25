
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Description:
% This program is a ENCOMP Final Math Calculator.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
disp('ENCOMP Final Math Calculator')
disp ('Please enter the following information in percent.') %display function is used to print any information on the screen
m1 = input('Assignment #1: ');%Input function is used to input the values from the user during run time.
m2 = input('Assignment #2: ');
m3 = input('Assignment #3: ');
m4 = input('Assignment #4: ');
m5 = input('Assignment #5: ');
midterm= input('Mid term Exam: ');
final =input('Final Exam: ');
fmark = 0.06*(m1+m2+m3+m4+m5)+ 0.2333*midterm + 0.4667*final; %fmark in my program multiplies the each of the assigned percentages to the assignemnt marks, midterm and final marks and then adds these values to find the final ENCOMP mark.
fprintf('Your calculated Final mark for ENCOMP 100 is :\n %.4f \n\n',fmark);% fprintf helps us to print the final mark in the format that I need - in a new line and by printing only 4 decimal places.


