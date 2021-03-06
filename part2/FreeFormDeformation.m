classdef FreeFormDeformation
    
    properties
        control
        query
        x;
        y;
        z;
        X;
        Y;
        Z;
    end
    
    methods (Static)
        function FFDobject = constructor(num,range);
            %Input:
            % Number of control points in x,y z,num
            %the range that the distribution of control points 
          FFDobject.x = linspace(range(1,1),range(1,2),num(1));
          FFDobject.y = linspace(range(2,1),range(2,2),num(2));
          FFDobject.z = linspace(range(3,1),range(3,2),num(3));
          [FFDobject.X,FFDobject.Y,FFDobject.Z] = meshgrid(FFDobject.x,FFDobject.y,FFDobject.z);
            
        end

        function [control_point,precomputes_control_point]=opt_constructor(image,num)
            
 
        end

        function target=random_transform_generator(image,precomputes_control_point,strength_of_the_randomness)
        
            target.control = zeros(size(source));
            
            for i = 1:prod(num)
            
            target.dx = strength_of_the_randomness *3* randn(1,1);
            target.dy = strength_of_the_randomness *3* randn(1,1);
            target.dz = strength_of_the_randomness *3* randn(1,1);
            
            
            target.control(i,1) = source(i,1) + target.dx;
            target.control(i,2) = source(i,2) + target.dy;
            target.control(i,3) = source(i,3) + target.dz;
            end  
        end
        

        function warpedimage=warp_image(image,target,control_point,RBFSpline.alpha,sigma)

        end
        
        
        function warpedimage=random_transform(image,num,range,strength,lambda,sigma)
            target=random_transform_generator(image,precomputes_control_point,strength_of_the_randomness);
            warpedimage=warp_image(image,target,control_point,RBFSpline_alpha,RBFSpline_sigma);
            
            figure
            imagesc(warpedimage(:,:,20))
 
        end
    end
end
