function [test]= imeq(im, figshow)
%{
Equalizes the histogram, threshold. 
%}
    tophatim=imtophat(im, strel('disk', 7));
    newim = adapthisteq(tophatim,'NumTiles',[50 50],'ClipLimit',0.1);
    test1=imnlmfilt(newim,'DegreeofSmoothing',.35); 
    test=entropyfilt(test1);
    test=mat2gray(test);

if figshow == 1
[c1, ct1]=imhist(test);
figure; 
subplot(1,3,1); imagesc(newim); colormap gray; title('Equalized Histogram');
subplot(1,3,2); imagesc(test1); colormap gray; title('Non Linear Filter');
subplot(1,3,3); imagesc(test); colormap gray; title('Entropy Filter');
sgtitle('Preprocessing Progression');
figure; imshowpair(im, test); title('Equalized result plotted on top of Original Image');
figure; 
subplot(1,2,1);imagesc(test); colormap gray; title('Equalized + Filtered');
subplot(1,2,2); bar(ct1, c1); title('New Distribution');
elseif fighosw == 0
else
    error("figshow needs to be 0 or 1");
end

end
