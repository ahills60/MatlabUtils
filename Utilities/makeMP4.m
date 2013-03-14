function makeMP4(movObject)
%%makeMP4
%
% makeMP4 makes an MP4 movie file from the movie object.
%

%
% Author: Andrew Hills (ahills60@gmail.com)
%

if nargin ~= 1
    error('Expected movie object as an input')
end
if ~isstruct(movObject)
    error('Expected movie object structure as an input')
end

if strcmpi(movObject.codec, 'libx264')
    system(sprintf('ffmpeg -f image2 -r %i -i %sframe%%05d.%s -c:v libx264 %s', movObject.framerate, movObject.templocation, movObject.exporttype, movObject.filename));
elseif strcmpi(movObject.codec, 'mjpeg')
    system(sprintf('ffmpeg -f image2 -r %i -i %sframe%%05d.%s %s', movObject.framerate, movObject.templocation, movObject.exporttype, movObject.filename));
else
    error('Unrecognisable codec')
end