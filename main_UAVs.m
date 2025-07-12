tic; %% Begin timing 
while(isequal(round(pos*N),TARGET)==0 || isequal(round(pos2*N),TARGET)==0)       %% When the current drone position is different from the target position, the drone moves forward
    imgnum=imgnum+1;                         %% Plus one
    %% Perform a path planning (this part of the operation is only performed when a new enemy is encountered, that is, the enemy queue changes, 
	%% this part is calculated as the R matrix, so as to determine the Q matrix).
	
    if(needRePlan==1)
        needRePlan=0;
        disp('replanning...');
        E=Ematrix(N2,enemysK); 
        E2=Ematrix(N2,enemysK2);
        %%Call the Ematrix function and assign the obtained value to E. 
											%% Ematrix is a function used to calculate the threat area posed by the currently detected enemy. 
											%% E = Total probabilistic risk at position (x,y)
											%% N2 and enemysK are: the number of map subdivisions used for integration, and the known enemy sequence.
												
        TRACE=planning(round(pos*N),TARGET,E,N,EPISOD_SUM,K);  
        TRACE2=planning(round(pos2*N),TARGET,E,N,EPISOD_SUM,K);
		%% Call the planning function. The planning function is used. Round (pos * N) is the current position, TARGET is the target position, 
		%% E is the value calculated by Ematrix in the previous step, N is the number of map subdivisions, EPISOD_SUM, and K is the threat coefficient.
    end
    
    %% The TRACE given in this step is a walking plan that is planned in the context of the current enemy, and will be implemented in the next part.
    %% Decide where to go next
	%% To decide a movement position (the upper portion of the rear portion Q and R is determined at that time matrix determined by the enemy, be selected for each step)
	
    if(isequal(round(pos*N),TRACE(1,1:2))==1)
        TRACE(1,:)=[];                     %% If the first line has been reached, then remove the first line, start from the second line, and so on
    end
    
    if(isequal(round(pos2*N),TARGET)==0)
        if(isequal(round(pos2*N),TRACE2(1,1:2))==1)
            TRACE2(1,:)=[];                     %% If the first line has been reached, then remove the first line, start from the second line, and so on
        end
    end

    tgoal=TRACE(1,1:2)/N;                  %% Normalize position values in a sequence of steps
    tgoal2=TRACE2(1,1:2)/N;
    dis=norm(tgoal-pos);                   %% Calculate the distance between the current position and the required position
    dis2=norm(tgoal2-pos2);

    if(dis>stepWay)                        %% stepWay is the distance of a drone movement
        pos=pos+(tgoal-pos)*stepWay/dis;   %% Move to this new position this time, the step size of the move is less than one stepWay
    else
        pos=tgoal;                         %% If it is less than one step in size, move directly here
    end
    
    if(dis2>stepWay)                        %% stepWay is the distance of a drone movement
        pos2=pos2+(tgoal2-pos2)*stepWay/dis2;   %% Move to this new position this time, the step size of the move is less than one stepWay
    else
        pos2=tgoal2;                         %% If it is less than one step in size, move directly here
    end
    
    traceRecord=cat(1,traceRecord,pos);    %% Record the position to which the movement is reached.The cat function with parameter 1 refers to [traceRecord; pos], which is arranged in a row.
    traceRecord2=cat(1,traceRecord2,pos2);
    
    %% The traceRecord is a record of each step, which counts all together, that is, all walking schemes
    %% Determine if you see a new threat (this section is used to determine if a new enemy has been encountered)
    i=1;
    while (i<=size(enemysUK,1) || i<=size(enemysUK2,1));                      %% The size function returns the number of rows in the matrix enemysUK, and enemysUK is a function of all enemies, 
														%% which means to search all enemies, from the first row to the last row
        if (norm(enemysUK(i,1:2)-pos)<OBSER_RADIS || norm(enemysUK2(i,1:2)-pos2)<OBSER_RADIS)    %% If the distance between the enemy's threat center and the current position is less than the observation radius, consider it
            enemysK=cat(1,enemysK,enemysUK(i,1:3));   %% The meaning of consideration is to add the observed enemysUK to enemyK and emit them in columns.
            enemysK2=cat(1,enemysK2,enemysUK2(i,1:3));
            enemysUK(i,:)=[];                         %% This line is set to empty
            enemysUK2(i,:)=[];
            needRePlan=1;                             %% Need to re-plan
        else
            i=i+1;
        end
    end
    
    %% Save image 
    if(mod(imgnum,5)==0)
    drawBackground;
    saveas(gcf,['.\pic\',dirname,'\','img',num2str(imgnum)],'png');   
    end
    close all;
end
t=toc;% Timed out

%% Calculate path length
pathlength=0;
pathlength2=0;
PL1=0;
PL2=0;
for ii=1:size(traceRecord)-1
    pathlength=pathlength+norm(traceRecord(ii+1)-traceRecord(ii));
    PL1=PL1+sqrt((traceRecord(ii+1,1)-traceRecord(ii,1)).^2+(traceRecord(ii+1,2)-traceRecord(ii,2)).^2);
end

for ii=1:size(traceRecord2)-1
    pathlength2=pathlength2+norm(traceRecord2(ii+1)-traceRecord2(ii));
    PL2=PL2+sqrt((traceRecord2(ii+1,1)-traceRecord2(ii,1)).^2+(traceRecord2(ii+1,2)-traceRecord2(ii,2)).^2);
end
