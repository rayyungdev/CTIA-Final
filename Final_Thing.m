%{
Combining all functions
frea, imeq, bint, finseg
segment.thresholdimages. 
bw & bwlog 
imlog, lever 
%}
close all; 
clear all;
clc;
%addpath(genpath('../DIC-C2DH-HeLa'))
addpath(genpath('C:\Users\ry88\Documents\SpringTerm\CellTissueAnalysis\NoneAcademic\HeLa'));
%%
fname=imread('t001.tif');
im=frea(fname,1);
im2=imeq(im, 1);
im3=bint(im2, im, 0);
%%
bbw = bwareaopen(im3, 40);
figure; imagesc(bbw); colormap gray;
d=bwdist(bbw);
d=-d;
L=watershed(d);
L(~bbw)=0;
bwWatershed=logical(L);
%%
figure; imagesc(im);
hold on;
colormap gray;
[B, L]=bwboundaries(bwWatershed);
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 1,'Color', 'r');
end


