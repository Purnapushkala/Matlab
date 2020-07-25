%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4A
% Name:
% CCID:
% U of A ID:
%
% Acknowledgements:
% I received help from
%
% Description:
% This program calculates medal standings for Olympics.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = assign4_1234567()
clc;
% loads countries, gold, silver, and bronze variables
% country codes include XXX, which is used to handle tied medals
load ('olympics.mat');

results = zeros(size(countries,1),4);

% compute medals for each country saving it into an array or vector
for j=1:1:size(countries,1)
    results(j,:) = compute_medals(gold,silver,bronze,countries(j,:));
end

% display medal counts for all countries
print_country_results(countries,results);

% display countries with
% most medals (i=1), most gold medals (i=2), >=20 medals (i=3)
for i=1:3
    print_best_countries(countries,results,i);
end

end

function [results] = compute_medals(gold,silver,bronze,country)
% computes number of gold, silver, bronze medals and
% total medal tally for a given country and a given sport type
results = [0,0,0,0];
for k= 1:size(bronze,1)
    if(country==bronze(k,:))
        results(1,3) = results(1,3)+ 1;
    end
    if(country== silver(k,:))
        results(1,2) = results(1,2)+ 1;
    end
    if(country== gold(k,:))
        results(1,1) = results(1,1)+ 1;
    end
    results(1,4)= results(1,1)+results(1,2)+results(1,3);
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
% prints formatted results

end

function [ ] = print_best_countries(countries,results,i)
switch(i)
    case 1
        mostmedal= countries(1,:);
        mostm = results(1,4);
        for j=1:size(countries,1)-1
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
        for m=1:size(countries,1)-1
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
        for g=1:size(countries,1)
            if results(g,4)>20
                atleast20=[atleast20 countries((g),:)];
            end
        end
        fprintf('Countries with at least 20 medals:');
        fprintf(' %c%c%c ', atleast20);
        fprintf('\n');
        
end
%fprintf('Countries with the most medals: %s\n', mostmedal);
%fprintf('Countries with the most gold medals: %s\n',mostgold);
%fprintf('Countries with at least 20 medals: %s\n', atleast20);
% prints best performing countries
% selection = 1 shows countries with most medals
% selection = 2 shows countries with most gold medals
% selection = 3 shows countries with at least 20 medals

end