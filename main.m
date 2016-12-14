files_Brodatz = dir('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\Brodatz\Training\*.jpg');

for i = 1 : length(files_Brodatz)
    filename_Brodatz = strcat('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\Brodatz\Training\', files_Brodatz(i).name);
    
    training_Brodatz = imread(filename_Brodatz);
    
    input_ImgGray_Brodatz = rgb2gray(training_Brodatz);
    
    glcms_Brodatz_d1 = graycomatrix(input_ImgGray_Brodatz,'Offset',[0 1; -1 1;-1 0;-1 -1]);
    
    glcms_Brodatz_d2 = graycomatrix(input_ImgGray_Brodatz,'Offset',[0 2; -2 2;-2 0;-2 -2]);
    
    fitur_glcms_Brodatz_d1 = GLCM(glcms_Brodatz_d1,0);
    
    fitur_glcms_Brodatz_d2 = GLCM(glcms_Brodatz_d2,0);
end

files_VisTex = dir('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\VisTex\Training\*.ppm');

for j = 1 : length(files_VisTex)
    filename_VisTex = strcat('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\VisTex\Training\', files_VisTex(i).name);
    
    training_VisTex = imread(filename_VisTex);
    
    input_ImgGray_VisTex = rgb2gray(training_VisTex);
    
    glcms_VisTex_d1 = graycomatrix(input_ImgGray_VisTex,'Offset',[0 1; -1 1;-1 0;-1 -1]);
    
    glcms_VisTex_d2 = graycomatrix(input_ImgGray_VisTex,'Offset',[0 2; -2 2;-2 0;-2 -2]);
    
    fitur_glcms_VisTex_d1 = GLCM(glcms_VisTex_d1,0);
    
    fitur_glcms_VisTex_d2 = GLCM(glcms_VisTex_d2,0);
end