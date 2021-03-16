function [feat,names,slfnames] = features_texture( prot, GLEVELS)
% takes as input background subtracted prot image

GLEVELS = GLEVELS - 1;

[c b] = imhist(prot);
[a ind] = max(c);
prot = prot - b(ind);

prot = single(prot);
prot = uint8(round(GLEVELS*prot/max(prot(:))));

feat = ml_texture( prot);
feat = [mean(feat(1:13,[1 3]),2); mean(feat(1:13,[2 4]),2)]';

names = {'Angular second moment','Contrast','Correlation', ...
    'Sum of squares','Inverse difference moment','Sum average', ...
    'Sum variance','Sum entropy','Entropy','Difference variance', ...
    'Difference entropy','Information measure of correlation 1', ...
    'Information measure of correlation 2', ...
    'Angular second moment (diagonal)','Contrast (diagonal)', ...
    'Correlation (diagonal)', 'Sum of squares (diagonal)', ...
    'Inverse difference moment (diagonal)','Sum average (diagonal)', ...
    'Sum variance (diagonal)','Sum entropy (diagonal)', ...
    'Entropy (diagonal)','Difference variance (diagonal)', ...
    'Difference entropy (diagonal)', ...
    'Information measure of correlation 1 (diagonal)', ...
    'Information measure of correlation 2 (diagonal)' ...
    };

for i=1:length(names)
    names{i} = [names{i} '_' num2str(GLEVELS) '_graylevels'];
end

slfnames = repmat({''},[1 length(names)]);

return

