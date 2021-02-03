%written for coursework part 2
% author: FanHuang
% student number: 19074558
% for UCL MPHY0030 2020-21
%
clc;clear;
%load data
load('data_example_image.mat');

% creates an object of the Image3D class
image = Image3D(vol,voxdims);

% set the number of control points required in x, y and z directions
% sets the range to be an empty array so that the FreeFormDeformation constructor
num = [10 10 10];
range = image.range;

% uses the constructor with Image3D object
[control_point,precomputes_control_point]=FreeFormDeformation.constructor(num,range)

% sets the strength of the random_transform_generator: 0-1
rand_strength = 0.8;

% lambda is used as the localization paramter
% sets the Gaussian kernel parameter
lambda = 0.01;
sigma = 4;

%Generating 10 different randomly transformed images and plot 5 images for each transformed image at different z depths.
strength=(randi([1,1000],1,10))/1000;
figure
for i=10
    figure
    warpedimage=FreeFormDeformation.random_transform(image,num,range,strength(i),lambda,sigma);
    subplot(1,5,1)
    imagesc(warpedimage(:,:,5))
    subplot(1,5,2)
    imagesc(warpedimage(:,:,10))
    subplot(1,5,3)
    imagesc(warpedimage(:,:,15))
    subplot(1,5,4)
    imagesc(warpedimage(:,:,20))
    subplot(1,5,5)
    imagesc(warpedimage(:,:,25))
end











