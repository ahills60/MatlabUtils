function output = MP4Video(filename, fps, resolution)
%%MP4Video
%
% MP4Video returns an object that is used to create an MP4 video.
%
% Usage: movObject = MP4Video(filename, FrameRate, Resolution)
%
% Defaults:
%
%    FrameRate: 24 frames/s
%   Resolution: display resolution
%

%
% Author: Andrew Hills (ahills60@gmail.com)
%

% Clean up inputs
if nargin < 3
    resolution = [];
end
if nargin < 2
    fps = [];
end

% Assign defaults if necessary
if isempty(fps)
    fps = 24;
end
if isempty(resolution)
    resolution = 0;
end

% Create output...
output.filename = filename;
output.resolution = resolution;
output.exporttype = 'png';
output.templocation = [tempname filesep];
output.framerate = fps;
output.currentframe = 1;
output.codec = 'mjpeg';
if ~exist(output.templocation, 'file')
    mkdir(output.templocation);
end