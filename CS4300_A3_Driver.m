function P = CS4300_A3_Driver()
% CS4300_A3_Driver - Driver function for A3
% On input:
% On output:
%
% Call:
% CS4300_A3_Driver();
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%

for N = 4:10
    G = ~ eye(N,N);
    for p = 0:0.2:1
        for t = 1:200
            D = rand(N,N) <p ;
            %AC1 timer start
            %Dr = CS4300_AC1(G, D, 'CS4300_P_no_attack')
            %AC3 timer start
            Dr = CS4300_AC3(G, D, 'CS4300_P_no_attack');
        end
    end
end