dirc ='Brodatz/Testing/scaled/';
imagefiles=dir(strcat(dirc,'*.jpg'));      
nfiles = length(imagefiles);

for idx=1:nfiles
    name = strcat(dirc,imagefiles(idx).name);
    curr = imread(name);
    %inpgray = double(rgb2gray(curr));
    inpgray = double(curr);
    %imagesc(inpgray);
    
    wt = dddtree2('cplxdt',inpgray,1,'FSfarras','qshift10');
    wav = wt.cfs{1};
    for i=1:6
        x = i;
        y=1;
        if i > 3
            x = x-3;
            y=2;
        end
       
        A = wav(:,:,x,y,1);
        imwrite(A,strcat(dirc,'dtcwt/',imagefiles(idx).name,'_',num2str(y),'_',num2str(x),'.png'));
    end
    
end
    