% written for coursework part 1 task 2
% author: FanHuang
% student number: 19074558
%
% for UCL MPHY0030 2020-21
%
clc;clear
%generate 10,000 samples of x randomly
numOfsample=10000;
x1=randn(1,numOfsample,'single');
x2=randn(1,numOfsample,'single');
x3=randn(1,numOfsample,'single');
X=[x1;x2;x3];

%computing the mean and covariance
mu=[mean(X(1,:)),mean(X(2,:)),mean(X(3,:))]';

sigma=zeros(3,3);
for i=1:numOfsample
sigma=sigma+((X(:,i)-mu)*(X(:,i)-mu)');
end
sigma=sigma/numOfsample;

%computing the multivariate Gaussian probability density

for j=1:numOfsample
p(j)= gaussian_pdf(X(:,j),mu,sigma);
end

%compute the 10th,50th and 90th percentiles of the probability densities
prc=p;
prc_10th=prctile(p,10);
prc_50th=prctile(p,50);
prc_90th=prctile(p,90);

%% visualization
% plot the pdf values.
%figure
%subplot(141)
%scatter3(x1,x2,x3,10,p*100,'filled')
%title('Randomly generate 10,000 samples')
%axis equal
%axis([-3 3 -3 3 -3 3])

subplot(141)

prc_10_loc=find(prc<prc_10th);
prc(prc_10_loc)=[];
x1(prc_10_loc)=[];
x2(prc_10_loc)=[];
x3(prc_10_loc)=[];
ellipsoid(0,0,0,(max(x1)-min(x1))/2,(max(x2)-min(x2))/2,(max(x3)-min(x3))/2)
title('surfaces of 10th percentiles probability densities')
% scatter3(x1,x2,x3,10,prc_10*100,'filled')
axis equal
axis([-3 3 -3 3 -3 3])

subplot(142)

prc_50_loc=find(prc<prc_50th);
prc(prc_50_loc)=[];
x1(prc_50_loc)=[];
x2(prc_50_loc)=[];
x3(prc_50_loc)=[];
ellipsoid(0,0,0,(max(x1)-min(x1))/2,(max(x2)-min(x2))/2,(max(x3)-min(x3))/2)
title('surfaces of 50th percentiles probability densities')
% scatter3(x1,x2,x3,10,prc_10*100,'filled')
axis equal
axis([-3 3 -3 3 -3 3])

subplot(143)
prc_90_loc=find(prc<prc_90th);
prc(prc_90_loc)=[];
x1(prc_90_loc)=[];
x2(prc_90_loc)=[];
x3(prc_90_loc)=[];
ellipsoid(0,0,0,(max(x1)-min(x1))/2,(max(x2)-min(x2))/2,(max(x3)-min(x3))/2)
title('surfaces of 90th percentiles probability densities')
% scatter3(x1,x2,x3,10,prc_10*100,'filled')
axis equal
axis([-3 3 -3 3 -3 3])

saveas(gcf, 'three ellipsoid surfaces.png');
