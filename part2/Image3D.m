classdef Image3D
    %Image3D, a class which handle 3D medical images with different voxel dimensions, image sizes and data types
    % vol: the intesity values of image 
    % voxdims: the voxel dimensions of image
    % z are arrays of the x, y, and z axis in mm for the image. 
    % X,Y,Z 
     % range: to place the control points
    properties
        vol
        voxdims
        size
        x
        y
        z
        X
        Y
        Z
        range
    end
    
    methods(Static)
        function image = Image3D(vol,voxdims)
             image.vol = vol; 
             image.voxdims=voxdims;
             image.size = size(vol);
             
            image.x = (0:image.size(1)-1)*voxdims(1);
            image.y = (0:image.size(2)-1)*voxdims(2);
            image.z = (0:image.size(3)-1)*voxdims(3);
            
          %form 3D matrices containing all the pixel coordinates
           [image.X,image.Y,image.Z] = meshgrid(image.x,image.y,image.z);
           image.range = [min(image.x),max(image.x);min(image.y),max(image.y);min(image.z),max(image.z)];
        end
        
        
    end
end
