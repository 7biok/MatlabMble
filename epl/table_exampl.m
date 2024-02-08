load EPLresults.mat
homegf=EPL.HomeGF;
Awaygf=EPL.AwayGF;
morehomegoals=homegf>Awaygf;
homewinning=EPL.HomeWins>=EPL.HomeLosses;
EPL.TrueColumnWin=homewinning;
EPL.TrueColumnMoreGoal = morehomegoals;

awaywinning=EPL.AwayWins >=EPL.AwayLosses;
EPL.winning=homewinning&awaywinning;
anytest = any(winning)
if anytest == true
disp('Есть ли команды,   у которых побед больше.чем поражений:да')
else 
    disp('Есть ли команды,   у которых побед больше.чем поражений:нет')
end

EPL.HFA=homewinning | morehomegoals;
all(HFA)
