%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4A
% Name:Purnapushkala Hariharan
% CCID:purnapus
% U of A ID:1623714
%
% Acknowledgements:
%
% Description:
% This program calculates medal standings for Olympics.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = assign4A_1623714()
clc;
% loads countries, gold, silver, and bronze variables
% country codes include XXX, which is used to handle tied medals
load ('olympics.mat');% This command loads the file "olympics.mat" along with the variables like countries, gold, silver and bronze contained in the file.

results = zeros(size(countries,1),4);%This creates a zero matrix of 27 rows and 4 colums and saves that as a result matrix.

for j=1:1:size(countries,1)
    results(j,:) = compute_medals(gold,silver,bronze,countries(j,:));% The compute_medals function computes the number of medals for each country saving it into the result matrix.
end

print_country_results(countries,results);% display medal counts for all countries


for i=1:3
    print_best_countries(countries,results,i);
    % display countries with
    % most medals (i=1), most gold medals (i=2), >=20 medals (i=3)
end

end

function [results] = compute_medals(gold,silver,bronze,country)
% computes number of gold, silver, bronze medals and
% total medal tally for a given country and a given sport type
results = [0,0,0,0];
for k= 1:size(bronze,1) % The for loop runs from one to the size of bronze which is 87.
    if(country==bronze(k,:)) %Compares the names of countries in the variable country and variable bronze.
        results(1,3) = results(1,3)+ 1;
    end
    if(country== silver(k,:))%Compares the names of countries in the variable country and variable silver.
        results(1,2) = results(1,2)+ 1;
    end
    if(country== gold(k,:))%Compares the names of countries in the variable country and variable gold.
        results(1,1) = results(1,1)+ 1;
    end
    results(1,4)= results(1,1)+results(1,2)+results(1,3); % Calculates the total number of medals for each country.
end

end

function [ ] = print_country_results(countries,results)
fprintf('Country Gold Silver Bronze Total\n')
for p=1:size(countries,1)-1
    fprintf('    %s', countries(p,:))
    fprintf('   %2.0f', results(p,1))
    fprintf('     %2.0f', results(p,2))
    fprintf('     %2.0f', results(p,3))
    fprintf('    %2.0f\n', results(p,4))
end
% prints formatted results of countries and the number of
% gold,silver,bronze and total number of medals in the table form excluding XXX.

end

function [ ] = print_best_countries(countries,results,i)
% prints best performing countries
% selection = 1 shows countries with most medals
% selection = 2 shows countries with most gold medals
% selection = 3 shows countries with at least 20 medals
switch(i)%The switch statement compares the value of i to each of the numbers in the subsequenct cases.
    case 1
        mostmedal= countries(1,:);
        mostm = results(1,4);
        for j=1:size(countries,1)-1 % The for loop runs for 26 times comparing mostm to every total number of medals stored in results and finds the names of the countries having the most number of medals.
            if results(j+1,4)>mostm
                mostmedal=countries((j+1),:);
                mostm = results(j+1,4);
            elseif results(j+1,4)== mostm
                mostmedal=[mostmedal countries((j+1),:)];
                mostm = results(j+1,4);
            end
        end
        fprintf('Countries with the most medals: %s\n', mostmedal);
    case 2
        mostg =countries(1,:);
        mostgold= results(1,1);
        for m=1:size(countries,1)-1 % The for loop runs for 26 times comparing mostgold to every total number of gold medals stored in results and finds the names of the countries having the most number gold of medals.
            if results(m+1,1)>mostgold
                mostgold= results((m+1),1);
                mostg=countries((m+1),:);
            elseif results(m+1,1) == mostgold
                mostgold= results((m+1),1);
                mostg=[mostg countries((m+1),:)];
            end
        end
        fprintf('Countries with the most gold medals: %s\n',mostg);
    case 3
        atleast20 = [];
        for g=1:size(countries,1) % The for loop runs for 26 times and finds the name of the countries having more than 20 medals.
            if results(g,4)>20
                atleast20=[atleast20 countries((g),:)];
            end
        end
        fprintf('Countries with at least 20 medals:');
        fprintf(' %c%c%c ', atleast20);
        fprintf('\n');
        
end

end