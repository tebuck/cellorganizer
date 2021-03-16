function answer = get_ometiff_dimensionality( ometiff )
% function answer = get_ometiff_dimensionality()

% Get the dimesionality (2D, 3D, or 4D) of an OME.TIFF image
% 
% Ulani Qi (uhq@andrew.cmu.edu)
%
% Copyright (C) 2017 Murphy Lab
% Computational Biology Department
% Carnegie Mellon University
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published
% by the Free Software Foundation; either version 2 of the License,
% or (at your option) any later version.o
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

data = bfopen(ometiff); %opens image using bioformats
omeMeta = data{1,4}; %gets the metadata block
dimZ = omeMeta.getPixelsSizeZ(0).getValue();
dimT = omeMeta.getPixelsSizeT(0).getValue();
if dimT > 1
    answer = '4D';
else
    if dimT == 1 && dimZ == 1
        answer = '2D';
    else
        answer = '3D';
    end
end
end

