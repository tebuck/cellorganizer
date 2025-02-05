function indexes = findTag( data, tag )
%FINDTAG Returns the starting indexes of all the occurrences of tag within
%the data.
% 
%Input argument data may a string or a cell containing one or various
%strings.
%
%Example
%> data = '<office>Center for Bioimage Informatics</office>';
%> tag = 'office';
%> indexes = findTag( data, tag )
%  indexes =
%      2    42

% Author: Ivan E. Cao-Berg (icaoberg@cmu.edu)
% Created: May 29, 2007
% Last Update: March 3, 2008
%
% Copyright (C) 2008 Center for Bioimage Informatics\Murphy Lab
% Carnegie Mellon University
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published
% by the Free Software Foundation; either version 2 of the License,
% or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
% 02110-1301, USA.
%
% For additional information visit http://murphylab.web.cmu.edu or
% send email to murphy@cmu.edu

indexes = [];
temp = [];
if( isa( data, 'cell' ) )
    for i=1:1:length( data )
        if( findstr( data{i}, tag ) )
            temp = [ temp, i ];
        end
    end
elseif( isa( data, 'char' ) )
    temp = findstr( data, tag );
    for i=1:1:length( temp )
        if( isOdd(i) )
            indexes(i) = temp(i);
        else
            indexes(i) = temp(i-1)+length(tag);
        end
    end
else
    error( 'CellOrganizer: Unsupported data type.' );
end
end%findTag