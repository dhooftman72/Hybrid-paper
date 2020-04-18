function bootstrap_runs_paralel_annoted
% Periodic matrices with inflow of crop.
% To be used iteratively since it can not be written as standard matrix
% Lambda and elastticities will be calculated based on iteration.
%
% Rotations used are the Niab 1 & 3 rotations from the BRIGHT report
%
% Rot 1: 3 year rotation (WOSR, winter cereal, winter cereal).
% Rot 2: 4 years rotation (WOSR, winter cereal, spring crop, winter cereal)
% Rot 3: OSR every year (hypothetic)
% Rot 4: extention of rot 1 for Fig. 3a
% Rot 5: extention of rot 2 for Fig. 3b

%% Loops and random numbers
change_factor = 1;
bootstrap_max = 100000;
total_years = 100;

size_hybrid_niab = 12;
size_rapa_niab = 48;
size_napus_niab = 48;

job = createJob('configuration', 'local_extended');

for t_max = xx:xx
    rotation_max = ceil(total_years/t_max);
    if t_max == 1
        hybrid_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_hybrid_niab); %#ok<*NASGU>
        rapa_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_rapa_niab);
        napus_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_napus_niab);
        t_file = ['random', '_','t_max', '_',int2str(t_max)];
        save(t_file,'hybrid_matrix_number_rdn','rapa_matrix_number_rdn', 'napus_matrix_number_rdn')
        clear hybrid_matrix_number_rdn
        clear  rapa_matrix_number_rdn
        clear napus_matrix_number_rdn
        rotation = 3;
        createTask(job, @bootstrap_runs_paralel, 1, {t_max,rotation,change_factor,outcross,bootstrap_max,rotation_max});
    elseif t_max == 3
        hybrid_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_hybrid_niab);
        rapa_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_rapa_niab);
        napus_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_napus_niab);
        t_file = ['random', '_','t_max', '_',int2str(t_max)];
        save(t_file,'hybrid_matrix_number_rdn','rapa_matrix_number_rdn', 'napus_matrix_number_rdn')
        clear hybrid_matrix_number_rdn
        clear  rapa_matrix_number_rdn
        clear napus_matrix_number_rdn
        for rotation = 1:4:5
            createTask(job, @bootstrap_runs_paralel, 1, {t_max,rotation,change_factor,outcross,bootstrap_max,rotation_max});
        end
    elseif t_max == 4
        hybrid_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_hybrid_niab);
        rapa_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_rapa_niab);
        napus_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_napus_niab);
        t_file = ['random', '_','t_max', '_',int2str(t_max)];
        save(t_file,'hybrid_matrix_number_rdn','rapa_matrix_number_rdn', 'napus_matrix_number_rdn')
        clear hybrid_matrix_number_rdn
        clear  rapa_matrix_number_rdn
        clear napus_matrix_number_rdn
        for rotation = 2:2:4
            createTask(job, @bootstrap_runs_paralel, 1, {t_max,rotation,change_factor,outcross,bootstrap_max,rotation_max});
        end
    else
        hybrid_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_hybrid_niab);
        rapa_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_rapa_niab);
        napus_matrix_number_rdn = ceil((rand((rotation_max*t_max)*bootstrap_max,1))*size_napus_niab);
        t_file = ['random', '_','t_max', '_',int2str(t_max)];
        save(t_file,'hybrid_matrix_number_rdn','rapa_matrix_number_rdn', 'napus_matrix_number_rdn')
        clear hybrid_matrix_number_rdn
        clear  rapa_matrix_number_rdn
        clear napus_matrix_number_rdn
        for rotation = 4:5
            rotation %#ok<NOPTS>
            createTask(job, @bootstrap_runs_paralel, 1, {t_max,rotation,change_factor,outcross,bootstrap_max,rotation_max});
        end
    end
end
submit(job);
waitForState(job, 'finished');
results = getAllOutputArguments(job);
save output.mat results
destroy(job)
end

