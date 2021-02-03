% written for coursework part 1 task 3
% author: FanHuang
% student number: 19074558
%
% for UCL MPHY0030 2020-21
clc;clear;
% set random x a
x=0.1.*randi([1 10],[1 3]);
a=randi([1 10],[1 10]);

% set function
syms x1 x2 x3
func=quadratic_polynomial([x1 x2 x3],a);


% parameter of gradient_descent
multivar_func=func;
initial_value=x;
step_size=0.01;
max_iter=100;
tol=5;

% use gradient_descent
[optimal,allsteps,grad_abs,iter]=gradient_descent(multivar_func,initial_value,step_size,max_iter,tol);
% [optimal,allsteps,grad_abs,iter]=gradient_descent_with_finite_difference_gradient(multivar_func,initial_value,step_size,max_iter,tol);

%% visualization

% draw all steps
figure
subplot(1,2,1)
plot3(allsteps(:,1),allsteps(:,2),allsteps(:,3));grid on;
title('All steps')
subplot(1,2,2)
plot(1:iter,grad_abs,'o-b');grid on;
xlabel('iteration')
ylabel('Change of value between subsequent steps')
title('Gradient descent')
saveas(gcf, 'gradient descent all steps.png');
% plot in different z axis
figure
title('Gradient descent')
for i=1:9
visfunc=subs(func,x3,i-5);
subplot(3,3,i)
fcontour(visfunc,'Fill','On');
hold on;
plot(allsteps(:,1),allsteps(:,2),'x-r');
title(['z= ',num2str(i-5)])
end
saveas(gcf, 'gradient descent in different z axis.png');






