%% Example: F16

lin = -5:0.05:5;
len = length(lin);
[XS, YS] = meshgrid(lin,lin);
X = [XS(:) YS(:)]';
Y = benchmarks(X, 21);

ZS = reshape(Y,[len len]);

mesh(XS, YS, ZS)

%%

N = 200;
X = rand(2, N)*10 - 5;
Y = benchmarks(X, 21);

%%

figure;
scatter3(X(1,:),X(2,:),Y)

%%

save('data/data.mat', 'X', 'Y')