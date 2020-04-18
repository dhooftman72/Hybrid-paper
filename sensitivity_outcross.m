if sensi_loop == 1
    original_plough_L1_L2 = plough_L1_L2;
    original_plough_L2_L1 = plough_L2_L1;
    original_harvest_loss_WOSR= harvest_loss_WOSR;
    original_harvest_loss_no_WOSR= harvest_loss_no_WOSR ;
    original_soil_seed_bank_entry_early_plough= soil_seed_bank_entry_early_plough;
    original_soil_seed_bank_entry_late_plough = soil_seed_bank_entry_late_plough;
    original_WOSR_survival_WOSR= WOSR_survival_WOSR;
    original_WOSR_survival_no_WOSR= WOSR_survival_no_WOSR;
    original_outcross = outcross;
    original_target_seedlings_crop =   target_seedlings_crop;
end

plough_L1_L2 = original_plough_L1_L2;
plough_L2_L1 = original_plough_L2_L1;
harvest_loss_WOSR = original_harvest_loss_WOSR;
harvest_loss_no_WOSR = original_harvest_loss_no_WOSR;
soil_seed_bank_entry_early_plough = original_soil_seed_bank_entry_early_plough;
soil_seed_bank_entry_late_plough = original_soil_seed_bank_entry_late_plough;
WOSR_survival_WOSR = original_WOSR_survival_WOSR;
WOSR_survival_no_WOSR = original_WOSR_survival_no_WOSR;
outcross = original_outcross;
target_seedlings_crop =   original_target_seedlings_crop;


if sensi_loop == 1
    parameter_name = 'full matrix';
elseif sensi_loop == 2
    row_a = 1;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_1_a_hybrid(row_a,column_a));
    year_2_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_2_a_hybrid(row_a,column_a));
    year_3_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_3_a_hybrid(row_a,column_a));
    year_4_a_hybrid(row_a,column_a)  =  (1 + change_a)* (year_4_a_hybrid(row_a,column_a));
elseif sensi_loop == 3
    row_a = 1;
    column_a = 2;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_1_a_hybrid(row_a,column_a));
    year_2_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_2_a_hybrid(row_a,column_a));
    year_3_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_3_a_hybrid(row_a,column_a));
    year_4_a_hybrid(row_a,column_a)  =  (1 + change_a)* (year_4_a_hybrid(row_a,column_a));
    
elseif sensi_loop == 4
    row_a = 2;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_1_a_hybrid(row_a,column_a));
    year_2_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_2_a_hybrid(row_a,column_a));
    year_3_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_3_a_hybrid(row_a,column_a));
    year_4_a_hybrid(row_a,column_a)  =  (1 + change_a)* (year_4_a_hybrid(row_a,column_a));
elseif sensi_loop == 5
    row_a = 2;
    column_a = 2;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_1_a_hybrid(row_a,column_a));
    year_2_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_2_a_hybrid(row_a,column_a));
    year_3_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_3_a_hybrid(row_a,column_a));
    year_4_a_hybrid(row_a,column_a)  =  (1 + change_a)* (year_4_a_hybrid(row_a,column_a));
elseif sensi_loop == 6
    row_a = 4;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_1_a_hybrid(row_a,column_a));
    year_2_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_2_a_hybrid(row_a,column_a));
    year_3_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_3_a_hybrid(row_a,column_a));
    year_4_a_hybrid(row_a,column_a)  =  (1 + change_a)* (year_4_a_hybrid(row_a,column_a));
elseif sensi_loop == 7
    row_a = 4;
    column_a = 3;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_1_a_hybrid(row_a,column_a));
    year_2_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_2_a_hybrid(row_a,column_a));
    year_3_a_hybrid(row_a,column_a)  =  (1 + change_a) * (year_3_a_hybrid(row_a,column_a));
    year_4_a_hybrid(row_a,column_a)  =  (1 + change_a)* (year_4_a_hybrid(row_a,column_a));
    
    % end of a matrix
elseif sensi_loop == 8
    row_b = 1;
    column_b = 1;
    row_a = 4;
    column_a = 4;
    change_a = 1;
    change_b = 0.1;
    year_1_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_1_b_hybrid(row_b,column_b));
    year_2_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_2_b_hybrid(row_b,column_b));
    year_3_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_3_b_hybrid(row_b,column_b));
    year_4_b_hybrid(row_b,column_b)  =  (1 + change_b)* (year_4_b_hybrid(row_b,column_b));
    
