function trainResult = trainSVM(uni, con, ent, inv, label)
fitur=zeros(4, size(label));
for i=0:size(label)
    fitur(0,i) = uni(i);
    fitur(1,i) = con(i);
    fitur(2,i) = ent(i);
    fitur(3,i) = inv(i);
end
fitur = transpose(fitur);

trainResult=svmtrain(fitur,label);
end