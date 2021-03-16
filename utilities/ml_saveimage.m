function ml_saveimage(img, imgdir,ext)
%ML_SAVEIMAGE Saves images according to the Murphylab title format for easy reading by

%Author: Unknown Date: Unknown
% Copyright (C) 2007-2013  Murphy Lab
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


if nargin<3
    error('3 arguments are required.');
end

if ~exist(imgdir, 'dir')
    mkdir(imgdir)
end

for i = 1:size(img,3)
    imwrite(img(:,:,i), [imgdir filesep 'img.z' num2str(i) '.' ext], ext)
end