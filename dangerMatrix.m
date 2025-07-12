function [tempA]=dangerMatrix(s,N,E,K)   

%% In this function, s is a 1 * 2 random integer matrix from 0 to N, N is the number of map subdivisions, 
%% E is the global threat domain formed by all the enemies currently observed, and K is the threat coefficient.

%% The function of this function is to update the weight of all points on the map to this point for a starting point s 
%% on the randomly selected map and the currently observed enemy threat matrix E, that is, distance + threat coefficient multiplied by distance

%% The effect of this function is to update the value of a randomly selected starting point s on the map, 
%% and the right to the currently observed enemy threat matrix E, to establish this point all points on the map, that is, 
%% the distance factor is multiplied by the distance the threat +

N2=size(E,1);                                %% N2 is the number of rows of E
stepdis=1/N2;
tempA=zeros(N,N);                            %% First define a zero N by N matrix
tempA2=zeros(N,N);

for x1=1:N                                   %% x1 loops from 1 to N first
    for y1=1:N                               %% y1 loops from 1 to N again
        s1=s/N;                              %% s1 is the current s value after normalization
        s2=[x1/N,y1/N];                      %% s2 is in a loop of the same format as s1, that is, the value after position normalization
        delta=0;
        dis=norm(s1-s2);                     %% dis is the distance between the two after normalization
        tempA(x1,y1)=dis;                    %% Assign the distance dis to the corresponding position item of the tempA matrix
        while dis>0.000001
            [s1,dismove]=nextstep(s1,s2,stepdis);
            dis=dis-dismove;
            delta=delta+dismove*E(ceil(s1(1)*N2),ceil(s1(2)*N2));         %% ceil function is a positive rounding function
        end
        tempA(x1,y1)=K*delta+tempA(x1,y1);
    end
end
end