function [output] = bootstrap_runs_paralel(t_max,rotation,change_factor,outcross,bootstrap_max,rotation_max)
% Main code
% PREPARATIONS
sensi_max = 34;
target_seedlings_crop = 60;
initial_pop_size = [0;0;target_seedlings_crop;0];
initial_pop_size_rapa = initial_pop_size.* 0.1;
initial_pop_size_napus = initial_pop_size.*1;
initial_pop_size_hybrid = initial_pop_size.*0;
sensitivity_value = 0.1;
outcross = 0.03; % Jorgensen et al. 2009, Fig 2. 1:1 mixture (since formula corrects), medium distance.
rapa_niab_summer_survival = 1;
hybrid_niab_summer_survival = 1;
napus_niab_summer_survival = 1;
plough_L1_L2 = 0.98; % following Cousens & Moss 1990 adapted to two layers
plough_L2_L1 = 0.29; % following Cousens & Moss 1990 adapted to two layers
harvest_loss_WOSR = 0.05; % general estimate
harvest_loss_no_WOSR = 0; %correction factor in harvest loss in other crops
soil_seed_bank_entry_early_plough = 0.085; %following Gruber et al 2005
soil_seed_bank_entry_late_plough = 0.02; %following Gruber et al 2005
WOSR_survival_WOSR = 1; % correction parameter
WOSR_survival_no_WOSR = 0; % correction parameter allowing no surving plants when no WOSR

% see function below
[hybrid_niab, hybrid_seed_survival,rapa_niab, rapa_seed_survival,...
    napus_niab, napus_seed_survival] = ReadData; % Not shown

%%
lambda_hybrid =zeros(bootstrap_max,1);
lambda_rapa =zeros(bootstrap_max,1);
lambda_napus =zeros(bootstrap_max,1);
if rotation == 1
    t_max = 3;
elseif rotation == 2
    t_max = 4;
elseif rotation == 3
    t_max = 1;
end


% predeffinations
t_file = ['random', '_','t_max', '_',int2str(t_max)];
load(t_file)
lambda_hybrid_avg = zeros(sensi_max,1);
percentile_hybrid_005 = zeros(sensi_max,1);
percentile_hybrid_095 = zeros(sensi_max,1);
lambda_rapa_avg = zeros(sensi_max,1);
percentile_rapa_005 = zeros(sensi_max,1);
percentile_rapa_095 = zeros(sensi_max,1);
lambda_napus_avg = zeros(sensi_max,1);
percentile_napus_005 = zeros(sensi_max,1);
percentile_napus_095 = zeros(sensi_max,1);
a_hybrid_avg = zeros(4,4);
b_hybrid_avg = zeros(4,4);
a_rapa_avg = zeros(4,4);
b_rapa_avg = zeros(4,4);
a_napus_avg = zeros(4,4);
b_napus_avg = zeros(4,4);
sensitivity_hybrid_a = zeros(4,4);
elasticity_hybrid_a = zeros(4,4);
sensitivity_hybrid_b = zeros(4,4);
elasticity_hybrid_b = zeros(4,4);
sensitivity_rapa_a = zeros(4,4);
elasticity_rapa_a = zeros(4,4);
sensitivity_rapa_b = zeros(4,4);
elasticity_rapa_b = zeros(4,4);
sensitivity_napus_a = zeros(4,4);
elasticity_napus_a = zeros(4,4);
sensitivity_napus_b = zeros(4,4);
elasticity_napus_b = zeros(4,4);

