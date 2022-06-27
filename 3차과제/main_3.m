clc, clear, close all

folder_name = 'C:\Users\Lab\Documents\MATLAB';
list = dir(folder_name);

img_name = [];

for i = 6:10 %파일 배열에 저장
    img_name = [img_name; list(i).name]; 
end



for j = 6:10
    disp(list(j).name)  %파일읽기

    img = imread(list(j).name);
    %imshow(img);
    subplot(2,1,1), subimage(img);
    pause(1);

    hsv_img = rgb2hsv(img);

    h = hsv_img(:,:,1);
    
    threshold = (0.300 < h) & (h < 0.36);
    subplot(2,1,2), subimage(threshold);
    %figure(2),imshow(threshold);
    
    bw =threshold;
    bw = bwareaopen(bw, 1000);
    bw2 = imfill(bw, 'holes');
    
    bw2 = bw2 - bw;
    
    bw2 = bwareaopen(bw2, 1500);
    
    canny_img= edge(bw2,'canny');
    %figure(3),imshow(canny_img);
    [w, h] = find(canny_img);
    w = unique(w);
    h = unique(h);
    
    size_w = size(w,1);
    size_h = size(h,1);
    
    mid1 = sum(w)/size_w;
    mid2 = sum(h)/size_h;
    
    ans = [mid1, mid2];
    disp(ans);
end