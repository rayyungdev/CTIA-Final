function [bin_test]= bint(im, imo, figshow)
bin_test=imbinarize(im,graythresh(im));

if figshow == 1
figure; imagesc(bin_test); colormap gray; title('Binarized Entropy Filtered Image');
figure; imshowpair(imo, bin_test); title('Figure 5 overlayed on original image');
end

end
