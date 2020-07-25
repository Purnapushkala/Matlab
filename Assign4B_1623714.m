%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4B
% Name:Purnapushkala Hariharan
% CCID:purnapus
% U of A ID:1623714
%
% Acknowledgements:
%
% Description:
% This program calculates medal standings for Olympics.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = assign4B_1623714()
clc;
% loads countries, gold, silver, and bronze variables
% country codes include XXX, which is used to handle tied medals
load ('olympics.mat');% This command loads the file "olympics.mat" along with the variables like countries, gold, silver and bronze contained in the file.

% compute medals for each country save into a structure array
for j=1:1:length(countries)
    results(j) = compute_medals(gold,silver,bronze,countries(j,:));% The compute_medals function computes the number of medals for each country saving it into the result matrix.
end

% display medal counts for all countries
print_country_results(results);

for i=1:3
    print_best_countries(results,i);
    % display countries with
    % most medals (i=1), most gold medals (i=2), >=20 medals (i=3)
end

end

function [Sresults] = compute_medals(gold,silver,bronze,country)
% computes number of gold, silver, bronze medals and total medal tally for
% a given country and a given sport type
results = [0,0,0,0];
for k= 1:size(bronze,1)% The for loop runs from one to the size of bronze which is 87.
    if(country==bronze(k,:))%Compares the names of countries in the variable country and variable bronze.
        results(1,3) = results(1,3)+ 1;
    end
    if(country== silver(k,:))%Compares the names of countries in the variable country and variable silver.
        results(1,2) = results(1,2)+ 1;
    end
    if(country== gold(k,:))
        results(1,1) = results(1,1)+ 1;%Compares the names of countries in the variable country and variable gold.
    end
    results(1,4)= results(1,1)+results(1,2)+results(1,3);% Calculates the total number of medals for each country.
end
% The below statements create a structure array Sresults that contains the following fields
% country, number of gold medals, number of silver medals,
% number of bronze medals, total medals.
Sresults.country=country;
Sresults.goldcount=results(1,1);
Sresults.silvercount=results(1,2);
Sresults.bronzecount=results(1,3);
Sresults.total=results(1,4);
end

function [ ] = print_country_results(results)
fprintf('Country Gold Silver Bronze Total\n')
for p = 1:length(results)-1
    fprintf('%s     %2d     %2d     %2d     %2d \n', results(p).country,results(p).goldcount,results(p).silvercount,results(p).bronzecount,results(p).total)
end
% prints formatted results of countries and the number of
% gold,silver,bronze and total number of medals in the table form excluding XXX.
end

function [ ] = print_best_countries(results,selection)
% prints best performing countries
% selection = 1 shows countries with most medals
% selection = 2 shows countries with most gold medals
% selection = 3 shows countries with at least 20 medals
switch(selection)%The switch statement compares the value of selection to each of the numbers in the subsequenct cases.
    case 1
        mostmedal= results(1).country;
        mostm = results(1).total;
        for j=1:length(results)-1% The for loop runs for 26 times comparing mostm to every total number of medals stored in results and finds the names of the countries having the most number of medals.
            if results(j+1).total>mostm
                mostmedal=results(j+1).country;
                mostm = results(j+1).total;
            elseif results(j+1).total== mostm
                mostmedal=[mostmedal results(j+1).country];
                mostm = results(j+1).total;
            end
        end
        fprintf('Countries with the most medals: %s\n', mostmedal);
    case 2
        mostg =results(1).country;
        mostgold=results(1).goldcount;
        for m=1:length(results)-1% The for loop runs for 26 times comparing mostgold to every total number of gold medals stored in results and finds the names of the countries having the most number gold of medals.
            if results(m+1).goldcount>mostgold
                mostgold= results(m+1).goldcount;
                mostg=results(m+1).country;
            elseif results(m+1).goldcount == mostgold
                mostgold= results(m+1).goldcount;
                mostg=[mostg results(m+1).country];
            end
        end
        fprintf('Countries with the most gold medals: %s\n',mostg);
    case 3
        atleast20 = [];
        for g=1:length(results) % The for loop runs for 26 times and finds the name of the countries having more than 20 medals.
            if results(g).total>20
                atleast20=[atleast20 results(g).country];
            end
        end
        fprintf('Countries with at least 20 medals:');
        fprintf(' %c%c%c ', atleast20);
        fprintf('\n');
        
end

end
