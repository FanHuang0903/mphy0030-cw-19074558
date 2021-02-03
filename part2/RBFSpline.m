classdef RBFSpline
    % RBFSpline, including
    % a spline fitting function fit
    % a evaluate function evalute
    % a Gaussian kernel function kernel_gaussian
    
    properties
     % the solution of the RBF registration equation
        alpha      
    end
    
    methods
        function alpha = fit(source,target,lambda,sigma)
            % spline fitting function,fit
            % Input:  
            %a set of source points: original selected control points
            %target points: after transforming control points
            % lambda: the weighting parameter 
            %Gaussian parameter: sigma
            % Output: alpha,the spline coefficients
            % using kernel_gaussian function to computer K matrices 
            K = RBFSpline.kernel_gaussian(query,contro,sigma);
        %least squares problem: (K+lambda*I)*alpha = q_k.
        %solve this by using svd,the reasons are mentioned in part2_report
        [U,S,V]=svd(K)
        alpha=V.*inv(S).*U.*target;
         
        end
      % define the evaluate function 
       function transformed_query_points = evaluate(query,control,alpha,sigma)
       %Input: 
       % a set of query points: -2D matrix,3*M, 3=xyz=coordinates, M=number of voxels
       % control points
       %the spline coefficient:alpha
       % Gaussian parameter:sigma
       %Output: the transformed query point set
       K = RBFSpline.kernel_gaussian(query,control,sigma);
       transformed_query_points = K.*alpha;
        end
        % calculate K 
        function K = kernel_gaussian(query,control,sigma)
         % Input: 
         % query points - Query points need to be transform to target space
         % control points - 
         % sigma - scalar
         % Output: the kernal value, K
        M = size(query, 2);
        N = size(control, 2);
        r = zeros(M*N,3);
      % vectorization 
       for i = 1:M
       r(:, (i-1)*N+1:i*N) = query(:, i) - control;
       end
       K = exp(-r.^2./(2*sigma^2));
       end  
            
    end
end
