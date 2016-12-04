filesBrodatz = dir('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\Brodatz\Training\*.jpg');

for i = 1 : length(filesBrodatz)
    filenameBrodatz = strcat('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\Brodatz\Training\', filesBrodatz(i).name);
    
    trainingBrodatz = imread(filenameBrodatz);
    
    inputImgGrayBrodatz = rgb2gray(trainingBrodatz);
    
    glcmsBrodatz = graycomatrix(inputImgGrayBrodatz,'Offset',[0 1; -1 1;-1 0;-1 -1]);
    
    GLCM(glcmsBrodatz,0);
end

filesVisTex = dir('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\VisTex\Training\*.ppm');

for j = 1 : length(filesVisTex)
    filenameVisTex = strcat('D:\Kuliah\Semester 7\4. Visi Komputer\Tugas\FP\VisTex\Training\', filesVisTex(i).name);
    
    trainingVisTex = imread(filenameVisTex);
    
    inputImgGrayVisTex = rgb2gray(trainingVisTex);
    
    glcmsVisTex = graycomatrix(inputImgGrayVisTex,'Offset',[0 1; -1 1;-1 0;-1 -1]);
    
    GLCM(glcmsVisTex,0);
end