% different sensitivity loops
for sensi_loop = 1:1:sensi_max
    display(sensi_loop)
    if sensi_loop == 1 && rotation <= 2
        population_size_t_hybrid = zeros((rotation_max*t_max),bootstrap_max);
        population_size_t_rapa = zeros((rotation_max*t_max),bootstrap_max);
        population_size_t_napus = zeros((rotation_max*t_max),bootstrap_max);
    end
    lambda_hybrid = zeros(bootstrap_max,1);
    lambda_rapa = zeros(bootstrap_max,1);
    lambda_napus = zeros(bootstrap_max,1);
    count = 0;
    for x = 1:bootstrap_max
        rotations_done = 0;
        generations_done = 0;
        
        for rotation_loop = 1:rotation_max
            rotations_done = rotations_done + 1;
            if rotation_loop == 1
                population_size_rapa = initial_pop_size_rapa;
                population_size_napus = initial_pop_size_napus;
                population_size = initial_pop_size_hybrid;
                population_size_hybrid_seed = zeros(rotation_max,1);
                population_size_hybrid_adult = zeros(rotation_max,1);
                population_size_rapa_seed = zeros(rotation_max,1);
                population_size_rapa_adult = zeros(rotation_max,1);
                population_size_napus_seed =zeros(rotation_max,1);
                population_size_napus_adult = zeros(rotation_max,1);
            end
            
            for t = 1:t_max
                count = count + 1;
                % draw the matrices here per t from pre-defined array
                hybrid_matrix_number = hybrid_matrix_number_rdn(count);
                rapa_matrix_number = rapa_matrix_number_rdn(count);
                napus_matrix_number = napus_matrix_number_rdn(count);
                
                % make the individual matrix elements
                hybrid_pods = hybrid_niab(hybrid_matrix_number,1);
                hybrid_seeds_per_pod = hybrid_niab(hybrid_matrix_number,2);
                hybrid_viability = hybrid_niab(hybrid_matrix_number,3);
                hybrid_germination = hybrid_niab(hybrid_matrix_number,4);
                hybrid_L1 = hybrid_niab(hybrid_matrix_number,5);
                hybrid_L2 = hybrid_niab(hybrid_matrix_number,6);
                hybrid_L3 = hybrid_niab(hybrid_matrix_number,7);
                
                rapa_pods = rapa_niab(rapa_matrix_number,1);
                rapa_seeds_per_pod = rapa_niab(rapa_matrix_number,2);
                rapa_viability = rapa_niab(rapa_matrix_number,3);
                rapa_germination = rapa_niab(rapa_matrix_number,4);
                rapa_L1 = rapa_niab(rapa_matrix_number,5);
                rapa_L2 = rapa_niab(rapa_matrix_number,6);
                rapa_L3 = rapa_niab(rapa_matrix_number,7);
                
                napus_pods = napus_niab(napus_matrix_number,1);
                napus_seeds_per_pod = napus_niab(napus_matrix_number,2);
                napus_viability = napus_niab(napus_matrix_number,3);
                napus_germination = napus_niab(napus_matrix_number,4);
                napus_L1 = napus_niab(napus_matrix_number,5);
                napus_L2 = napus_niab(napus_matrix_number,6);
                napus_L3 = napus_niab(napus_matrix_number,7);
                
                
                rapa_niab_fecundity = (rapa_pods * rapa_seeds_per_pod * rapa_viability);
                hybrid_niab_fecundity = (hybrid_pods * hybrid_seeds_per_pod * hybrid_viability)*change_factor;
                napus_niab_fecundity = (napus_pods * napus_seeds_per_pod * napus_viability);
                
                rapa_niab_fecundity = rapa_niab_fecundity * harvest_loss_WOSR;
                hybrid_niab_fecundity = hybrid_niab_fecundity * harvest_loss_WOSR;
                napus_niab_fecundity = napus_niab_fecundity * harvest_loss_WOSR;
                
                % feed matrix elements into the periodic matrixes
                all_species_together_rapa;
                all_species_together_napus;
               all_species_together_hybrid;
                
                %%
                % add matrix element sensitivity here by changing matrix
                % elements one at the time
               sensitvity_outcross;
                
                % Change rotation lengths for Figure 3.
                if rotation <= 3 % i.e., standard calculations
                    t_int = t;
                elseif rotation == 4
                    if t == 1
                        t_int = t;
                    elseif t ~= 1
                        t_int = 2;
                    end
                elseif rotation == 5
                    if t == 1
                        t_int = t;
                    elseif t == 2 && t_max == 2
                        t_int = 3;
                    elseif t == 3 || t == 5 || t== 7
                        t_int = 3;
                    else
                        t_int = 2;
                    end
                end
                %%%%
                
                % The actual iterations
                if t_int == 1
                    generations_done = generations_done + 1;
                    % a-matrix
                    population_size_rapa = year_1_a_rapa * population_size_rapa;
                    population_size_napus = year_1_a_napus * population_size_napus;
                    population_size = year_1_a_hybrid * population_size;
                    
                    % making new hybrids from parent populations, see
                    % Hooftman et al. 2007/2008
                    sum_pop_reproductive = population_size_rapa(4)+ population_size_napus(4);
                    if sum_pop_reproductive > 0
                        new_hybrid_seeds_1 = (outcross * population_size_rapa(4) * (population_size_napus(4)/sum_pop_reproductive))*...
                            rapa_niab_fecundity;
                        new_hybrid_seeds_2 = (outcross * population_size_napus(4) * (population_size_rapa(4)/sum_pop_reproductive))*...
                            rapa_niab_fecundity;
                        new_hybrid_seeds = new_hybrid_seeds_1 + new_hybrid_seeds_2;
                        soil_seed_bank_hybrid = (year_1_b_hybrid(1,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                        emergence_hybrid = (year_1_b_hybrid(3,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                    else
                        soil_seed_bank_hybrid = 0;
                        emergence_hybrid = 0;
                    end
                    
                    %b matrix
                    population_size_rapa = year_1_b_rapa * population_size_rapa;
                    population_size_napus = year_1_b_napus * population_size_napus;
                    population_size = year_1_b_hybrid * population_size;
                    
                    % add newly formed seeds to population seed bank
                    population_size(1) = population_size(1) + soil_seed_bank_hybrid;
                    population_size(3) = population_size(3) + soil_seed_bank_hybrid;
                    
                    
                    
                    if sensi_loop == 1 % store pop-size per run, only in standard case
                        population_size_t_hybrid(generations_done,x) = sum(population_size);
                        population_size_t_rapa(generations_done,x) = sum(population_size_rapa);
                        population_size_t_napus(generations_done,x) = sum(population_size_napus);
                        
                        %store matrix elements to make averages later
                        a_hybrid_avg = a_hybrid_avg + year_1_a_hybrid;
                        b_hybrid_avg = b_hybrid_avg + year_1_b_hybrid;
                        a_rapa_avg = a_rapa_avg + year_1_a_rapa;
                        b_rapa_avg = b_rapa_avg + year_1_b_rapa;
                        a_napus_avg = a_napus_avg + year_1_a_napus;
                        b_napus_avg = b_napus_avg + year_1_b_napus;
                    end
                    
                    % see t_int = 1 for explenations
                elseif t_int == 2
                    generations_done = generations_done + 1;
                    population_size_rapa = year_2_a_rapa * population_size_rapa;
                    population_size_napus = year_2_a_napus * population_size_napus;
                    population_size = year_2_a_hybrid * population_size;
                    
                    if sum_pop_reproductive > 0
                        new_hybrid_seeds_1 = outcross * population_size_rapa(4) * (population_size_napus(4)/sum_pop_reproductive);
                        new_hybrid_seeds_2 = outcross * population_size_napus(4) * (population_size_rapa(4)/sum_pop_reproductive);
                        new_hybrid_seeds = new_hybrid_seeds_1 + new_hybrid_seeds_2;
                        soil_seed_bank_hybrid = (year_1_b_hybrid(1,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                        emergence_hybrid = (year_1_b_hybrid(3,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                    else
                        soil_seed_bank_hybrid = 0;
                        emergence_hybrid = 0;
                    end
                    
                    population_size_rapa = year_2_b_rapa * population_size_rapa;
                    population_size_napus = year_2_b_napus * population_size_napus;
                    population_size = year_2_b_hybrid * population_size;
                    
                    population_size(1) = population_size(1) + soil_seed_bank_hybrid;
                    population_size(3) = population_size(3) + soil_seed_bank_hybrid;
                    
                    if sensi_loop == 1
                        population_size_t_hybrid(generations_done,x) = sum(population_size);
                        population_size_t_rapa(generations_done,x) = sum(population_size_rapa);
                        population_size_t_napus(generations_done,x) = sum(population_size_napus);
                        a_hybrid_avg = a_hybrid_avg + year_2_a_hybrid;
                        b_hybrid_avg = b_hybrid_avg + year_2_b_hybrid;
                        a_rapa_avg = a_rapa_avg + year_2_a_rapa;
                        b_rapa_avg = b_rapa_avg + year_2_b_rapa;
                        a_napus_avg = a_napus_avg + year_2_a_napus;
                        b_napus_avg = b_napus_avg + year_2_b_napus;
                    end
                    
                    % see t_int = 1 for explenations
                elseif t_int == 3
                    generations_done = generations_done + 1;
                    population_size_rapa = year_3_a_rapa * population_size_rapa;
                    population_size_napus = year_3_a_napus * population_size_napus;
                    population_size = year_3_a_hybrid * population_size;
                    
                    if sum_pop_reproductive > 0
                        new_hybrid_seeds_1 = outcross * population_size_rapa(4) * (population_size_napus(4)/sum_pop_reproductive);
                        new_hybrid_seeds_2 = outcross * population_size_napus(4) * (population_size_rapa(4)/sum_pop_reproductive);
                        new_hybrid_seeds = new_hybrid_seeds_1 + new_hybrid_seeds_2;
                        soil_seed_bank_hybrid = (year_1_b_hybrid(1,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                        emergence_hybrid = (year_1_b_hybrid(3,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                    else
                        soil_seed_bank_hybrid = 0;
                        emergence_hybrid = 0;
                    end
                    
                    population_size_rapa = year_3_b_rapa * population_size_rapa;
                    population_size_napus = year_3_b_napus * population_size_napus;
                    population_size = year_3_b_hybrid * population_size;
                    
                    population_size(1) = population_size(1) + soil_seed_bank_hybrid;
                    population_size(3) = population_size(3) + soil_seed_bank_hybrid;
                    
                    if sensi_loop == 1
                        population_size_t_hybrid(generations_done,x) = sum(population_size);
                        population_size_t_rapa(generations_done,x) = sum(population_size_rapa);
                        population_size_t_napus(generations_done,x) = sum(population_size_napus);
                        a_hybrid_avg = a_hybrid_avg + year_3_a_hybrid;
                        b_hybrid_avg = b_hybrid_avg + year_3_b_hybrid;
                        a_rapa_avg = a_rapa_avg + year_3_a_rapa;
                        b_rapa_avg = b_rapa_avg + year_3_b_rapa;
                        a_napus_avg = a_napus_avg + year_3_a_napus;
                        b_napus_avg = b_napus_avg + year_3_b_napus;
                    end
                    
                    % see t_int = 1 for explenations
                elseif t_int == 4
                    generations_done = generations_done + 1;
                    population_size_rapa = year_4_a_rapa * population_size_rapa;
                    population_size_napus = year_4_a_napus * population_size_napus;
                    population_size = year_4_a_hybrid * population_size;
                    
                    if sum_pop_reproductive > 0
                        new_hybrid_seeds_1 = outcross * population_size_rapa(4) * (population_size_napus(4)/sum_pop_reproductive);
                        new_hybrid_seeds_2 = outcross * population_size_napus(4) * (population_size_rapa(4)/sum_pop_reproductive);
                        new_hybrid_seeds = new_hybrid_seeds_1 + new_hybrid_seeds_2;
                        soil_seed_bank_hybrid = (year_1_b_hybrid(1,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                        emergence_hybrid = (year_1_b_hybrid(3,4)/hybrid_niab_fecundity)*new_hybrid_seeds;
                    else
                        soil_seed_bank_hybrid = 0;
                        emergence_hybrid = 0;
                    end
                    
                    population_size_rapa = year_4_b_rapa * population_size_rapa;
                    population_size_napus = year_4_b_napus * population_size_napus;
                    population_size = year_4_b_hybrid * population_size;
                    
                    population_size(1) = population_size(1) + soil_seed_bank_hybrid;
                    population_size(3) = population_size(3) + soil_seed_bank_hybrid;
                    
                    if sensi_loop == 1
                        population_size_t_hybrid(generations_done,x) = sum(population_size);
                        population_size_t_rapa(generations_done,x) = sum(population_size_rapa);
                        population_size_t_napus(generations_done,x) = sum(population_size_napus);
                        a_hybrid_avg = a_hybrid_avg + year_4_a_hybrid;
                        b_hybrid_avg = b_hybrid_avg + year_4_b_hybrid;
                        a_rapa_avg = a_rapa_avg + year_4_a_rapa;
                        b_rapa_avg = b_rapa_avg + year_4_b_rapa;
                        a_napus_avg = a_napus_avg + year_4_a_napus;
                        b_napus_avg = b_napus_avg + year_4_b_napus;
                    end
                    
                end % if t= 1
            end% t_loop
            
            % add new OSR seeds for the start of every rotation
            population_size_napus(3,1) = population_size_napus(3,1) + target_seedlings_crop;
            
            % store population sizes per rotatin for lambda calculations
            population_size_hybrid_seed(rotations_done) = population_size(1) + ...
                population_size(2); %#ok<*SAGROW>
            population_size_hybrid_adult(rotations_done) = population_size(3) + ...
                population_size(4);
            population_size_rapa_seed(rotations_done) = population_size_rapa(1) + ...
                population_size_rapa(2);
            population_size_rapa_adult(rotations_done) = population_size_rapa(3) + ...
                population_size_rapa(4);
            population_size_napus_seed(rotations_done) = population_size_napus(1) + ...
                population_size_napus(2);
            population_size_napus_adult(rotations_done) = population_size_napus(3) + ...
                population_size_napus(4);
            
            % calculate lambda at the end of every run
            if rotation_loop == rotation_max
                lambda_hybrid(x) = ((population_size_hybrid_seed(rotation_max) +...
                    population_size_hybrid_adult(rotation_max))/...
                    (population_size_hybrid_seed(rotation_max-1) +...
                    population_size_hybrid_adult(rotation_max-1)))^(1/t_max);
                lambda_rapa(x) = ((population_size_rapa_seed(rotation_max) +...
                    population_size_rapa_adult(rotation_max))/...
                    (population_size_rapa_seed(rotation_max-1) +...
                    population_size_rapa_adult(rotation_max-1)))^(1/t_max);
                lambda_napus(x) = ((population_size_napus_seed(rotation_max) +...
                    population_size_napus_adult(rotation_max))/...
                    (population_size_napus_seed(rotation_max-1) +...
                    population_size_napus_adult(rotation_max-1)))^(1/t_max);
            end
            
        end  % rotation loop
    end % of the bootstrap loop
    
    % Data averaging and sensitivity calculations
    
    % hybrid
    lambda_hybrid_avg(sensi_loop) = median(lambda_hybrid);
    percentile_hybrid_005(sensi_loop) = prctile(lambda_hybrid,5);
    percentile_hybrid_095(sensi_loop) = prctile(lambda_hybrid,95);
    
    % rapa
    lambda_rapa_avg(sensi_loop) = median(lambda_rapa);
    percentile_rapa_005(sensi_loop) = prctile(lambda_rapa,5);
    percentile_rapa_095(sensi_loop) = prctile(lambda_rapa,95);
    
    % napus
    lambda_napus_avg(sensi_loop) = median(lambda_napus);
    percentile_napus_005(sensi_loop) = prctile(lambda_napus,5);
    percentile_napus_095(sensi_loop) = prctile(lambda_napus,95);
    
    
    % population size and ltre info only when in no sensitivity run
    if sensi_loop == 1
        avg_pop_size_t_hybrid = median(population_size_t_hybrid,2);
        for y = 1:1:length(avg_pop_size_t_hybrid);
            population_size_sorted = population_size_t_hybrid(y,:);
            percentile_pop_hybrid_005(y) = prctile(population_size_sorted,5);
            percentile_pop_hybrid_095(y) = prctile(population_size_sorted,95);
        end
        
        avg_pop_size_t_rapa = median(population_size_t_rapa,2);
        for y = 1:1:length(avg_pop_size_t_rapa)
            population_size_sorted = population_size_t_rapa(y,:);
            percentile_pop_rapa_005(y) = prctile(population_size_sorted,5);
            percentile_pop_rapa_095(y) = prctile(population_size_sorted,95);
        end
        
        avg_pop_size_t_napus = median(population_size_t_napus,2);
        for y = 1:1:length(avg_pop_size_t_napus)
            population_size_sorted = population_size_t_napus(y,:);
            percentile_pop_napus_005(y) = prctile(population_size_sorted,5);
            percentile_pop_napus_095(y) = prctile(population_size_sorted,95);
        end
        
        a_hybrid_avg = a_hybrid_avg./ (bootstrap_max * rotation_max * t_max);
        b_hybrid_avg = b_hybrid_avg./ (bootstrap_max * rotation_max * t_max);
        a_rapa_avg = a_rapa_avg./ (bootstrap_max * rotation_max * t_max);
        b_rapa_avg = b_rapa_avg./ (bootstrap_max * rotation_max * t_max);
        a_napus_avg = a_napus_avg./ (bootstrap_max * rotation_max * t_max);
        b_napus_avg = b_napus_avg ./ (bootstrap_max * rotation_max * t_max);
        
    else % calculate trhe sensitivities
        lambda_change_hybrid = lambda_hybrid_avg(sensi_loop)/lambda_hybrid_avg(1);
        lambda_change_rapa = lambda_rapa_avg(sensi_loop)/lambda_rapa_avg(1);
        lambda_change_napus = lambda_napus_avg(sensi_loop)/lambda_napus_avg(1);
        
        if sensi_loop <= 12
            sensitivity_hybrid_a(row_a, column_a) = (abs(lambda_change_hybrid - 1))/change_a;
            elasticity_hybrid_a(row_a, column_a) = (a_hybrid_avg(row_a, column_a)/lambda_hybrid_avg(1)) * (sensitivity_hybrid_a(row_a, column_a));
            sensitivity_hybrid_b(row_b, column_b) = (abs(lambda_change_hybrid - 1))/change_b;
            elasticity_hybrid_b(row_b, column_b) = (b_hybrid_avg(row_b, column_b)/lambda_hybrid_avg(1)) * (sensitivity_hybrid_b(row_b, column_b));
            if sensi_loop == 12
                sensitivity_both_hybrid = ((sensitivity_hybrid_a +  sensitivity_hybrid_b)./2);
                elasticity_both_hybrid_uncorrected = (((a_hybrid_avg + b_hybrid_avg))./(lambda_hybrid_avg(1)*2)).* sensitivity_both_hybrid;
                elasticity_both_hybrid =  elasticity_both_hybrid_uncorrected./ (sum(sum(elasticity_both_hybrid_uncorrected)));
                sensitivity_seed_bank_hybrid = sensitivity_both_hybrid(1,1) + sensitivity_both_hybrid(2,1) + sensitivity_both_hybrid(1,2) + sensitivity_both_hybrid(2,2);
                elasticity_seed_bank_hybrid = elasticity_both_hybrid(1,1) + elasticity_both_hybrid(2,1) + elasticity_both_hybrid(1,2) + elasticity_both_hybrid(2,2);
            end
            
        elseif sensi_loop <= 23
            sensitivity_rapa_a(row_a, column_a) = (abs(lambda_change_rapa - 1))/change_a;
            elasticity_rapa_a(row_a, column_a) = (a_rapa_avg(row_a, column_a)/lambda_rapa_avg(1)) * (sensitivity_rapa_a(row_a, column_a));
            sensitivity_rapa_b(row_b, column_b) = (abs(lambda_change_rapa - 1))/change_b;
            elasticity_rapa_b(row_b, column_b) = (b_rapa_avg(row_b, column_b)/lambda_rapa_avg(1)) * (sensitivity_rapa_b(row_b, column_b));
            
            hy_sensitivity_rapa_a(row_a, column_a) = (abs(lambda_change_hybrid - 1))/change_a;
            hy_elasticity_rapa_a(row_a, column_a) = (a_hybrid_avg(row_a, column_a)/lambda_hybrid_avg(1)) * (hy_sensitivity_rapa_a(row_a, column_a));
            hy_sensitivity_rapa_b(row_b, column_b) = (abs(lambda_change_hybrid - 1))/change_b;
            hy_elasticity_rapa_b(row_b, column_b) = (b_hybrid_avg(row_b, column_b)/lambda_hybrid_avg(1)) * (hy_sensitivity_rapa_b(row_b, column_b));
            
            
            if sensi_loop == 23
                sensitivity_both_rapa = ((sensitivity_rapa_a +  sensitivity_rapa_b)./2);
                elasticity_both_rapa = (((a_rapa_avg + b_rapa_avg))./(lambda_rapa_avg(1)*2)).* sensitivity_both_rapa;
                elasticity_both_rapa =  elasticity_both_rapa./ (sum(sum(elasticity_both_rapa)));
                sensitivity_seed_bank_rapa = sensitivity_both_rapa(1,1) + sensitivity_both_rapa(2,1) + sensitivity_both_rapa(1,2) + sensitivity_both_rapa(2,2);
                elasticity_seed_bank_rapa = elasticity_both_rapa(1,1) + elasticity_both_rapa(2,1) + elasticity_both_rapa(1,2) + elasticity_both_rapa(2,2);
                
                hy_sensitivity_both_rapa = ((hy_sensitivity_rapa_a +  hy_sensitivity_rapa_b)./2);
                hy_elasticity_both_rapa_uncorrected = (((a_hybrid_avg + b_hybrid_avg))./(lambda_hybrid_avg(1)*2)).* hy_sensitivity_both_rapa;
                hy_elasticity_both_rapa =  hy_elasticity_both_rapa_uncorrected./ (sum(sum(hy_elasticity_both_rapa_uncorrected)));
                hy_sensitivity_seed_bank_rapa = hy_sensitivity_both_rapa(1,1) + hy_sensitivity_both_rapa(2,1) + hy_sensitivity_both_rapa(1,2) + hy_sensitivity_both_rapa(2,2);
                hy_elasticity_seed_bank_rapa = hy_elasticity_both_rapa(1,1) + hy_elasticity_both_rapa(2,1) + hy_elasticity_both_rapa(1,2) + hy_elasticity_both_rapa(2,2);
                
            end
        elseif sensi_loop <=34
            sensitivity_napus_a(row_a, column_a) = (abs(lambda_change_napus - 1))/change_a;
            elasticity_napus_a(row_a, column_a) = (a_napus_avg(row_a, column_a)/lambda_napus_avg(1)) * (sensitivity_napus_a(row_a, column_a));
            sensitivity_napus_b(row_b, column_b) = (abs(lambda_change_napus - 1))/change_b;
            elasticity_napus_b(row_b, column_b) = (b_napus_avg(row_b, column_b)/lambda_napus_avg(1)) * (sensitivity_napus_b(row_b, column_b));
            
            hy_sensitivity_napus_a(row_a, column_a) = (abs(lambda_change_hybrid - 1))/change_a; %#ok<*AGROW>
            hy_elasticity_napus_a(row_a, column_a) = (a_hybrid_avg(row_a, column_a)/lambda_hybrid_avg(1)) * (hy_sensitivity_napus_a(row_a, column_a));
            hy_sensitivity_napus_b(row_b, column_b) = (abs(lambda_change_hybrid - 1))/change_b;
            hy_elasticity_napus_b(row_b, column_b) = (b_hybrid_avg(row_b, column_b)/lambda_hybrid_avg(1)) * (hy_sensitivity_napus_b(row_b, column_b));
            
            
            if sensi_loop == 34
                sensitivity_both_napus = ((sensitivity_napus_a +  sensitivity_napus_b)./2);
                elasticity_both_napus = (((a_napus_avg + b_napus_avg))./(lambda_napus_avg(1)*2)).* sensitivity_both_napus;
                elasticity_both_napus =  elasticity_both_napus./ (sum(sum(elasticity_both_napus)));
                sensitivity_seed_bank_napus = sensitivity_both_napus(1,1) + sensitivity_both_napus(2,1) + sensitivity_both_napus(1,2) + sensitivity_both_napus(2,2);
                elasticity_seed_bank_napus = elasticity_both_napus(1,1) + elasticity_both_napus(2,1) + elasticity_both_napus(1,2) + elasticity_both_napus(2,2);
                
                hy_sensitivity_both_napus = ((hy_sensitivity_napus_a +  hy_sensitivity_napus_b)./2);
                hy_elasticity_both_napus_uncorrected = (((a_hybrid_avg + b_hybrid_avg))./(lambda_hybrid_avg(1)*2)).* hy_sensitivity_both_napus;
                hy_elasticity_both_napus =  hy_elasticity_both_napus_uncorrected./ (sum(sum(hy_elasticity_both_napus_uncorrected)));
                hy_sensitivity_seed_bank_napus = hy_sensitivity_both_napus(1,1) + hy_sensitivity_both_napus(2,1) + hy_sensitivity_both_napus(1,2) + hy_sensitivity_both_napus(2,2);
                hy_elasticity_seed_bank_napus = hy_elasticity_both_napus(1,1) + hy_elasticity_both_napus(2,1) + hy_elasticity_both_napus(1,2) + hy_elasticity_both_napus(2,2);
            end
        end
    end
    %     if sensi_loop ~= 1
    %     clear population_size_t_hybrid
    %     clear population_size_t_rapa
    %     clear population_size_t_napus
    %     end
end % of the sensi loop
clear hybrid_matrix_number_rdn
clear rapa_matrix_number_rdn
clear napus_matrix_number_rdn
text_file = ['rot', '_',int2str(rotation), '_','t_max', '_',int2str(t_max)];
save(text_file)
% delete(bar)
toc
output = 1;
end
