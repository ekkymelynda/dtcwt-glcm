files_Brodatz = dir('Brodatz\Training\dtcwt\*.png');

fitur_training_Brodatz = [];

for i = 1 : length(files_Brodatz)
    filename_Brodatz = strcat('Brodatz\Training\dtcwt\', files_Brodatz(i).name);
    
    training_Brodatz = imread(filename_Brodatz);
    
    %input_ImgGray_Brodatz = rgb2gray(training_Brodatz);
     
    glcms_Brodatz_d1 = graycomatrix(training_Brodatz,'Offset',[0 1; -1 1;-1 0;-1 -1]);
    
    glcms_Brodatz_d2 = graycomatrix(training_Brodatz,'Offset',[0 2; -2 2;-2 0;-2 -2]);
    
    fitur_glcms_Brodatz_d1 = GLCM(glcms_Brodatz_d1,0);
    Brodatz_d1_entro = fitur_glcms_Brodatz_d1.entro;
    Brodatz_d1_energ = fitur_glcms_Brodatz_d1.energ;
    Brodatz_d1_homom = fitur_glcms_Brodatz_d1.homom;
    Brodatz_d1_contr = fitur_glcms_Brodatz_d1.contr;
    
    fitur_glcms_Brodatz_d2 = GLCM(glcms_Brodatz_d2,0);
    Brodatz_d2_entro = fitur_glcms_Brodatz_d2.entro;
    Brodatz_d2_energ = fitur_glcms_Brodatz_d2.energ;
    Brodatz_d2_homom = fitur_glcms_Brodatz_d2.homom;
    Brodatz_d2_contr = fitur_glcms_Brodatz_d2.contr;
    
    kelas_Brodatz = strsplit(files_Brodatz(i).name, '_');
    kelas_Brodatz = strsplit(char(kelas_Brodatz(1)), 'D');
    
    fitur_Brodatz = [str2num(char(kelas_Brodatz(2))), Brodatz_d1_entro, Brodatz_d1_energ, Brodatz_d1_homom, Brodatz_d1_contr, Brodatz_d2_entro, Brodatz_d2_energ, Brodatz_d2_homom, Brodatz_d2_contr];
    
    fitur_training_Brodatz = [fitur_training_Brodatz; fitur_Brodatz];
    
end

files_VisTex = dir('VisTex\Training\dtcwt\*.png');

fitur_training_VisTex = [];

for i = 1 : length(files_VisTex)
    filename_VisTex = strcat('VisTex\Training\dtcwt\', files_VisTex(i).name);
    
    training_VisTex = imread(filename_VisTex);
    %disp(filename_VisTex);
    %input_ImgGray_VisTex = rgb2gray(training_VisTex);
    
    glcms_VisTex_d1 = graycomatrix(training_VisTex,'Offset',[0 1; -1 1;-1 0;-1 -1]);
    
    glcms_VisTex_d2 = graycomatrix(training_VisTex,'Offset',[0 2; -2 2;-2 0;-2 -2]);
    
    fitur_glcms_VisTex_d1 = GLCM(glcms_VisTex_d1,0);
    VisTex_d1_entro = fitur_glcms_VisTex_d1.entro;
    VisTex_d1_energ = fitur_glcms_VisTex_d1.energ;
    VisTex_d1_homom = fitur_glcms_VisTex_d1.homom;
    VisTex_d1_contr = fitur_glcms_VisTex_d1.contr;
    
    fitur_glcms_VisTex_d2 = GLCM(glcms_VisTex_d2,0);
    VisTex_d2_entro = fitur_glcms_VisTex_d2.entro;
    VisTex_d2_energ = fitur_glcms_VisTex_d2.energ;
    VisTex_d2_homom = fitur_glcms_VisTex_d2.homom;
    VisTex_d2_contr = fitur_glcms_VisTex_d2.contr;
    
    kelas_VisTex = strsplit(files_VisTex(i).name, '.');
    
    fitur_VisTex = [kelas_VisTex(1), num2cell(VisTex_d1_entro), num2cell(VisTex_d1_energ), num2cell(VisTex_d1_homom), num2cell(VisTex_d1_contr), num2cell(VisTex_d2_entro), num2cell(VisTex_d2_energ), num2cell(VisTex_d2_homom), num2cell(VisTex_d2_contr)];
    %fitur_VisTex = [VisTex_d1_entro, VisTex_d1_energ];
    
    fitur_training_VisTex = [fitur_training_VisTex; fitur_VisTex];
end

save ('fitur_glcm.mat', 'fitur_training_Brodatz', 'fitur_training_VisTex');