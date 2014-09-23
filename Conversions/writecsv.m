function writecsv(filename, inputvariable)
%WRITECSV Write a comma-separated value file from a cell object.
% 
%   WRITECSV(FILENAME, M) writes variable M to the file FILENAME. If M is
%   an object other than a cell, the csvwrite function is called instead.
%

%   Author: Andrew Hills (a.hills@sheffield.ac.uk)
%  Version: 1.0 (23/09/2014)

% Ensure that the correct number of input arguments are provided.
if nargin ~= 2
    error ('Invalid number of input arguments.')
end

% Check if input is of type cell.
if ~iscell(inputvariable)
    % Outsource to the csvwrite function:
    csvwrite(filename, inputvariable);
    return;
end

% Open a file object
fid = fopen(filename, 'w');

try
    % Let's try going through the contents of the cell object one-by-one
    for m = 1:size(inputvariable, 1)
        for n = 1:size(inputvariable, 2)
            % I expect we'll encounter these different types:
            if isnumeric(inputvariable{m, n})
                % Numeric objects
                fprintf(fid, '%f', inputvariable{m, n});
            elseif ischar(inputvariable{m, n})
                % Strings
                fprintf(fid, '%s', inputvariable{m, n});
            elseif iscell(inputvariable{m, n})
                % Cell (a cell in a cell). This does not support recursions 
                % without further programming! We try to convert to a 
                % matrix and hope for the best.
                warning('ParseWarning:CellInception', 'Cell in cell encountered in cell(%d, %d).', m, n);
                fprintf(fid, '%s', mat2str(cell2mat(inputvariable{m, n})));
            else
                % The unexpected.
                fprintf(fid, '%s', mat2str(inputvariable{m, n}));
            end
            % Only append a comma if we're not at the end of the line.
            if n ~= size(inputvariable, 2)
                fprintf(fid, ', ');
            end
        end
        % At the end of the line. Move to the next line.
        fprintf(fid, '\n');
    end
catch err
    % If, at first, you don't succeed, close the file and rethrow the error
    fclose(fid);
    rethrow(err);
end
