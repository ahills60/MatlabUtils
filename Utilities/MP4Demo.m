myMov = MP4Video('example.avi', 15, 600);
myMov.codec = 'mjpeg';
t = linspace(0,2.5*pi,40);
fact = 10*sin(t);
fig=figure;
[x,y,z] = peaks;
for k=1:length(fact)
    h = surf(x,y,fact(k)*z);
    axis([-3 3 -3 3 -80 80])
    axis off
    caxis([-90 90])
    myMov = takeframe(myMov, fig);
end
close(fig);
makeMP4(myMov);
cleanMP4(myMov);