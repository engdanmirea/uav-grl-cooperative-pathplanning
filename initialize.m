%% Initialisation

enemysUK=enemyGuass();        % ememyGuass is a defined function that imports enemy data and comes down to an unknown enemy queue
enemysUK2=enemyGuass();
enemysK=[];                   % Known enemy queue is empty
enemysK2=[];
enemysUK2plot =enemyGuass();  % ememyGuass is a defined function that imports enemy data and comes down to an unknown enemy queue
TARGET = round([0.9 0.9]*N ); % round is a rounding function that follows rounding. TARGET as the end point
pos=INITIAL;                  % INITIAL is the starting position, assign it to pos, and set it as the UAV starting position, between 0 and 1. 
pos2=INITIAL2;
								%% Pos is the position of the current plan, which will change as the drone moves.
traceRecord=[];
traceRecord2=[];
needRePlan=1;                 % Need to re-plan the marker bit, and re-plan the path when a new enemy is encountered
imgnum=0;                     % Number of main loop while

%% Create data save folder
dirname=['single_K_',num2str(K),'_pos1_',num2str(INITIAL(1,1)),'_',num2str(INITIAL(1,2)),'_N_',num2str(N)];
mkdir('.\pic\',dirname);