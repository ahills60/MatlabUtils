function movObject = takeframe(movObject, handle)
%%takeframe
%
% takeframe takes the current frame and saves it.
%

%
% Author: Andrew Hills (ahills60@gmail.com)
%

if nargin < 1
    error('Not enough input arguments')
elseif nargin < 2
    handle = gcf;
end
if nargout ~= 1
    error('Expected to output movie object to increment frame number.')
end

expfn = sprintf('%sframe%05.5d.%s', movObject.templocation, movObject.currentframe, movObject.exporttype);
try
    print(handle, ['-r' int2str(movObject.resolution)], ['-d' movObject.exporttype], expfn);
    movObject.currentframe = movObject.currentframe + 1;
catch exception
    error(['Could not save the frame. ' exception.message]);
end
