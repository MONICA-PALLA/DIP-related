img=imread('2.jpg');
a = zeros(size(img,1),size(img,2));
%input = cat(3,red,a,a);
figure,imshow(img);
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
%input=rgb2gray(input);
RC = cat(3,red,a,a);
GC = cat(3,a,green,a);
BC = cat(3,a,blue,a);
r=size(img,1);
c=size(img,2);
LR=zeros(size(img));
LB=zeros(size(img));
LG=zeros(size(img));
F1=[0 1 0;1 -4 1; 0 1 0]; %4 neighbours
F2=[1 1 1;1 -8 1; 1 1 1]; %8 neighbours
img=double(img);
for i=1:r-2
    for j=1:c-2
        LR(i,j)=sum(sum(F2.*RC(i:i+2,j:j+2)));
    end
end   
LR=uint8(LR);
figure,imshow(LR);
for i=1:r-2
    for j=1:c-2
        LG(i,j)=sum(sum(F2.*GC(i:i+2,j:j+2)));
    end
end
LG=uint8(LG);
figure,imshow(LG);
for i=1:r-2
    for j=1:c-2
        LB(i,j)=sum(sum(F2.*BC(i:i+2,j:j+2)));
    end
end
LB=uint8(LB);
figure,imshow(LB);