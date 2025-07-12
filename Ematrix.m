 function [E]= Ematrix(N, e)		%% e is enemysK
eNum=size(e,1);                   %% Returns the number of rows in matrix e
E=zeros(N,N);                     %% Let E be the zero matrix of N times N
for i=1:eNum                      %% First layer loop from 1 to the last row of matrix e
    td=zeros(N,N);                %% Td of each layer is a zero matrix of N times N
    for x=1:N                     %% Then go from 1 to N for the second layer of loop, where x is the row
        for y=1:N                 %% Loop through the third layer from 1 to N, where y is the column
			%% Calculate the distance between the known enemies and each point in the grid once the enemies are encountered
            td(x,y)=norm([x/N-e(i,1) y/N-e(i,2)]); %% The distance between the xth row and the yth column of the td matrix is the distance between x / N-e (i, 1) and y / N-e (i, 2)
        end
    end
    te=gaussmf(td,[e(i,3) 0]);    %% Threat area function, based on enemy's radius and distance (as a mean) so the threat is max when distance is 0
									%% as in the probability function reaches its peak at the mean (which is 0)
    E=1-(1-E).*(1-te);            %% Taking into account the current threat area function formed by all enemies
									%% Total probabilistic risk at position (x,y)
end
end
