%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 5B
% Name: Purnapushkala Hariharan
% CCID: purnapus
% U of A ID: 1623714
%
% Acknowledgements:
%
% Description:
% This program creates multiple dialog boxes, letting the user choose shapes,
% colors and dimensions from the Graphical User Interface(GUI)
% and finally prints out the total number of shapes selected and the shape,
% color and area of the shapes selected. This output is then stored in
% PurnapushkalaHariharan.txt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc;
shapecounter = 0;%This initializes the counter variable number_shapes to 0.
shape = {};%This statement intitializes the cell array shape as an empty cell array.

while 1
    shapecounter = shapecounter + 1;%This statement increments the counter variable by 1.
    
    shapeList = {'Circle','Square', 'Ellipse', 'Triangle', 'Rectangle'};%shapeList is a cell array of strings of the required shapes for the list in the commmand window
    [selection,ok] = listdlg('PromptString','Select the next shape:','SelectionMode','single','OKString','Enter',...
        'CancelString','No more','ListString',shapeList);%This command creates a GUI for shapes so that the user can select from it.
    % selection now holds the index of the selected shape
    % ok is 1 if a shape was selected; otherwise, ok is 0
    if ~ok
        shapecounter = shapecounter -1;
        break;
    end
    
    shape{shapecounter}.shapename = shapeList{selection};%This command saves the names of the shapes selected by the user into the field shapename of the cell array shape
    
    colours = {'red','yellow', 'blue', 'green', 'orange', 'violet'}; %colours is a cell array of strings of the different colors from which the user can select.
    [colour_selec,okay] = listdlg('PromptString','Select the shape color:','SelectionMode','single','OKString','Enter',...
        'CancelString','No colour','ListString',colours);
    % selection now holds the index of the selected colour
    % okay is 1 if a colour was selected; otherwise, okay is 0
    if ~okay
        shapecounter = shapecounter -1;
        break;
    end
    
    shape{shapecounter}.colour = colours{colour_selec};%This command saves the names of the colors selected by the user into the field color of the cell array shape
    
    %GUI is created for the shapes so that the user can enter two dimensions for the selected shape
    prompt={'Enter shape dimension 1','Enter shape dimension 2'};%prompt is a cell array containing the prompt strings
    title = 'Shape dimension dialog box';
    numlines = 1;
    defaults = {'0','0'};%defaults is a cell array containing the default inputs values(0) as strings
    options.Resize = 'on';%options is a structure giving additional options for the interface.
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    inputvalues = inputdlg(prompt,title,numlines,defaults,options);%inputvalues is a cell array that contains the user inputs as strings
    % str2num(inputvalues{1}) is the value of the first dimension
    % str2num(inputvalues{2}) is the value of the second dimension
    shape{shapecounter}.dimensions = [str2num(inputvalues{1}) str2num(inputvalues{2})];%This command converts the dimentions of the shapes selected by the user into a number and save it into the field color of the cell array shape
    
end

area = calc_area(shape);%This statement call the calc_area function to calculate the area of the shape selected by the user.

fprintf('The number of entered objects was %d\n', shapecounter);%This statement prints out the total number of shapes that the user selected in the interface.

%The below for loop prints all the information stores in the structure shape and stores it in the textfile named PurnapushkalaHariharan.txt.
fprintf('No.\tID\t\t  Color\t\tArea\n');
file = fopen('PurnapushkalaHariharan.txt','w'); %This opens the textfile named PurnapushkalaHariharan.txt for writing.
for i = 1:shapecounter
    shape{i}.area = area(i);
    fprintf('%d\t%s    %s\t  \t%.6f\n', i, shape{i}.shapename,shape{i}.colour, shape{i}.area);
    fprintf(file,'%d\t%s    %s\t  \t%.6f\n', i, shape{i}.shapename,shape{i}.colour, shape{i}.area);%This command saves the output in the file.
end
fclose(file);%This command closes the file.

function [area] = calc_area(shape)
% This function calculates the area of shapes in the structure array and return the results in an area array

[row, number_of_shapes] = size(shape);
area = zeros(row, number_of_shapes);

for i = 1:number_of_shapes
    switch shape{i}.shapename
        case 'Circle'
            %area = 4*pi*radius^2
            area(i) = 4 * pi * ((shape{i}.dimensions(1))/2)^2;
        case 'Square'
            %area = length^2
            area(i) = (shape{i}.dimensions(1))^2;
        case 'Ellipse'
            %area = pi * major_diamemter * minor_diameter
            area(i) = pi * (shape{i}.dimensions(1)) * (shape{i}.dimensions(2));
        case 'Triangle'
            %area = 0.5 * base * height
            area(i) = 0.5 * (shape{i}.dimensions(1)) * (shape{i}.dimensions(2));
        case 'Rectangle'
            %area = length * breadth
            area(i) = (shape{i}.dimensions(1)) * (shape{i}.dimensions(2));
    end
end
end