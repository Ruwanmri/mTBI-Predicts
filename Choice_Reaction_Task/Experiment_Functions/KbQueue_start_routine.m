function cfgExp = KbQueue_start_routine(cfgExp)
% KbQueue_start_routine(cfgExp)
% Starts KbQueueRoutine for the keyboard to start listening
% A call to KbQueueCheck is required for participants response

KbName('UnifyKeyNames');
cfgExp.startKey = KbName('5%');  % start key(ruwan testing)
cfgExp.quitKey = KbName('ESCAPE');  % quit key
%cfgExp.respKeyR = KbName('RightArrow');  % keyboard response female
%cfgExp.respKeyL = KbName('LeftArrow');  % keyboard response male
cfgExp.respKeyR = KbName('2@');  % keyboard response female ruwan test
cfgExp.respKeyL = KbName('1!');  % keyboard response male ruwan test
%cfgExp.NATAKeyR = KbName('7&');  % NATA box response female(original)
%cfgExp.NATAKeyL = KbName('4$');  % NATA box response male(original)
cfgExp.NATAKeyR = KbName('2@');  % NATA box response female (MRI ruwan testing)
cfgExp.NATAKeyL = KbName('1!');  % NATA box response male (MRI ruwan testing)
cfgExp.yesKey = KbName('y');  % yes response
cfgExp.noKey = KbName('n');  % no key
cfgExp.responses = [cfgExp.NATAKeyR, cfgExp.NATAKeyL, cfgExp.respKeyR, cfgExp.respKeyL];

% KB response: '4$' and '7&' are the left and right index fingers of the (5-button) NATA boxes
% KB response: '1!' and '2' are the left and right index fingers of the(5-button) NATA box (ruwan testing)
if cfgExp.MEGLab == 1
    cfgExp.activeKeys = [cfgExp.quitKey, cfgExp.NATAKeyR, cfgExp.NATAKeyL, cfgExp.yesKey, cfgExp.noKey];
    cfgExp.deviceNum = -1;  % listen to all devices during test/train
else
    cfgExp.activeKeys = [cfgExp.quitKey, cfgExp.respKeyR, cfgExp.respKeyL, cfgExp.yesKey, cfgExp.noKey];
    cfgExp.deviceNum = -1;  % listen to all devices during test/train
end

% only listen for specific keys
scanList = zeros(1,256);
scanList(cfgExp.activeKeys) = 1;
KbQueueCreate(cfgExp.deviceNum,scanList);  % create queue
KbQueueStart;  % start listening to input
KbQueueFlush;  % clear all keyboard presses so far

end
