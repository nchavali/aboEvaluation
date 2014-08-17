PErforming ABO evaluations:

This code has been taken from MABO/ABO evaluation code of Selective Search paper.
To evaluate ABO/MABO you need 3 inputs:

gtBoxes: These are the ground truth boxes
gtImIds: 
generated boxes: a cell array containing the boxes for each image. each unit
of the cell contains nx4 dimensional matrix, where n is the number of
proposals generated for an image, and 4 represents the 4 coordinates of the
bounding boxes
Look at GroundTruthVOC2007test.mat for info on what is expected in the first 2 inputs.
Note the GT Boxes and  generated boxes should be consistent, i.e, make sure
the 4 coordinates of a bounding box mean the same in GT Boxes and  generated
boxes.
