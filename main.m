droneObj = ryze();
cameraObj = camera(droneObj);

takeoff(droneObj);
moveup(droneObj, 'Distance', 0.4);

%원 찾기
while true
    frame = snapshot(cameraObj);
    hsv_img = rgb2hsv(frame);
    subplot(2,2,1), subimage(frame);

    h = hsv_img(:,:,1);
    s = hsv_img(:,:,2);
    v = hsv_img(:,:,3);
    threshold = (0.55 < h) & (h < 0.75);
    threshold_s = (0.43 < s) & (s < 1);
    %threshold_v = (0.25 < v) & (v < 1);
    %ring_ = threshold & threshold_s & threshold_v;
    ring_ = threshold & threshold_s;
    subplot(2,2,2), subimage(ring_);
    bw =ring_;
    bw = bwareaopen(bw, 5000);
    bw2 = imfill(bw, 'holes');
    
    %bw2 = bw2 - bw;
    bw2 = ~bw2;

    bw2 = bwareaopen(bw2, 1500);
    subplot(2,2,3), subimage(bw2);

    canny_img= edge(bw2,'canny');
    %figure(3),imshow(canny_img);
    subplot(2,2,4), subimage(canny_img);
    hold on
    [w, h] = find(canny_img);
    w = unique(w);
    h = unique(h);
    
    size_w = size(w,1);
    size_h = size(h,1);
    
    mid1 = sum(w)/size_w; %y좌표
    mid2 = sum(h)/size_h; %x좌표

    ans = [mid2, mid1];
    disp(ans);
    plot(mid2,mid1,'yp');
    
    x=480-mid2;
    y=360-mid1;
    
    if (460>mid2 || mid2>500)||(340>mid1 || mid1>380) 
        if x>0
            moveright(droneObj, 'Distance', 0.1);
        elseif x<0
            moveleft(droneObj, 'Distance', 0.1);
        end
        if y>0
            movedown(droneObj, 'Distance', 0.1);
        elseif y<0
            moveup(droneObj, 'Distance', 0.1);
        end
    else
        moveforward(droneObj, 'Distance', 1);
        break;
    end
end

land(droneObj);