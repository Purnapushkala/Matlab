%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 4A
% Name: Purnapushkala Hariharan
% CCID: purnapus
% U of A ID: 1623714
%
% Acknowledgements:
%
% Description:
% This program calculates medal standings for Olympics.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
function[]= assign4A_1623714()
load ('olympics.mat');
% loads countries, gold, silver, and bronze variables
% country codes include XXX, which is used to handle tied medals

results = zeros(size(countries,1),4);

% compute medals for each country saving it into an array or vector
for j=1:1:size(countries,1)
    results(j,:) = compute_medals(gold,silver,bronze,countries(j,:))
    
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
results = [0,0,0,0];
%{
b= 1:size(bronze,1);
g=1:size(gold,1);
s = 1:size(silver,1);
    for k= 1:size(bronze,1)
        bronz=b(k,:);
        silv = s(k,:);
        gold =g(k,:);
        if(countries(j,:)==bronz)
            results(1,4) = results(1,4)+ 1;
        end  
        if(countries(j,:)== silv)
            results(1,3) = results(1,3)+ 1;
        end  
        if(countries(j,:)== gold)
            results(1,2) = results(1,2)+ 1;
        end  
    end
results(1,5)= results(1,4) + results(1,3) + results(1,2);
%}
end

function [ ] = print_country_results(countries,results)
% prints formatted results

end

function [ ] = print_best_countries(countries,results,selection)
% prints best performing countries
% selection = 1 shows countries with most medals
% selection = 2 shows countries with most gold medals
% selection = 3 shows countries with at least 20 medals

end