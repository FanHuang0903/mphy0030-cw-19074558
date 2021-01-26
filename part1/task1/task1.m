% 
% author: FanHuang
%
% for UCL MPHY0030 2020-21
%
clc;clear;
%load an example image in mat file,“data/example_image.mat”.
ori=load('data_example_image.mat');
%using simple _image_write function write the image into a file "data.sim"
simple_image_write('image','data_example_image.mat')
%using simple_image_read function to read the file “data/image.sim” 
sim=simple_image_read('image')
%plot 3 images at different z-coordinates
figure
subplot(321)
imagesc(ori.vol(:,:,10));colormap gray;axis square
title('original image,z=10')
subplot(322)
imagesc(sim.vol(:,:,10));colormap gray;axis square
title('sim-file image,z=10')
subplot(323)
imagesc(ori.vol(:,:,20));colormap gray;axis square
title('original image,z=20')
subplot(324)
imagesc(sim.vol(:,:,20));colormap gray;axis square
title('sim-file image,z=20')
subplot(325)
imagesc(ori.vol(:,:,30));colormap gray;axis square
title('original image,z=30')
subplot(326)
imagesc(sim.vol(:,:,30));colormap gray;axis square
title('sim-file image,z=30')

