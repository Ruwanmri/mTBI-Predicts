function [cfgCue, cfgExp, cfgTrigger] = read_cue(cfgFile, cfgExp, cfgCue, cfgTrigger)
% [cfgCue, cfgExp, cfgTrigger] = read_cue(cfgFile, cfgExp, cfgCue, cfgTrigger)
% randomly reads the cue

fileDirCue = dir([cfgFile.cue, '*.jpg']);
cfgCue.cueStim = cell(cfgExp.numStim, 1);  % preallocation

% read cue images 
rng('shuffle')
cfgCue.cueRndIdx = randi(2, cfgExp.numStim, 1);  % random index for cue - 1:right, 2:left
for stim = 1:cfgExp.numStim
    cfgCue.cueStim{stim,1} = imread(fileDirCue(cfgCue.cueRndIdx(stim)).name);  % read cue randomly
end

% collect correct responses for questions in the corresponding row +
% triggers
cfgExp.corrResp = cell(cfgExp.numStim, 2);
cfgTrigger.cuesDir = cell(cfgExp.numStim, 2);

cfgExp.corrResp(find(cfgCue.cueRndIdx == 1), 1) = {'RightArrow'};%original
%cfgExp.corrResp(find(cfgCue.cueRndIdx == 1), 1) = {'2'};%ruwan
cfgExp.corrResp(find(cfgCue.cueRndIdx == 1), 2) = {'2'};
cfgExp.corrResp(find(cfgCue.cueRndIdx == 2), 1) = {'LeftArrow'};%original
%cfgExp.corrResp(find(cfgCue.cueRndIdx == 2), 1) = {'1'};%ruwan
cfgExp.corrResp(find(cfgCue.cueRndIdx == 2), 2) = {'1'};
cfgExp.corrResp(find(cfgExp.catchTrial == 1), [1, 2]) = {'no resp'};
cfgTrigger.cuesDir(find(cfgCue.cueRndIdx == 1), 1) = {'101'};  % trigger codes are 101 -> cue right, 102 -> cue left
cfgTrigger.cuesDir(find(cfgCue.cueRndIdx == 2), 1) = {'102'};  % trigger codes are 101 -> cue right, 102 -> cue left
cfgTrigger.cuesDir(find(cfgCue.cueRndIdx == 1), 2) = {'Right'};  % trigger message for Eyelink
cfgTrigger.cuesDir(find(cfgCue.cueRndIdx == 2), 2) = {'Left'};  

end