function [delete, D_revised] = CS4300_revise(arc,D, P)
% CS4300_revise - Revise function from Mackworth paper 1977
% On input:
% arc
% D (nxm array): m domain values for each of n nodes
% P (string): predicate function name; P(i,a,j,b) takes as
% arguments:
% i (int): start node index
% a (int): start node domain value
% j (int): end node index
% b (int): end node domain value
% On output:
% delete (boolean): Says whether to delete
% Call:
% CS4300_revise(arc,'CS4300_P_no_attack');
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%

[domain_row,domain_col] = size(D);
delete = 0;

for a = 1:domain_row
    for b = 1:domain_col
        if P(arc{1,1}, a, arc{1,2}, b)
            D(i, a) = 0;
            delete = 1;
        end
    end
end

D_revised = D;