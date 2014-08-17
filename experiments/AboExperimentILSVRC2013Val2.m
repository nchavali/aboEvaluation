%This is ABO evaluation for val2 on Imagenet2013/2014 images
%val2 is the file that Ross Girshick created


dataLoc='/home/gneelima/work/data/input/aboEvaluation/ILSVRC13/';
gtFile=[dataLoc 'gtImageNet13Val2.mat']
proposalFile=[dataLoc 'selectiveSearchVal2BoxesForABOEval.mat'];

outputLoc='/home/gneelima/work/data/output/aboEvaluation/ILSVRC13/';
resultFile=[outputLoc 'ssAllBoxes.mat']
config=generateConfig(gtFile,proposalFile);

load(gtFile);
load(proposalFile);

[abo,mabo,~,avgBoxes]= BoxAverageBestOverlap(selSearchConsistentGtBoxes , gtImageNames,sel_boxes );

fprintf('************ABO is %d ',abo);

save(resultFile,'abo','mabo','avgBoxes');

