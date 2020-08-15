% Get images of folder (filter directories)
imfiles = dir('..\01\');
imfiles = imfiles([imfiles.isdir] == 0);

% Get first image
im1 = imread(['/' imfiles(1).folder '' imfiles(1).name ]);

% Create image buffer
[Y, X] = size(im1);
T = length(imfiles);
kls = class(im1);
ims = zeros(Y,X,T,kls);

% Save images
for t=1:T
    im = imread([ imfiles(t).folder '' imfiles(t).name ]);
    ims(:,:,t) = im;
end

% Convert to grayscale
ims = mat2gray(ims);