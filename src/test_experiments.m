%%

if ~exist('paths_to_project', 'var')
    error('Define global variable paths_to_project')
end

%% Params

% create all params
i=1;

P(i).name = 'dim';
P(i).values = {2};
i = i + 1;

% covariance function \in {SEiso, Matern3iso, Matern5iso, ARD versions}  3+3
P(i).name = 'covfun';
P(i).values = {
    struct('name', 'squaredexponential', 'params', {
        struct('lik', log(0.01), 'cov', log([0.5; 2]))
        struct('lik', log(0.05), 'cov', log([0.5; 2]))
        struct('lik', log(0.1), 'cov', log([0.5; 2]))
        struct('lik', log(0.25), 'cov', log([0.5; 2]))
        struct('lik', log(0.5), 'cov', log([0.5; 2]))
        struct('lik', log(1), 'cov', log([0.5; 2]))
    }, 'isARD', 0)
    struct('name', 'matern32', 'params', {
        struct('lik', log(0.01), 'cov', log([0.5; 2]))
        struct('lik', log(0.05), 'cov', log([0.5; 2]))
        struct('lik', log(0.1), 'cov', log([0.5; 2]))
        struct('lik', log(0.25), 'cov', log([0.5; 2]))
        struct('lik', log(0.5), 'cov', log([0.5; 2]))
        struct('lik', log(1), 'cov', log([0.5; 2]))
    }, 'isARD', 0)
    struct('name', 'matern52', 'params', {
        struct('lik', log(0.01), 'cov', log([0.5; 2]))
        struct('lik', log(0.05), 'cov', log([0.5; 2]))
        struct('lik', log(0.1), 'cov', log([0.5; 2]))
        struct('lik', log(0.25), 'cov', log([0.5; 2]))
        struct('lik', log(0.5), 'cov', log([0.5; 2]))
        struct('lik', log(1), 'cov', log([0.5; 2]))
    }, 'isARD', 0)
    struct('name', 'ardsquaredexponential', 'params', {
        struct('lik', log(0.01), 'cov', log([0.5; 2]))
        struct('lik', log(0.05), 'cov', log([0.5; 2]))
        struct('lik', log(0.1), 'cov', log([0.5; 2]))
        struct('lik', log(0.25), 'cov', log([0.5; 2]))
        struct('lik', log(0.5), 'cov', log([0.5; 2]))
        struct('lik', log(1), 'cov', log([0.5; 2]))
    }, 'isARD', 1)
    struct('name', 'ardmatern32', 'params', {
        struct('lik', log(0.01), 'cov', log([0.5; 2]))
        struct('lik', log(0.05), 'cov', log([0.5; 2]))
        struct('lik', log(0.1), 'cov', log([0.5; 2]))
        struct('lik', log(0.25), 'cov', log([0.5; 2]))
        struct('lik', log(0.5), 'cov', log([0.5; 2]))
        struct('lik', log(1), 'cov', log([0.5; 2]))
    }, 'isARD', 1)
    struct('name', 'ardmatern52', 'params', {
        struct('lik', log(0.01), 'cov', log([0.5; 2]))
        struct('lik', log(0.05), 'cov', log([0.5; 2]))
        struct('lik', log(0.1), 'cov', log([0.5; 2]))
        struct('lik', log(0.25), 'cov', log([0.5; 2]))
        struct('lik', log(0.5), 'cov', log([0.5; 2]))
        struct('lik', log(1), 'cov', log([0.5; 2]))
    }, 'isARD', 1)
};
i = i + 1;

% starting values of hyperparameters ? 5 different value-set for each cov. function  5
P(i).name = 'covhyp';
P(i).values = {1 2 3 4 5 6};
i = i + 1;

%%

totalComb = cp_get_total_comb_of_params(P);

for I = 1:totalComb
    display(['Testing task: ', int2str(I), '/', int2str(totalComb)]);
    p = cp_get_params_from_index(I, P);
    run_experiment(I, p, paths_to_project);
end

               
