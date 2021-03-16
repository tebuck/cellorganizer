function objects = ml_findobjs2(imageproc)
%ML_FINDOBJS Find objects in an image.
%   OBJECTS = ML_FINDOBJS(IMGPROC) returns a cell array of objects. Each
%   object is a 4-column matrix with each row [X, Y, Z, gray level]. Any
%   value less than 1 in IMGPROC will be considered as background.

%   ??-???-???? Ivan E. Cao-Berg ignore objects of size 1
%   ??-???-???? Initial write T. Zhao
%   Copyright (c) Murphy Lab, Carnegie Mellon University

% Copyright (C) 2007  Murphy Lab
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

if nargin < 1
    error('Exactly 1 argument is required')
end

imagemask = imageproc > 0;
imagelabeled = bwlabeln(imagemask);
obj_number = max(imagelabeled(:));
objects = cell(1,obj_number);
imgsize = size(imageproc);

for i=1:obj_number
    idx = find(imagelabeled==i);
    if length(idx) ~= 1
     [X,Y,Z] = ind2sub(imgsize,idx);
     objects{i} = [X,Y,Z,imageproc(idx)];
    else
     disp('Ignoring objects of size 1')
    end
end

