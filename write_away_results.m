output_text_explantion = {'Sensitivity for parameter:'; 'Lambda population';
    'Original value parameter';'% actual change in parameter';'sensitivity ind. parameter';...
    'Rotation transition seeds to seeds'; 'Rotation transition seeds to adults';'Rotation transition adults to seeds';...
    'Rotation transition adults to adults'; 'Initial population sizes'};
output_array_text = {parameter_name};
output_array_values = [lambda;original_parameter;parameter_change;sensitivity;lambda_seeds_seeds;...
    lambda_seeds_adults; lambda_adults_seeds;lambda_adults_adults];
xlswrite('periodic.xls', output_text_explantion,output_sheet,'A1')
if sensi_loop == 1
    xlswrite('periodic.xls', output_array_text,output_sheet,'B1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'B2')
    xlswrite('periodic.xls', initial_population,output_sheet,'B11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'B13')
elseif sensi_loop == 2
    xlswrite('periodic.xls', output_array_text,output_sheet,'C1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'C2')
    xlswrite('periodic.xls', initial_population,output_sheet,'C11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'C13')
elseif sensi_loop == 3
    xlswrite('periodic.xls', output_array_text,output_sheet,'D1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'D2')
    xlswrite('periodic.xls', initial_population,output_sheet,'D11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'D13')
elseif sensi_loop == 4
    xlswrite('periodic.xls', output_array_text,output_sheet,'E1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'E2')
    xlswrite('periodic.xls', initial_population,output_sheet,'E11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'E13')
elseif sensi_loop == 5
    xlswrite('periodic.xls', output_array_text,output_sheet,'F1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'F2')
    xlswrite('periodic.xls', initial_population,output_sheet,'F11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'F13')
elseif sensi_loop == 6
    xlswrite('periodic.xls', output_array_text,output_sheet,'G1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'G2')
    xlswrite('periodic.xls', initial_population,output_sheet,'G11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'G13')
elseif sensi_loop == 7
    xlswrite('periodic.xls', output_array_text,output_sheet,'H1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'H2')
    xlswrite('periodic.xls', initial_population,output_sheet,'H11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'H13')
elseif sensi_loop == 8
    xlswrite('periodic.xls', output_array_text,output_sheet,'I1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'I2')
    xlswrite('periodic.xls', initial_population,output_sheet,'I11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'I13')
elseif sensi_loop == 9
    xlswrite('periodic.xls', output_array_text,output_sheet,'J1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'J2')
    xlswrite('periodic.xls', initial_population,output_sheet,'J11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'J13')
elseif sensi_loop == 10
    xlswrite('periodic.xls', output_array_text,output_sheet,'K1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'K2')
    xlswrite('periodic.xls', initial_population,output_sheet,'K11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'K13')
elseif sensi_loop == 11
    xlswrite('periodic.xls', output_array_text,output_sheet,'L1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'L2')
    xlswrite('periodic.xls', initial_population,output_sheet,'L11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'L13')
elseif sensi_loop == 12
    xlswrite('periodic.xls', output_array_text,output_sheet,'M1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'M2')
    xlswrite('periodic.xls', initial_population,output_sheet,'M11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'M13')
elseif sensi_loop == 13
    xlswrite('periodic.xls', output_array_text,output_sheet,'N1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'N2')
    xlswrite('periodic.xls', initial_population,output_sheet,'N11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'N13')
elseif sensi_loop == 14
    xlswrite('periodic.xls', output_array_text,output_sheet,'O1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'O2')
    xlswrite('periodic.xls', initial_population,output_sheet,'O11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'O13')
elseif sensi_loop == 15
    xlswrite('periodic.xls', output_array_text,output_sheet,'P1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'P2')
    xlswrite('periodic.xls', initial_population,output_sheet,'P11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'P13')
elseif sensi_loop == 16
    xlswrite('periodic.xls', output_array_text,output_sheet,'Q1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'Q2')
    xlswrite('periodic.xls', initial_population,output_sheet,'Q11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'Q13')
elseif sensi_loop == 17
    xlswrite('periodic.xls', output_array_text,output_sheet,'R1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'R2')
    xlswrite('periodic.xls', initial_population,output_sheet,'R11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'R13')
elseif sensi_loop == 18
    xlswrite('periodic.xls', output_array_text,output_sheet,'S1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'S2')
    xlswrite('periodic.xls', initial_population,output_sheet,'S11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'S13')
elseif sensi_loop == 19
    xlswrite('periodic.xls', output_array_text,output_sheet,'t1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'T2')
    xlswrite('periodic.xls', initial_population,output_sheet,'T11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'T13')
elseif sensi_loop == 20
    xlswrite('periodic.xls', output_array_text,output_sheet,'U1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'U2')
    xlswrite('periodic.xls', initial_population,output_sheet,'U11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'U13')
elseif sensi_loop == 21
    xlswrite('periodic.xls', output_array_text,output_sheet,'V1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'V2')
    xlswrite('periodic.xls', initial_population,output_sheet,'V11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'V13')
elseif sensi_loop == 22
    xlswrite('periodic.xls', output_array_text,output_sheet,'W1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'W2')
    xlswrite('periodic.xls', initial_population,output_sheet,'W11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'W13')
elseif sensi_loop == 23
    xlswrite('periodic.xls', output_array_text,output_sheet,'X1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'X2')
    xlswrite('periodic.xls', initial_population,output_sheet,'X11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'X13')
elseif sensi_loop == 24
    xlswrite('periodic.xls', output_array_text,output_sheet,'Y1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'Y2')
    xlswrite('periodic.xls', initial_population,output_sheet,'Y11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'Y13')
elseif sensi_loop == 25
    xlswrite('periodic.xls', output_array_text,output_sheet,'Z1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'Z2')
    xlswrite('periodic.xls', initial_population,output_sheet,'Z11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'Z13')
elseif sensi_loop == 26
    xlswrite('periodic.xls', output_array_text,output_sheet,'AA1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AA2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AA11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AA13')
elseif sensi_loop == 27
    xlswrite('periodic.xls', output_array_text,output_sheet,'AB1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AB2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AB11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AB13')
elseif sensi_loop == 28
    xlswrite('periodic.xls', output_array_text,output_sheet,'AC1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AC2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AC11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AC13')
elseif sensi_loop == 29
    xlswrite('periodic.xls', output_array_text,output_sheet,'AD1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AD2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AD11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AD13')
elseif sensi_loop == 30
    xlswrite('periodic.xls', output_array_text,output_sheet,'AE1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AE2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AE11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AE13')
elseif sensi_loop == 31
    xlswrite('periodic.xls', output_array_text,output_sheet,'AF1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AF2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AF11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AF13')
elseif sensi_loop == 32
    xlswrite('periodic.xls', output_array_text,output_sheet,'AG1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AG2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AG11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AG13')
elseif sensi_loop == 33
    xlswrite('periodic.xls', output_array_text,output_sheet,'AH1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AH2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AH11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AH13')
elseif sensi_loop == 34
    xlswrite('periodic.xls', output_array_text,output_sheet,'AI1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AI2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AI11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AI13')
elseif sensi_loop == 35
    xlswrite('periodic.xls', output_array_text,output_sheet,'AJ1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AJ2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AJ11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AJ13')
elseif sensi_loop == 36
    xlswrite('periodic.xls', output_array_text,output_sheet,'AK1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AK2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AK11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AK13')
elseif sensi_loop == 37
    xlswrite('periodic.xls', output_array_text,output_sheet,'AL1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AL2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AL11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AL13')
elseif sensi_loop == 38
    xlswrite('periodic.xls', output_array_text,output_sheet,'AM1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AM2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AM11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AM13')
elseif sensi_loop == 39
    xlswrite('periodic.xls', output_array_text,output_sheet,'AN1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AN2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AN11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AN13')
elseif sensi_loop == 40
    xlswrite('periodic.xls', output_array_text,output_sheet,'AO1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AO2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AO11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AO13')
elseif sensi_loop == 41
    xlswrite('periodic.xls', output_array_text,output_sheet,'AP1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AP2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AP11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AP13')
elseif sensi_loop == 42
    xlswrite('periodic.xls', output_array_text,output_sheet,'AQ1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AQ2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AQ11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AQ13')
elseif sensi_loop == 43
    xlswrite('periodic.xls', output_array_text,output_sheet,'AR1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AR2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AR11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AR13')
elseif sensi_loop == 44
    xlswrite('periodic.xls', output_array_text,output_sheet,'AS1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AS2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AS11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AS13')
elseif sensi_loop == 45
    xlswrite('periodic.xls', output_array_text,output_sheet,'AT1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AT2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AT11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AT13')
elseif sensi_loop == 46
    xlswrite('periodic.xls', output_array_text,output_sheet,'AU1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AU2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AU11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AU13')
elseif sensi_loop == 47
    xlswrite('periodic.xls', output_array_text,output_sheet,'AV1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AV2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AV11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AV13')
elseif sensi_loop == 48
    xlswrite('periodic.xls', output_array_text,output_sheet,'AW1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AW2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AW11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AW13')
elseif sensi_loop == 49
    xlswrite('periodic.xls', output_array_text,output_sheet,'AX1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AX2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AX11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AX13')
elseif sensi_loop == 50
    xlswrite('periodic.xls', output_array_text,output_sheet,'AY1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AY2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AY11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AY13')
elseif sensi_loop == 51
    xlswrite('periodic.xls', output_array_text,output_sheet,'AZ1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'AZ2')
    xlswrite('periodic.xls', initial_population,output_sheet,'AZ11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'AZ13')
elseif sensi_loop == 52
    xlswrite('periodic.xls', output_array_text,output_sheet,'BA1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BA2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BA11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BA13')
elseif sensi_loop == 53
    xlswrite('periodic.xls', output_array_text,output_sheet,'BB1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BB2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BB11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BB13')
elseif sensi_loop == 54
    xlswrite('periodic.xls', output_array_text,output_sheet,'BC1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BC2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BC11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BC13')
elseif sensi_loop == 55
    xlswrite('periodic.xls', output_array_text,output_sheet,'BD1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BD2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BD11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BD13')
elseif sensi_loop == 56
    xlswrite('periodic.xls', output_array_text,output_sheet,'BE1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BE2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BE11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BE13')
elseif sensi_loop == 57
    xlswrite('periodic.xls', output_array_text,output_sheet,'BF1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BF2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BF11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BF13')
elseif sensi_loop == 58
    xlswrite('periodic.xls', output_array_text,output_sheet,'BG1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BG2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BG11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BG13')
elseif sensi_loop == 59
    xlswrite('periodic.xls', output_array_text,output_sheet,'BH1')
    xlswrite('periodic.xls', output_array_values,output_sheet,'BH2')
    xlswrite('periodic.xls', initial_population,output_sheet,'BH11')
    xlswrite('periodic.xls', population_size_t',output_sheet,'BH13')
else
    break
end % writing output