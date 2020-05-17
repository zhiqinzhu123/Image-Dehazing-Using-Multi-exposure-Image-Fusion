clc
clear all
addpath('support functions');
% process a demo image
path = './demo_images/';
im_name = [path, 'cqupt.jpg']; % Fig. 7
I_hazy = imread(im_name);

% Increase clip_range to remove more haze - at the risk of overenhancement
tic
Dehazed_im = amef(im2double(I_hazy));
time = toc;
[m, n, ~] = size(I_hazy);
disp(['Resolution: ', num2str(m), ' x ', num2str(n)])
disp(['Processing time: ', num2str(time)])

figure(1), imshow(I_hazy)
figure(2), imshow(Dehazed_im)
