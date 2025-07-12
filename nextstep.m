function [s3,dis] = nextstep(s1,s2,dis0)   
%% s1 is the normalized random s value, s2 is the normalized position value, and dis0 is the reference quantity equal to 1/N2

dis=norm(s1-s2);                                %% Calculate the distance between s1 and s2
if dis0>dis                                     %% If the distance between s1 and s2 is small enough, s3 directly returns the value of s2, which is the position specification value, 
												%% and dis returns the distance between s1 and s2
    s3=s2;
else                                            %%If the distance between s1 and s2 is large, s3 returns the value of s1, plus the correction value of the distance between s1 and s2, and dis returns the standard value of dis0. 
												%% This is very similar to the second part of the movement in the mainUAV function, which needs to meet each movement
    s3=s1+(s2-s1)*dis0/dis;                     %% The step size is smaller than the step size.  
    dis=dis0;
end
end

