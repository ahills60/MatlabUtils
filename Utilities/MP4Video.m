function output = MP4Video(filename, fps, resolution, vidRes)
%%MP4Video
%
% MP4Video returns an object that is used to create an MP4 video.
%
% Usage: movObject = MP4Video(filename, FrameRate, Resolution, VideoResolution)
%
% Defaults:
%
%       FrameRate: 24 frames/s
%      Resolution: display resolution
% VideoResolution: Dependendent on DPI and figure size
%

%
% Author: Andrew Hills (ahills60@gmail.com)
%

% Clean up inputs
if nargin < 4
    vidRes = '';
end
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
output.videoresolution = vidRes;
output.x264options = '-preset slow -crf 15'
if ~exist(output.templocation, 'file')
    mkdir(output.templocation);
end