% stochastic matrices for semi-natural evironment with no interactions
% between different species. B. napus had no fecundity, hence lambda is 0. 

% subFunction_semi_nat_data, see below

% Bootstrap runs
bootstrap_max = 100000;
%% for hybrids, idential for rapa. 
for x = 1:1:bootstrap_max
% select vital rate sets    
matrix_number = ceil(rand*size(hybrid_niab,1));
germination = matrices_hybrid(matrix_number,1);
l1 = matrices_hybrid(matrix_number,2);
l2 = matrices_hybrid(matrix_number,3);
l3 = matrices_hybrid(matrix_number,4);
fecundity = matrices_hybrid(matrix_number,5);
WS_survival = matrices_hybrid(matrix_number,6);        
         
SN(1,1) =  WS_survival;
SN(2,1) =  germination * l1 * l2 *l3;
SN(1,2) =  WS_survival * fecundity;
SN(2,2) =  germination * l1 * l2 * l3 * fecundity;
    
% lambda per run
lambdas = eig(SN);
lambda_series_hybrid(x) = max(lambdas);
end

% mean matrix to be exported to Poptools for sensitivity analyses
germination_avg = mean(germination);
l1_avg = mean(l1);
l2_avg = mean(l2);
l3_avg = mean(l3);
fecundity_avg = mean(F);
WS_survival_avg = mean(WS);
SN_hybrid(1,1) =  WS_survival_avg;
SN_hybrid(2,1) =  germination_avg * l1_avg * l2_avg *l3_avg;
SN_hybrid(1,2) =  WS_survival_avg * fecundity_avg;
SN_hybrid(2,2) =  germination_avg * l1_avg * l2_avg * l3_avg *  fecundity_avg  ;
 
% calculate mean lambda and percentiles
lambdas = eig(SN_hybrid);
lambda_avg_hybrid = max(lambdas);
percen_hybrid = prctile(lambda_series_hybrid,[5 95]);

%% Sub Function data:
% DATA, viral rate sets per plot
% Germination, L1, L2, L3, Fecundity, winter survival seed bank
matrices_hybrid = [...
0.339,	0.680,	1.000,	0.000,	0.000,	0.623;...
0.347,	0.765,	0.698,	0.168,	5.232,	0.623;...
0.224,	0.595,	0.613,	0.000,	0.000,	0.623;...
0.298,	0.852,	0.642,	0.000,	0.000,	0.623;...
0.253,	0.854,	0.593,	0.000,	0.000,	0.623;...
0.413,	0.649,	0.536,	0.000,	0.000,	0.623;...
0.201,	0.736,	0.662,	0.000,	0.000,	0.623;...
0.156,	0.754,	0.448,	0.000,	0.000,	0.623;...
0.450,	0.907,	0.878,	0.000,	0.000,	0.623;...
0.090,	0.778,	0.797,	0.390,	5.232,	0.623;...
0.339,	1.000,	0.494,	0.000,	0.000,	0.623;...
0.347,	0.779,	0.000,	0.168,	5.232,	0.623;...
0.224,	0.904,	1.000,	0.000,	0.000,	0.623;...
0.298,	0.516,	0.532,	0.000,	0.000,	0.623;...
0.253,	1.000,	0.000,	0.000,	0.000,	0.623;...
0.413,	0.884,	0.176,	0.000,	0.000,	0.623;...
0.201,	0.913,	0.000,	0.000,	0.000,	0.623;...
0.156,	1.000,	0.000,	0.000,	0.000,	0.623;...
0.450,	0.693,	0.574,	0.000,	0.000,	0.623;...
0.090,	0.542,	0.730,	0.390,	5.232,	0.623];

matrices_rapa = [...
0.057,	0.680,	1.000,	1.000,	58.240,	0.623;...
0.039,	0.765,	0.698,	0.837,	11.600,	0.623;...
0.043,	0.595,	0.613,	1.000,	0.000,	0.623;...
0.101,	0.852,	0.642,	0.462,	41.350,	0.623;...
0.070,	0.854,	0.593,	0.735,	188.20,	0.623;...
0.065,	0.649,	0.536,	0.354,	19.550,	0.623;...
0.100,	0.736,	0.662,	0.463,	14.250,	0.623;...
0.033,	0.754,	0.448,	1.000,	63.700,	0.623;...
0.051,	0.907,	0.878,	0.531,	131.47,	0.623;...
0.062,	0.778,	0.797,	0.406,	8.010,	0.623;...
0.057,	1.000,	0.494,	1.000,	58.240,	0.623;...
0.039,	0.779,	0.000,	0.837,	11.600,	0.623;...
0.043,	0.904,	1.000,	1.000,	0.000,	0.623;...
0.101,	0.516,	0.532,	0.462,	41.350,	0.623;...
0.070,	1.000,	0.000,	0.735,	188.20,	0.623;...
0.065,	0.884,	0.176,	0.354,	19.550,	0.623;...
0.100,	0.913,	0.000,	0.463,	14.250,	0.623;...
0.033,	1.000,	0.000,	1.000,	63.700,	0.623;...
0.051,	0.693,	0.574,	0.531,	131.47,	0.623;...
0.062,	0.542,	0.730,	0.406,	8.010,	0.623];






%% for rapa 
for x = 1:1:bootstrap_max
   if x/1000 == floor(x/1000)
clc
    fprintf('bootstraps: %i out of %i \n', x, bootstrap_max)
end
rapa_matrix_number = ceil(rand*size(rapa_niab,1));     
    
germination(i) = matrices_rapa(rapa_matrix_number,1);
    l1(i) = matrices_rapa(rapa_matrix_number,2);
    l2(i) = matrices_rapa(rapa_matrix_number,3);
    l3(i) = matrices_rapa(rapa_matrix_number,4);
    fecundity(i) = matrices_rapa(rapa_matrix_number,5);
    WS_survival(i) = matrices_rapa(rapa_matrix_number,6);        
    
    
    
    % make matrix
    SN(1,1) =  WS_survival(i);
    SN(2,1) =  germination(i) * l1(i) * l2(i) *l3(i);
    SN(1,2) =  WS_survival(i) * fecundity(i);
    SN(2,2) =  germination(i) * l1(i) * l2(i) * l3(i) *  fecundity(i)  ;
    
    lambdas = eig(SN);
    lambda_series_rapa(x) = max(lambdas);
    
end

% mean matrix
    germination_avg = mean(germination_);
    l1_avg = mean(l1);
    l2_avg = mean(l2);
    l3_avg = mean(l3);
    fecundity_avg = mean(F);
    WS_survival_avg = mean(WS);

    
    SN_rapa(1,1) =  WS_survival_avg;
    SN_rapa(2,1) =  germination_avg * l1_avg * l2_avg *l3_avg;
    SN_rapa(1,2) =  WS_survival_avg * fecundity_avg;
    SN_rapa(2,2) =  germination_avg * l1_avg * l2_avg * l3_avg *  fecundity_avg  ;
    
    lambdas = eig(SN_rapa);
    lambda_avg_rapa = max(lambdas)
    percen_rapa = prctile(lambda_series_rapa,[5 95])
