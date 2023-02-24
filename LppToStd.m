clc
clear

A = [1 -1 1 ; 3 -2 1 ; 5 3 -1];
B = [5 ; 4 ; 2];
C = [1 1 1];

% signs
% = -> -1
% < -> 0
% > -> 1
[m, n] = size(A);
signs = [-1 0 1];
s = eye(m);

index = find(signs > 0);
s(index,:) = -s(index,:);
index1 = find(signs < 0);
s(index1,:) = zeros(1,m);

s(:,index1) = [];

A = [A s];
C = [C zeros(1, size(s,2))];

A
C
