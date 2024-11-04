clear; close all; clc; 
%load('Load your boundry conditions',"Input");

allData = zeros(101, 101, 120);

for j = 1 : 120
    
    lambda = 0.5;
    rho = 2.7;
    c = 0.9;
    A = 1;
    noe = 100;
    not = 100;
    T = 10;
    L = 3;
    
    %inTemp = Input(j, 1);
    %outTemp = Input(j, 2);
    
    inTemp = 20;
    outTemp = 100;
    
    deltaT = T/not;
    non = noe+1; 
    elLength = L/noe; 
    Theta = 2/3; 

    Edof = zeros(noe,3); 
    for i=1:noe
        Edof(i,1)=i; 
        Edof(i,2)=i; 
        Edof(i,3)=i+1;
    end


    bc = [1 inTemp;non outTemp];
    an = ones(non,1)*20.;
    K = zeros(non, non);
    C = zeros(non, non);
    A_matrix = zeros(non, non);

    Ke = lambda*A/elLength*[1 -1; -1 1]; 
    Ce = rho*c*elLength/6*[2 1; 1 2];

    K_global = assem(Edof, K, Ke); 
    C_global = assem(Edof, C, Ce);

    A_matrix(:,1) = an;
    A_matrix(1,1) = 1;

    for i=1:not 
        K_star = C_global/deltaT + Theta*K_global;
        f_star = (C_global/deltaT-K_global*(1-Theta))*an;
        an1 = solveq(K_star, f_star, bc);
        A_matrix(:,i+1) = an1;
        an = an1;
    end


    hold on;
    x = 0:noe;
    x=x*L/noe;
    %axis([0 L inTemp outTemp]);
    plot(x', A_matrix(:,1:end-1))
    ylabel("Temperature")
    xlabel("Rod Length")
    title("Nodal Temperature in each timestep")
    %disp(A_matrix);
    %endrow = startrow + size(A_matrix, 1) - 1;
    %allData(startrow:endrow, :) = A_matrix;
    %startrow = endrow + 1;
    allData(:, :, j) = A_matrix;
    save('A_matrix_3.mat','allData');
end
