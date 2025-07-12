function [ TRACE ] = planning( INITIAL,TARGET,E,N,EPISOD_SUM,K)

%   Detailed explanation goes here
%%
D=ones(N,N)*N*N;                         %% D is an N by N matrix with all entries, and multiplied by a coefficient N ^ 2
D(TARGET(1),TARGET(2))=0;                %% TARGET (1) and TARGET (2) are the X and Y coordinates of the destination, respectively, and this entry in the D matrix is zero
s=TARGET;                                %% Assign destination TARGET to s

for t=1:EPISOD_SUM                       %% Number of iterations of a large loop
    A=dangerMatrix(s,N,E,K);             %% Call the dangerMatrix function and assign the value to A. The return value A is a matrix of N times N. In this function, s is the destination, 
                                        %% N is the number of subdivision grids, and E is the global threat domain formed by all the enemies currently observed. , K is the threat coefficient
    D=min(D,D(s(1),s(2))+A);             %%The min function is used to find the smaller value of each term of D and the transformed A. 
                                        %% All the smaller ones form a new matrix, which is still assigned to DD (s (1), s (2)) is the s ( 1) Row, s (2) column value, add this value to all elements of matrix A
    s=randi(N,1,2);                      %% Randomly form a 1 * 2 integer matrix between open intervals (0, N)
end

%% Finally, each of the D matrix obtained, are to the smallest value in the next step, but do not know where it is placed

%% Calculate the path based on the W matrix
step=1;
s=INITIAL;
TRACE=[];

while(isequal(s,TARGET)==0 && step<N*2)  %% As long as s and destination TARGET are not equal, or the number of steps performed is less than the upper limit of 2N, planning continues
    step=step+1;
    A2=dangerMatrix(s,N,E,K);            %% Calculate the weight matrix A2 for each step s
    W2=D+A2;                             %% A new W2 is obtained from the weight matrix starting from s plus the minimum weight matrix of each point that has been calculated before to other points.
    W2(s(1),s(2))=min(min(W2))*1.1;      %% In order not to keep the s-point still the smallest point
    [a,b]=min(W2);                       %% a returns the minimum value of each column of W2, b returns the row number of the minimum value of each column
    [~,d]=min(a);                        %% d returns the column number of the minimum value of vector a
    s(1)=b(d);                           %% So s1 and s2 are the row and column numbers of the W2 minimum, respectively
    s(2)=d;
    TRACE=cat(1,TRACE,s);                %% Line up the positions you want to move
end

if(step>=N*2);
	disp('stopped by too many steps!');end;
end	

