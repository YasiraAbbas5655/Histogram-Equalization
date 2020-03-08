clc; 
img = imread('BadHist.jpg');
figure , imagesc(img);title('Original Image');colormap gray;
figure , hist(img(:),0:255);
title ('Orignal Image Histogram')  

[img_x , img_y] = size(img);
img_freq = zeros(1, 256);
probs = zeros(256,1);   
cum_x = zeros(256,1);
y1 = size(img,1);
y2 = size(img,2);
val = y1*y2;     

for i = 1:img_x
    for j = 1:img_y
       val1=img(i , j);
       img_freq(val1+1) =  img_freq(val1+1)+1; 
    end
end


sum = 0;
final_arr = zeros(1,256);
prob  = zeros(1,256);

for m = 1:256
    sum=sum+img_freq(m);
    cum_x(m)=sum;
    prob(m)=cum_x(m)/val;
    final_arr(m) = round(prob(m) * 255);
end

for r_x = 1:y1
    for c_x = 1:y2
        inter_cal = img(r_x,c_x)+1;
        img(r_x, c_x )= final_arr(inter_cal);
    end
end

figure , imagesc(img);
title('Final Image');
colormap gray;
figure , hist(img(:),0:255);
title ('Final Image Histogram');
