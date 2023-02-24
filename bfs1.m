clc 
clear

A=[-1 1 1 0;1 1 0 1];
B=[1;2];
C=[1 2 0 0];

[m, n] = size(A);
nCm = nchoosek(n,m);
pair = nchoosek(1:n,m);

bs = [];
bfs = [];

for i = 1 : nCm
    y = zeros(n,1);
    bv = pair(i,:);
    AA = A(:,bv);
    xx = inv(AA) * B;
    bs = [bs xx];
    if xx >= 0
        y(bv) = xx;
        bfs = [bfs y];
    end
end

z = C * bfs;
[value, index] = max(z);
opt_sol = bfs(:,index);

opt_sol