clc;

%% Map information
N=20; % The number of subdivision grids of the map is N * N, and the range of points on the map is [0,1] * [0,1]
N2=50; % Number of map subdivisions when calculating points
EPISOD_SUM=20*N;
K=15;  % Threat factor

%% UAV Information
INITIAL=[.1 .05];  % Escape starting point
INITIAL2=[.65 .1];
OBSER_RADIS=0.2;    % Observation radius 0 <x <1
stepWay=0.02;       % The distance a drone moves

initialize;
main_UAVs;

%% Save final image
drawBackground;
saveas(gcf,['.\pic\',dirname,'\','finish_t=',num2str(t),'s'],'png');