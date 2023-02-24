clc
clear

A = [2 4; 3 5];
B = [8; 15];

A = [A ; eye(2)];
B = [B ; 0 ; 0];

% plotting
x = 0 : max(B);
for i = 1 : size(A,1)
    y = (B(i) - (A(i,1) * x)) / A(i,2);
    y = max(0,y);
    plot(x,y);
    hold on
end

% finding the points of intersection and corner points
pt = [];
for i = 1 : size(A,1)
    for j = i+1 : size(A,1)
        AA = [A(i,:) ; A(j,:)];
        BB = [B(i,:) ; B(j,:)];
        xx = inv(AA) * BB;
        if xx >= 0
            pt = [pt xx];
        end
    end
end

pt


% finding the feasible points and the optimal solution
fp = [];
c1 = @(x1,x2) 2*x1 + 4*x2 - 8
c2 = @(x1,x2) 3*x1 + 5*x2 - 15
z = @(x1,x2) 3*x1 + 2*x2
z1 = []

for i = 1 : size(pt,2)
    x1 = pt(1,i);
    x2 = pt(2,i);
    if c1(x1,x2) <= 0 && c2(x1,x2) <= 0
        fp = [fp pt(:,i)];
        cost = z(x1, x2);
        z1 = [z1 cost];
    end
end

[value, ind] = max(z1)
opt_sol = fp(:,ind)

opt_sol


