function trainResult = svm(dataTraining, dataTest)
[baris, kolom] = size(dataTraining);
fiturTraining = zeros(baris, kolom);
label = zeros(1, baris);
disp(size(dataTraining));
for i=1:baris
    for j=2:kolom
       fiturTraining(i,j) = dataTraining(i,j);
    end
end
for i=1:baris
    label(i)=dataTraining(i);
end
disp(size(fiturTraining));
[baris2, kolom2] = size(dataTest);
disp(size(dataTest));
fiturTest = zeros(baris2, kolom2);
for i=1:baris2
    for j=2:kolom2
        fiturTest(i,j) = dataTest(i,j);
    end
end
disp(size(fiturTest));
trainResult=multisvm(normc(fiturTraining),label,normc(fiturTest));
end