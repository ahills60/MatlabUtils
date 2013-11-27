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

if ~isempty(movObject.videoresolution)
    resolution = [' -s ' movObject.videoresolution];
else
    resolution = '';
end

if strcmpi(movObject.codec, 'libx264')
    [status, ~] = system(sprintf('ffmpeg -r %i -i %sframe%%05d.%s -c:v libx264 %s -pix_fmt yuv420p%s %s', movObject.framerate, movObject.templocation, movObject.exporttype, movObject.x264options, resolution, movObject.filename), '-echo');
elseif strcmpi(movObject.codec, 'mjpeg')
    [status, ~] = system(sprintf('ffmpeg -f image2 -r %i -i %sframe%%05d.%s%s %s', movObject.framerate, movObject.templocation, movObject.exporttype, resolution, movObject.filename), '-echo');
else
    error('Unrecognisable codec')
end

% Enable capturing of errors in FFmpeg
if status ~= 0
    error('Video encoding failed')
end