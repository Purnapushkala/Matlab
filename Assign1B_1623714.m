%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 1B
% Name: Purnapushkala Hariharan
% CCID: purnapus
% U of A ID: 1623714
%
% Acknowledgements:
%
% Description:
% This program plots a graph of height and velocity vs time .
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
t = 0:1:10;% This creates a row vector of time from 0 to 10 s and is increamented by one.
g = -9.81; 
vinitial = input('Enter the initial velocity of the ball: ');
hinitial = input('Enter the initial height of the ball: ');
height = 0.5*g*t.^2 + vinitial*t + hinitial;% Value of the height at a specific time, initial velocity and initial height is calculated through the given formula and is stored in the variable height. 
velocity = g.*t + vinitial; %  Value of the velocity at a specific time and initial velocity is calculated through the given formula and is stored in the variable velocity. 
plot(t,height,'-b',t,velocity,'--og');% The plot function plotes both the time vs height in blue color and time vs velocity in green color in a single plot.
title('Plot of height and velocity vs time'); % The title function is used to give the title of the plot.
ylabel('Height (m) and Velocity (m/s)'); % The ylabel function is used to label the y-axis of the plot.
xlabel('Time (s)'); % The xlabel function is used to label the x-axis of the plot.
grid on; % The grid function when turned on displays the gridlines in the plot.
legend('Height','Velocity'); % The legend function displays the line samples along with the strigs that represent the line.

