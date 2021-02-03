function p=gaussian_pdf(x,mu,sigma) 
%function to implement a 3D Gaussian probability density function
%
%INPUTS: mu:  mean vector ;
%        sigma: covariance matrix ;
%
p=exp((-1/2).*(x-mu)'*inv(sigma)*(x-mu))/((2.*pi).^(3/2).*sqrt(det(sigma)));
