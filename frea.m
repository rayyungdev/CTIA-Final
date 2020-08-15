function [im] = frea(fname,figshow)
%{
Basic Function to read and normalize image. 
%}
im=mat2gray(fname);
[counts, cents]=imhist(im);
if figshow == 1
    figure;
    subplot(1,2,1);imagesc(im); colormap gray; title('Original Image');
    subplot(1,2,2); bar(cents, counts); title('Histogram');
end
end