elseif sensi_loop == 9
    row_b = 2;
    column_b = 2;
       row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_1_b_hybrid(row_b,column_b));
    year_2_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_2_b_hybrid(row_b,column_b));
    year_3_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_3_b_hybrid(row_b,column_b));
    year_4_b_hybrid(row_b,column_b)  =  (1 + change_b)* (year_4_b_hybrid(row_b,column_b));
    
elseif sensi_loop == 10
    row_b = 1;
    column_b = 4;
       row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_1_b_hybrid(row_b,column_b));
    year_2_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_2_b_hybrid(row_b,column_b));
    year_3_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_3_b_hybrid(row_b,column_b));
    year_4_b_hybrid(row_b,column_b)  =  (1 + change_b)* (year_4_b_hybrid(row_b,column_b));
elseif sensi_loop == 11
    row_b = 3;
    column_b = 1;
       row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_1_b_hybrid(row_b,column_b));
    year_2_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_2_b_hybrid(row_b,column_b));
    year_3_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_3_b_hybrid(row_b,column_b));
    year_4_b_hybrid(row_b,column_b)  =  (1 + change_b)* (year_4_b_hybrid(row_b,column_b));
elseif sensi_loop == 12
    row_b = 3;
    column_b = 4;
       row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_1_b_hybrid(row_b,column_b));
    year_2_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_2_b_hybrid(row_b,column_b));
    year_3_b_hybrid(row_b,column_b)  =  (1 + change_b) * (year_3_b_hybrid(row_b,column_b));
    year_4_b_hybrid(row_b,column_b)  =  (1 + change_b)* (year_4_b_hybrid(row_b,column_b));
    
    % end of b matrix
elseif sensi_loop == 13
    row_a = 1;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_1_a_rapa(row_a,column_a));
    year_2_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_2_a_rapa(row_a,column_a));
    year_3_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_3_a_rapa(row_a,column_a));
    year_4_a_rapa(row_a,column_a)  =  (1 + change_a)* (year_4_a_rapa(row_a,column_a));
elseif sensi_loop == 14
    row_a = 1;
    column_a = 2;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_1_a_rapa(row_a,column_a));
    year_2_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_2_a_rapa(row_a,column_a));
    year_3_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_3_a_rapa(row_a,column_a));
    year_4_a_rapa(row_a,column_a)  =  (1 + change_a)* (year_4_a_rapa(row_a,column_a));
    
elseif sensi_loop == 15
    row_a = 2;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_1_a_rapa(row_a,column_a));
    year_2_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_2_a_rapa(row_a,column_a));
    year_3_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_3_a_rapa(row_a,column_a));
    year_4_a_rapa(row_a,column_a)  =  (1 + change_a)* (year_4_a_rapa(row_a,column_a));
elseif sensi_loop == 16
    row_a = 2;
    column_a = 2;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_1_a_rapa(row_a,column_a));
    year_2_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_2_a_rapa(row_a,column_a));
    year_3_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_3_a_rapa(row_a,column_a));
    year_4_a_rapa(row_a,column_a)  =  (1 + change_a)* (year_4_a_rapa(row_a,column_a));
elseif sensi_loop == 17
    row_a = 4;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_1_a_rapa(row_a,column_a));
    year_2_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_2_a_rapa(row_a,column_a));
    year_3_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_3_a_rapa(row_a,column_a));
    year_4_a_rapa(row_a,column_a)  =  (1 + change_a)* (year_4_a_rapa(row_a,column_a));
elseif sensi_loop == 18
    row_a = 4;
    column_a = 3;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_1_a_rapa(row_a,column_a));
    year_2_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_2_a_rapa(row_a,column_a));
    year_3_a_rapa(row_a,column_a)  =  (1 + change_a) * (year_3_a_rapa(row_a,column_a));
    year_4_a_rapa(row_a,column_a)  =  (1 + change_a)* (year_4_a_rapa(row_a,column_a));
    
    % end of a matrix
