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

[i_col,j_col] = size(D);
delete = 0;
i = arc{1,1}{1,1};
j = arc{1,1}{1,2};

zeroed_matrix = zeros(i_col, j_col);
if isequal(D, zeroed_matrix)
    delete = 0;
    D_revised = D;
    return;
end



for a = 1:i_col
    count = i_col;
    for b = 1:j_col
        % If our current nodes are 1, check them
        if D(i, a) == 1 && D(j, b) == 1
            % If at least one node can support node i, don't delete it
            if feval(P, i, a, j, b) == 1
                count = count-1;
            end
           
        elseif D(j,b) ==0
            count = count -1;
        end    
        
    end
 
    
    if count ==0
        D(i, a) = 0;
        delete = 1;
    end
    
end

D_revised = D;