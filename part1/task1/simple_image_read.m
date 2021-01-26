function sim=simple_image_read(filename)
%
%function to read the file 
%
%
%
sim_filename=[filename,'.sim'];
sim_fid = fopen(sim_filename,'r');
%read the file from header
sim.voxszie=single(fread(sim_fid,3,'float32'));
sim.voxdims=single(fread(sim_fid,3,'float32'));
sim.vol=int16(reshape(fread(sim_fid,'int16'),sim.voxszie(1),sim.voxszie(2),sim.voxszie(3)));
fclose('all');

figure
for i=1:30
imagesc(sim.vol(:,:,i));colormap gray
pause(0.1)
end