elseif sensi_loop == 19
    row_b = 1;
    column_b = 1;
        row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_1_b_rapa(row_b,column_b));
    year_2_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_2_b_rapa(row_b,column_b));
    year_3_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_3_b_rapa(row_b,column_b));
    year_4_b_rapa(row_b,column_b)  =  (1 + change_b)* (year_4_b_rapa(row_b,column_b));
    
elseif sensi_loop == 20
    row_b = 2;
    column_b = 2;
      row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_1_b_rapa(row_b,column_b));
    year_2_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_2_b_rapa(row_b,column_b));
    year_3_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_3_b_rapa(row_b,column_b));
    year_4_b_rapa(row_b,column_b)  =  (1 + change_b)* (year_4_b_rapa(row_b,column_b));
    
elseif sensi_loop == 21
    row_b = 1;
    column_b = 4;
        row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_1_b_rapa(row_b,column_b));
    year_2_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_2_b_rapa(row_b,column_b));
    year_3_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_3_b_rapa(row_b,column_b));
    year_4_b_rapa(row_b,column_b)  =  (1 + change_b)* (year_4_b_rapa(row_b,column_b));
elseif sensi_loop == 22
    row_b = 3;
    column_b = 1;
       row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_1_b_rapa(row_b,column_b));
    year_2_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_2_b_rapa(row_b,column_b));
    year_3_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_3_b_rapa(row_b,column_b));
    year_4_b_rapa(row_b,column_b)  =  (1 + change_b)* (year_4_b_rapa(row_b,column_b));
elseif sensi_loop == 23
    row_b = 3;
    column_b = 4;
       row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_1_b_rapa(row_b,column_b));
    year_2_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_2_b_rapa(row_b,column_b));
    year_3_b_rapa(row_b,column_b)  =  (1 + change_b) * (year_3_b_rapa(row_b,column_b));
    year_4_b_rapa(row_b,column_b)  =  (1 + change_b)* (year_4_b_rapa(row_b,column_b));
    
elseif sensi_loop == 24
    row_a = 1;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_napus(row_a,column_a)  =  (1 + change_a) * (year_1_a_napus(row_a,column_a));
    year_2_a_napus(row_a,column_a)  =  (1 + change_a) * (year_2_a_napus(row_a,column_a));
    year_3_a_napus(row_a,column_a)  =  (1 + change_a) * (year_3_a_napus(row_a,column_a));
    year_4_a_napus(row_a,column_a)  =  (1 + change_a)* (year_4_a_napus(row_a,column_a));
elseif sensi_loop == 25
    row_a = 1;
    column_a = 2;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_napus(row_a,column_a)  =  (1 + change_a) * (year_1_a_napus(row_a,column_a));
    year_2_a_napus(row_a,column_a)  =  (1 + change_a) * (year_2_a_napus(row_a,column_a));
    year_3_a_napus(row_a,column_a)  =  (1 + change_a) * (year_3_a_napus(row_a,column_a));
    year_4_a_napus(row_a,column_a)  =  (1 + change_a)* (year_4_a_napus(row_a,column_a));
    
elseif sensi_loop == 26
    row_a = 2;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_napus(row_a,column_a)  =  (1 + change_a) * (year_1_a_napus(row_a,column_a));
    year_2_a_napus(row_a,column_a)  =  (1 + change_a) * (year_2_a_napus(row_a,column_a));
    year_3_a_napus(row_a,column_a)  =  (1 + change_a) * (year_3_a_napus(row_a,column_a));
    year_4_a_napus(row_a,column_a)  =  (1 + change_a)* (year_4_a_napus(row_a,column_a));
elseif sensi_loop == 27
    row_a = 2;
    column_a = 2;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_napus(row_a,column_a)  =  (1 + change_a) * (year_1_a_napus(row_a,column_a));
    year_2_a_napus(row_a,column_a)  =  (1 + change_a) * (year_2_a_napus(row_a,column_a));
    year_3_a_napus(row_a,column_a)  =  (1 + change_a) * (year_3_a_napus(row_a,column_a));
    year_4_a_napus(row_a,column_a)  =  (1 + change_a)* (year_4_a_napus(row_a,column_a));
