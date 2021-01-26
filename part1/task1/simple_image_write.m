function simple_image_write(savefilename,filename)
%
%function to store a image in 16-bit inter and voxel dimensions in 32-bit
%floating.(write the image size into"header"）
%
%load an example data
sim=load(filename);
%write the size into file header
sim.voxsize=size(sim.vol);
sim_filename=[savefilename,'.sim'];
%write the voxel size and voxel dimensions in 32-bit floating, the
%intensity in 16-bit integer
fid=fopen(sim_filename,'w');
fwrite(fid,sim.voxsize,'float32');
fwrite(fid,sim.voxdims,'float32');
fwrite(fid,sim.vol,'int16');
fclose('all');
    
figure
for i=1:30
imagesc(sim.vol(:,:,i));colormap gray
pause(0.1)
end