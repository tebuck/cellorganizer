function answer = generate_simulation_instances_min_framework_01sec( options )
% generate_simulation_instances_min_framework_01sec
%
% Synthesize multiple geometries for simulation and combine with reaction
% network in MCell MDL format into directories ready for MCell simulation.
%
% Input
% -----
% * a valid CellOrganizer model
% * one or more valid VCML reaction network models with Virtual Cell's 
%   default units
%
% Output
% ------
% * one or more valid VCML files with multiple simulations

% Author: Taraz Buck, Ivan E. Cao-Berg
%
% Copyright (C) 2016-2022 Murphy Lab
% Lane Center for Computational Biology
% School of Computer Science
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

start_time = tic;
start_cputime = cputime;
disp( mfilename );
% disp( ['The estimated running time is about ', num2str(n_images_to_synthesize * 24478.721/100/60, '%.1f'), ' minutes. Please wait.'] );

% Modified from code produced by generate_and_simulate.py
setup;
options = struct();
options.reaction_network_file = 'cellorganizer/data/CBExMinScaled3_01sec/CBExMinScaled3_01sec.*.mdl';
options.output_dir = 'cellorganizer/applications/generate_simulation_instances_min_framework_01sec.m.out';
options.cellorganizer = 'cellorganizer';
options.framework_model = 'cellorganizer-models/3D/spharm/lamp2.demo3D52.mat';
options.vesicle_models = ['cellorganizer-models/3D/tfr.mat'];
options.synthesis = 'framework';
options.output_image = true;
options.n_images_to_synthesize = 5;
options.n_vesicles = [1, 13819];
options.vesicle_volume_scale = 1;
options.downsampling = 0.5;
options.vcml_relative_downsampling = 0.5;
options.base_seed = 735945;
options.n_vesicles_seed_offset = 34188;
options.translations = {'cell', 'CP'; 'nuc', 'NU'; 'nucleus', 'NU'; 'lamp2_mat_tfr_mat', 'EN'; 'CP_EC', 'PM'; 'CP_EN', 'EM'; 'CP_NU', 'NM'};
options.simulation_end_time = 1.0;
options.simulation_default_time_step = 1.0;
options.simulation_max_time_step = 4;
options.simulation_output_time_step = 100;
options.simulation_absolute_tolerance = 1e-08;
options.simulation_relative_tolerance = 1e-08;
options.simulation_interaction_radius = 0.03;
options.simulation_seed_offset = 500578;
options.framework_min_clearance = 0.1;
options.framework_clearance_n_max_filter_rounds = 0;
options.intersecting_mesh_object_policy = 'ignore';
options.output_vcml = false;
options.output_mcell = true;
generate_simulation_instances_generic(options);

elapsed_time = toc(start_time);
elapsed_cputime = cputime - start_cputime;
fprintf('\n%s took %.3f s (%.3f s CPU time)\n\n', mfilename, elapsed_time, elapsed_cputime);

end%generate_simulation_instances_SarmaGhosh2012