elseif sensi_loop == 28
    row_a = 4;
    column_a = 1;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_napus(row_a,column_a)  =  (1 + change_a) * (year_1_a_napus(row_a,column_a));
    year_2_a_napus(row_a,column_a)  =  (1 + change_a) * (year_2_a_napus(row_a,column_a));
    year_3_a_napus(row_a,column_a)  =  (1 + change_a) * (year_3_a_napus(row_a,column_a));
    year_4_a_napus(row_a,column_a)  =  (1 + change_a)* (year_4_a_napus(row_a,column_a));
elseif sensi_loop == 29
    row_a = 4;
    column_a = 3;
    row_b = 4;
    column_b = 4;
    change_a = 0.1;
    change_b = 1;
    year_1_a_napus(row_a,column_a)  =  (1 + change_a) * (year_1_a_napus(row_a,column_a));
    year_2_a_napus(row_a,column_a)  =  (1 + change_a) * (year_2_a_napus(row_a,column_a));
    year_3_a_napus(row_a,column_a)  =  (1 + change_a) * (year_3_a_napus(row_a,column_a));
    year_4_a_napus(row_a,column_a)  =  (1 + change_a)* (year_4_a_napus(row_a,column_a));
    
    % end of a matrix
elseif sensi_loop == 30
    row_b = 1;
    column_b = 1;
        row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_napus(row_b,column_b)  =  (1 + change_b) * (year_1_b_napus(row_b,column_b));
    year_2_b_napus(row_b,column_b)  =  (1 + change_b) * (year_2_b_napus(row_b,column_b));
    year_3_b_napus(row_b,column_b)  =  (1 + change_b) * (year_3_b_napus(row_b,column_b));
    year_4_b_napus(row_b,column_b)  =  (1 + change_b)* (year_4_b_napus(row_b,column_b));
    
elseif sensi_loop == 31
    row_b = 2;
    column_b = 2;
        row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_napus(row_b,column_b)  =  (1 + change_b) * (year_1_b_napus(row_b,column_b));
    year_2_b_napus(row_b,column_b)  =  (1 + change_b) * (year_2_b_napus(row_b,column_b));
    year_3_b_napus(row_b,column_b)  =  (1 + change_b) * (year_3_b_napus(row_b,column_b));
    year_4_b_napus(row_b,column_b)  =  (1 + change_b)* (year_4_b_napus(row_b,column_b));
    
elseif sensi_loop == 32
    row_b = 1;
    column_b = 4;  
        row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_napus(row_b,column_b)  =  (1 + change_b) * (year_1_b_napus(row_b,column_b));
    year_2_b_napus(row_b,column_b)  =  (1 + change_b) * (year_2_b_napus(row_b,column_b));
    year_3_b_napus(row_b,column_b)  =  (1 + change_b) * (year_3_b_napus(row_b,column_b));
    year_4_b_napus(row_b,column_b)  =  (1 + change_b)* (year_4_b_napus(row_b,column_b));
elseif sensi_loop == 33
    row_b = 3;
    column_b = 1;
        row_a = 4;
    column_a = 4;
    
    change_a = 1;
    change_b = 0.1;
    year_1_b_napus(row_b,column_b)  =  (1 + change_b) * (year_1_b_napus(row_b,column_b));
    year_2_b_napus(row_b,column_b)  =  (1 + change_b) * (year_2_b_napus(row_b,column_b));
    year_3_b_napus(row_b,column_b)  =  (1 + change_b) * (year_3_b_napus(row_b,column_b));
    year_4_b_napus(row_b,column_b)  =  (1 + change_b)* (year_4_b_napus(row_b,column_b));
elseif sensi_loop == 34
    row_b = 3;
    column_b = 4;
    row_a = 4;
    column_a = 4;
    change_a = 1;
    change_b = 0.1;
    year_1_b_napus(row_b,column_b)  =  (1 + change_b) * (year_1_b_napus(row_b,column_b));
    year_2_b_napus(row_b,column_b)  =  (1 + change_b) * (year_2_b_napus(row_b,column_b));
    year_3_b_napus(row_b,column_b)  =  (1 + change_b) * (year_3_b_napus(row_b,column_b));
    year_4_b_napus(row_b,column_b)  =  (1 + change_b)* (year_4_b_napus(row_b,column_b));
end
