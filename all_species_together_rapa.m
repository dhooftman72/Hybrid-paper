    %%%%%%% Year 1A %%%%%%% WOSR: 
    year_1_a_rapa = zeros(4,4);
    year_1_a_rapa(1,1) = (1-plough_L1_L2) * rapa_seed_survival * (1-rapa_germination);
    year_1_a_rapa(1,2) =    plough_L2_L1 *  rapa_seed_survival * (1-rapa_germination);
    year_1_a_rapa(2,1) =    plough_L1_L2 *  rapa_seed_survival;
    year_1_a_rapa(2,2) = (1-plough_L2_L1) * rapa_seed_survival;
    year_1_a_rapa(4,1) =  rapa_germination *...
            (rapa_L2 * rapa_L3) * WOSR_survival_WOSR ;
    year_1_a_rapa(4,3) =  rapa_L1 *...
        (rapa_L2 * rapa_L3) * WOSR_survival_WOSR ;
       
    %%%%%%% Year 1B %%%%%%% WOSR: 
    year_1_b_rapa = zeros(4,4);
    year_1_b_rapa(1,1) = rapa_niab_summer_survival * (1-rapa_germination); 
    year_1_b_rapa(2,2) = rapa_niab_summer_survival;
    if rotation ==5 && t_max == 2
        year_1_b_rapa(1,4) = rapa_niab_fecundity * soil_seed_bank_entry_late_plough;
    else
        year_1_b_rapa(1,4) = rapa_niab_fecundity * soil_seed_bank_entry_early_plough;
     end
    year_1_b_rapa(3,1) = rapa_germination; 
    if rotation ==5 && t_max == 2
         year_1_b_rapa(3,4) = rapa_niab_fecundity * rapa_germination * soil_seed_bank_entry_late_plough; 
    else
    year_1_b_rapa(3,4) = rapa_niab_fecundity * rapa_germination * soil_seed_bank_entry_early_plough; 
    end
    
    %%%%%%% Year 2A %%%%%%% Winter Cereal: 
    year_2_a_rapa = zeros(4,4);
    year_2_a_rapa(1,1) = (1-plough_L1_L2) * rapa_seed_survival * (1-rapa_germination);
    year_2_a_rapa(1,2) =    plough_L2_L1 *  rapa_seed_survival * (1-rapa_germination);
    year_2_a_rapa(2,1) =    plough_L1_L2 *  rapa_seed_survival;
    year_2_a_rapa(2,2) = (1-plough_L2_L1) * rapa_seed_survival;
    year_2_a_rapa(4,1) =  rapa_germination *...
        (rapa_L2 * rapa_L3) * WOSR_survival_no_WOSR;
    year_2_a_rapa(4,3) =  rapa_L1  *...
        (rapa_L2 * rapa_L3) * WOSR_survival_no_WOSR;
    
    %%%%%%% Year 2B %%%%%%% 
    year_2_b_rapa = zeros(4,4);
    year_2_b_rapa(1,1) = rapa_niab_summer_survival * (1-rapa_germination); 
    year_2_b_rapa(2,2) =rapa_niab_summer_survival;
    if rotation ==5 || rotation == 2 %Winter cereal preparing for broad leave crop:
    year_2_b_rapa(1,4) = rapa_niab_fecundity * soil_seed_bank_entry_late_plough * harvest_loss_no_WOSR; 
    else
    year_2_b_rapa(1,4) = rapa_niab_fecundity * soil_seed_bank_entry_early_plough * harvest_loss_no_WOSR; 
    end
    year_2_b_rapa(3,1) = rapa_germination;
    if rotation ==5 || rotation == 2 %Winter cereal preparing for broad leave crop:
        year_2_b_rapa(3,4) = rapa_niab_fecundity  * rapa_germination * harvest_loss_no_WOSR  * soil_seed_bank_entry_late_plough;
    else % Winter cereal preparing for cereal
        year_2_b_rapa(3,4) = rapa_niab_fecundity * rapa_germination * soil_seed_bank_entry_early_plough * harvest_loss_no_WOSR;
    end

      %%%%%%% Year 3A %%%%%%% Winter cereal/broad -leave crop: 
    year_3_a_rapa = zeros(4,4);
    year_3_a_rapa(1,1) = (1-plough_L1_L2) * rapa_seed_survival * (1-rapa_germination);
    year_3_a_rapa(1,2) =  plough_L2_L1 * rapa_seed_survival * (1-rapa_germination);
    year_3_a_rapa(2,1) =  plough_L1_L2 * rapa_seed_survival;
    year_3_a_rapa(2,2) =  (1-plough_L2_L1) * rapa_seed_survival;
    year_3_a_rapa(4,1) =  rapa_germination *...
        (rapa_L2 * rapa_L3) * WOSR_survival_no_WOSR;
    year_3_a_rapa(4,3) = rapa_L1 * ... 
        (rapa_L2 * rapa_L3)* WOSR_survival_no_WOSR;
    
    %%%%%%% Year 3B %%%%%%%  Winter cereal/broad -leave crop:  
    year_3_b_rapa = zeros(4,4);
    year_3_b_rapa(1,1) = rapa_niab_summer_survival * (1-rapa_germination); 
    year_3_b_rapa(2,2) = rapa_niab_summer_survival;
    year_3_b_rapa(1,4) = rapa_niab_fecundity* soil_seed_bank_entry_early_plough * harvest_loss_no_WOSR; 
    year_3_b_rapa(3,1) = rapa_germination; 
    year_3_b_rapa(3,4) = rapa_niab_fecundity *...
        rapa_germination* harvest_loss_no_WOSR * soil_seed_bank_entry_early_plough; 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%% Year 4A %%%%%%% cereal
    year_4_a_rapa = zeros(4,4);
    year_4_a_rapa(1,1) = (1-plough_L1_L2) * rapa_seed_survival * (1-rapa_germination);
    year_4_a_rapa(1,2) =  plough_L2_L1 * rapa_seed_survival * (1-rapa_germination);
    year_4_a_rapa(2,1) =   plough_L1_L2 * rapa_seed_survival;
    year_4_a_rapa(2,2) =  (1-plough_L2_L1) * rapa_seed_survival;
    year_4_a_rapa(4,1) =  rapa_germination *...
        (rapa_L2 * rapa_L3) * WOSR_survival_no_WOSR ;
    year_4_a_rapa(4,3) = rapa_L1 *...
        (rapa_L2 * rapa_L3)* WOSR_survival_no_WOSR ;
    
    %%%%%%% Year 4B %%%%%%% cereal prepare for OSR
    year_4_b_rapa = zeros(4,4);
    year_4_b_rapa(1,1) = rapa_niab_summer_survival * (1-rapa_germination);
    year_4_b_rapa(2,2) = rapa_niab_summer_survival;
    year_4_b_rapa(1,4) = rapa_niab_fecundity * harvest_loss_no_WOSR * soil_seed_bank_entry_early_plough; 
    year_4_b_rapa(3,1) = rapa_germination; 
    year_4_b_rapa(3,4) = rapa_niab_fecundity * harvest_loss_no_WOSR * rapa_germination * soil_seed_bank_entry_early_plough; %

