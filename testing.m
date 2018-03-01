
r = 10;
cx = 50; cy = 50;
image = ones(300, 300);
for theta=0:0.25:360
    radian = theta * (3.14/180);
    x = ceil(r * cos(radian) + cx);
    y = ceil(r * sin(radian) + cy);
    image(x, y) = 0;
end

imshow(image);