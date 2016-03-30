function [ ] = run_experiment( id, params, path_to_project )

    load([path_to_project, '/data/data.mat']);
    
    p = cp_prepare_exp_params(params);
    
    gpr = fitrgp(X',Y',...
                     'KernelFunction', p.covFcn,...
                     'KernelParameters', p.hyp.cov,...
                     'Sigma', p.hyp.lik,...
                     'Holdout', 0.25);
                 
    mse = kfoldLoss(gpr);
                 
    save([path_to_project, '/results/', int2str(id), '.mat']);
    cp_save(struct('params', params, 'mse', mse));
    
end

