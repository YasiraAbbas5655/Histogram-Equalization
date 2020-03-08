%P2.1
clc; 
MyBadHist = imread('image-of-size-3840x2160-grayscale-5.jpg');
MyBadHist=rgb2gray(MyBadHist);
figure , imagesc(MyBadHist);title('Original Image');colormap gray;
figure , hist(MyBadHist(:),0:255);
title ('Orignal Image Histogram')  


%P2.3,2.4
[MyBadHist_x , MyBadHist_y] = size(MyBadHist);
MyBadHist_freq = zeros(1, 256);
probs = zeros(256,1);   
cum_x = zeros(256,1);
y1 = size(MyBadHist,1);
y2 = size(MyBadHist,2);
val = y1*y2;     

for i = 1:MyBadHist_x
    for j = 1:MyBadHist_y
       val1=MyBadHist(i , j);
       MyBadHist_freq(val1+1) =  MyBadHist_freq(val1+1)+1; 
    end
end


sum = 0;
final_arr = zeros(1,256);
prob  = zeros(1,256);

for m = 1:256
    sum=sum+MyBadHist_freq(m);
    cum_x(m)=sum;
    prob(m)=cum_x(m)/val;
    final_arr(m) = round(prob(m) * 255);
end

for r_x = 1:y1
    for c_x = 1:y2
        inter_cal = MyBadHist(r_x,c_x)+1;
        MyBadHist(r_x, c_x )= final_arr(inter_cal);
    end
end

figure , imagesc(MyBadHist);
title('Final Image');
colormap gray;
figure , hist(MyBadHist(:),0:255);
title ('Final Image Histogram');
