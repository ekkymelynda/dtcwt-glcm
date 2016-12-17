function Result = svmClassify(trainData, data)
[baris, kolom] = size(data);
fitur = zeros(kolom, baris);
label = zeros(1, baris);
for i=1:baris
    for j=2:kolom
       fitur(i,j) = data(i,j);
    end
end

for i=1:baris
    label(i)=data(i);
end
Result=classifyMultiSVM(trainData, fitur);
end