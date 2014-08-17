%using val2.txt as the test set
%we are measuring ABO for any object, not specific object.
%ids=textread('/home/gneelima/work/code/objectProposals/bingNew/unix/BING-Objectness-master/ILSVRC2013/ImageSets/Main/val2.txt','%s%*[^\n]');

annotationDir=config.input.annotationDir;
load 'gtImageNet13Val2.mat'
gtBoxes=cell(1);
gtImageNames=cell(1);
img_nr=1;
count=0;
indices=[];
for i=1:length(imagesWithObj)
	id=imagesWithObj(i);
	annoPath=[annotationDir id{1} '.xml'];
	rec=PASreadrecord(annoPath);

	if(isfield(rec,'objects'))
		num_objects=length(rec.objects);
		bbox=zeros(num_objects,4);
        	for j=1:num_objects
        		bbox(j,:)=rec.objects(j).bbox;
    		end
    	gtBoxes{1}=[gtBoxes{1};bbox];
     	gtImageNames{1}=[gtImageNames{1},ones(1,num_objects)*img_nr];
    	img_nr=img_nr+1;
	else
		fprintf('%s \n',id{1});
		count=count+1;
		indices(count)=i;
	end
end

save('gtImageNet13Val2.mat','gtBoxes','gtImageNames','imagesWithObj','-append');

