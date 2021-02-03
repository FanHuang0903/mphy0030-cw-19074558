function fdgrad=finite_difference_gradient(multivar_func,x)
syms x1 x2 x3
fdgrad=zeros(1,3);
step_size=0.000001;

x1_step=[x(1)+step_size,x(2),x(3)];
x2_step=[x(1),x(2)+step_size,x(3)];
x3_step=[x(1),x(2),x(3)+step_size];

fdgrad(1)=(double(subs(multivar_func,[x1 x2 x3],x1_step))-double(subs(multivar_func,[x1 x2 x3],x)))/step_size;                                                       
fdgrad(2)=(double(subs(multivar_func,[x1 x2 x3],x2_step))-double(subs(multivar_func,[x1 x2 x3],x)))/step_size;      
fdgrad(3)=(double(subs(multivar_func,[x1 x2 x3],x3_step))-double(subs(multivar_func,[x1 x2 x3],x)))/step_size;      

end