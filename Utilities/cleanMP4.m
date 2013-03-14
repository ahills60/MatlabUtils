function cleanMP4(movObject)
%%cleanMP4
%
% cleanMP4 removes temporary files created for movie creation.
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

rmdir(movObject.templocation, 's');