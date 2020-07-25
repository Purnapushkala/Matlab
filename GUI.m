%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Description:
% This program creates multiple dialog boxes, letting the user choose shapes,
% colors and dimensions from the Graphical User Interface(GUI)
% and finally prints out the total number of shapes selected.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc;

shapecounter = 0;%This initializes the counter variable number_shapes to 0.

while 1
    
    shapeList = {'Circle','Square', 'Ellipse', 'Triangle', 'Rectangle'};%shapeList is a cell array of strings of the required shapes for the list in the commmand window
    [selection,ok] = listdlg('PromptString','Select the next shape:','SelectionMode','single','OKString','Enter',...
        'CancelString','No more','ListString',shapeList);%This command creates a GUI for shapes so that the user can select from it.
    
    % selection now holds the index of the selected shape
    % ok is 1 if a shape was selected; otherwise, ok is 0
    if ~ok
        break;
    end
    
    colours = {'red','yellow', 'blue', 'green', 'orange', 'violet'}; %colours is a cell array of strings of the different colors from which the user can select.
    [colour_selec,okay] = listdlg('PromptString','Select the shape color:','SelectionMode','single','OKString','Enter',...
        'CancelString','No colour','ListString',colours);
    % selection now holds the index of the selected colour
    % okay is 1 if a colour was selected; otherwise, okay is 0
    if ~okay
        break;
    end
    
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
    shapecounter = shapecounter + 1;%This increases the counter variable shapecounter by 1.
end
fprintf('The number of entered objects was %d\n', shapecounter);%This statement prints out the total number of shapes that the user selected in the interface.
