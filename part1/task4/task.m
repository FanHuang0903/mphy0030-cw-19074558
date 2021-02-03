% written for coursework part 1 task 4
% author: FanHuang
% student number: 19074558
%
% for UCL MPHY0030 2020-21
%
clc;clear;
% read an example triangulation mesh in the csv files;
vertices = csvread('data_example_vertices.csv');
triangles = csvread('data_example_triangles.csv');

% smooth the surface mesh with three different numbers of iterations, 5, 10, 25.
iter_5 = lowpass_mesh_smoothing(vertices, triangles, 5);
iter_10 = lowpass_mesh_smoothing(vertices, triangles, 10);
iter_25 = lowpass_mesh_smoothing(vertices, triangles, 25);

%% visualization
% plot the results before and after 5/10/25 filtering operations
figure,
axis equal, 
h1 = patch('vertices',vertices,'faces',triangles, ...
    'facecolor','r','edgecolor','r','edgealpha',.2,'facealpha',.2);
h2 = patch('vertices',iter_5,'faces',triangles, ...
    'facecolor','b','edgecolor','b','edgealpha',.2,'facealpha',.2);
view(3)
legend([h1,h2],'before filtering','after 5 iterations');
saveas(gcf, 'mesh_smoothing_with_5_iterations.png');
figure,
axis equal, 
hold on;
h1 = patch('vertices',vertices,'faces',triangles, ...
    'facecolor','r','edgecolor','r','edgealpha',.2,'facealpha',.2);
h3 = patch('vertices',iter_10,'faces',triangles, ...
    'facecolor','g','edgecolor','g','edgealpha',.2,'facealpha',.2);
view(3)
legend([h1,h3],'before filtering','after 10 iterations');
saveas(gcf, 'mesh_smoothing_with_10_iterations.png');
figure,
axis equal, hold on;
h1 = patch('vertices',vertices,'faces',triangles, ...
    'facecolor','r','edgecolor','r','edgealpha',.2,'facealpha',.2);
h4 = patch('vertices',iter_25,'faces',triangles, ...
    'facecolor','y','edgecolor','y','edgealpha',.2,'facealpha',.2);
view(3)
legend([h1,h4],'before filtering','after 25 iterations');
saveas(gcf, 'mesh_smoothing_with_25_iterations.png');


%h1=trisurf(triangles, vertices(:, 1), vertices(:, 2), vertices(:, 3));
%h2 = trisurf(triangles, iter_5(:, 1), iter_5(:, 2), iter_5(:, 3));
%h3 = trisurf(triangles, iter_10(:, 1), iter_10(:, 2), iter_10(:, 3));
%h4 = trisurf(triangles, iter_25(:, 1), iter_25(:, 2), iter_25(:, 3));


