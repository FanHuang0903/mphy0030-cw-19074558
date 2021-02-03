function [optimal,allsteps,grad_abs,iter]=gradient_descent(multivar_func,initial_value,step_size,max_iter,tol)

% define function x variable
syms x1 x2 x3

dfunc_dx1=diff(multivar_func,x1);
dfunc_dx2=diff(multivar_func,x2);
dfunc_dx3=diff(multivar_func,x3);
temp_value=zeros(max_iter,3);
temp_value(1,:)=initial_value;
grad_abs=zeros(1,max_iter);

for iter=1:max_iter
    
    gradx1=double(subs(dfunc_dx1,[x1 x2 x3],temp_value(iter,:)));
    gradx2=double(subs(dfunc_dx2,[x1 x2 x3],temp_value(iter,:)));
    gradx3=double(subs(dfunc_dx3,[x1 x2 x3],temp_value(iter,:)));
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