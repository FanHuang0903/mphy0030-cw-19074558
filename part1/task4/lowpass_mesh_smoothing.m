function after_smoothing = lowpass_mesh_smoothing(p,triangles,iterations,lambda,mu);
% set the parameters with default value
if nargin == 2
    iterations = 10;
    lambda = 0.9;
    mu = -1.02 * lambda;
elseif nargin == 3
    lambda = 0.9;
    mu = -1.02 * lambda;
end

for i = 1:iterations %loop for number of iterations
    for j= 1:size(p,1);% loop for each vertex

%due to the new position of all vertices results from its old position and its neighbors 
%so we need to find neighbors from triangles and vertice number
% parameters from reference
% p_prime:the new position of all vertices
% p: old position of vertices
% q: neighbours of vertices    
% omega, the weighting factor
    % find the index in example triangles which vertex need to be transformed  
    tri_index = find(any(triangles==j,2));
    % using the index to get the neighbor triangles 
    q_tri = triangles(tri_index,:); 
    % remove the repeated neighbour vertices
    q_tri = unique(q_tri); 
    % precompute for the weighting factor
    num_neighbours = numel(q_tri);
    % compute the weighting factor, omega 
    omega = 1 / num_neighbours; 
    % create the neighbours' coodinate 
    q = p(q_tri,:); 
    % with the first Lowpass filter 
     p(j,:) = p(j,:) + lambda*omega*(sum(q - p(j,:))); 
    % in second step, the Laplace filter is applied again but now lambda is replaced by mu 
    p_prime(j,:) = p(j,:) + mu*omega*(sum(q - p(j,:)));  
    % update the vertices after smoothing
    after_smoothing(j,:) = p_prime(j,:); % save new position into smoothed matrix
    end
end
end