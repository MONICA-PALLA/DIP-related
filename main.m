clc;
clear all;
image=imread('C:\Users\hp pc\Pictures\6.jpe');
image1=rgb2gray(image);
image2=zeros(size(image1));
r=size(image1,1);
c=size(image1,2);

ah=uint8(zeros(r,c));
n=r*c;
f=zeros(256,1);
pdf=zeros(256,1);
q=0;

for i=1:r
    for j=1:c
        value=image1(i,j);
        f(value+1)=f(value+1)+1;
        pdf(value+1)=f(value+1)/n;
    end
end
k=1;
for i=1:256
    if pdf(i)>0.0000
        s{k}=int2str((i-1));
        p(k)=pdf(i);
        k=k+1;
    end
end 

alphabet=s;
prob=p;
[tree, table] = hufftree(alphabet,prob);

for i=1:r
    for j=1:c
        input{i,j}=int2str(image1(i,j));
    end
end

encode = huffencode(input, table);
decode = huffdecode(encode, tree);

k=0;
for i=1:r
    for j=1:c
        if input{i,j} == decode{i,j}
            image2(i,j)=str2double(input{i,j});
        end
    end
end
for i=1:r
    for j=1:c
        if image1(i,j) == image2(i,j)
          image3(i,j)=image2(i,j);
        end
    end
end
imshow(uint8(image3));



        

