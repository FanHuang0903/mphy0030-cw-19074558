function [optimal,allsteps,grad_abs,iter]=gradient_descent_with_finite_difference_gradient(multivar_func,initial_value,step_size,max_iter,tol)

% define function x variable
syms x1 x2 x3

temp_value=zeros(max_iter,3);
temp_value(1,:)=initial_value;
grad_abs=zeros(1,max_iter);

for iter=1:max_iter
    
    fdgrad=finite_difference_gradient(multivar_func,temp_value(iter,:));
    gradx1=fdgrad(1);
    gradx2=fdgrad(2);
    gradx3=fdgrad(3);
    temp_value(iter+1,:)=temp_value(iter,:)-([gradx1 gradx2 gradx3].*step_size);
    grad_abs(iter)=(gradx1.^2+gradx2.^2+gradx3.^2).^(1/2);
    
    % if abs of grad < tolerence, stop gradient descent
    if grad_abs(iter)<tol
        break
    end
    
end

% define output
optimal=temp_value(iter,:);
allsteps=temp_value(1:iter,:);
grad_abs=grad_abs(1:iter);
end