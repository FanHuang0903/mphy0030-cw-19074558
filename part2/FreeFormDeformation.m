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
        
        function [control_point,precomputes_control_point]=constructor(num,range)

            
        end

        function [control_point,precomputes_control_point]=opt_constructor(image,num)
            
 
        end

        function moved_point=random_transform_generator(image,precomputes_control_point,strength_of_the_randomness)
          
        end
        

        function warpedimage=warp_image(image,moved_point,control_point,RBFSpline_alpha,RBFSpline_sigma)

        end
        
        
        function warpedimage=random_transform(image,num,range,strength,lambda,sigma)
            moved_point=random_transform_generator(image,precomputes_control_point,strength_of_the_randomness);
            warpedimage=warp_image(image,moved_point,control_point,RBFSpline_alpha,RBFSpline_sigma);
            
            figure
            imagesc(warpedimage(:,:,20))
 
        end
    end
end
