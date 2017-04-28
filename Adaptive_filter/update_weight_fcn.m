function weights = update_weight_fcn(step_size, err_sig, delayed_signal, filter_coeff, reset_weights)
% This function updates the adaptive filter weights based on LMS algorithm

%   Copyright 2007-2015 The MathWorks, Inc.

% NOTE: To instruct MATLAB Coder to compile an external function, 
% add the following compilation directive or pragma to the function code
%#codegen

step_sig = step_size .* err_sig;
correction_factor = delayed_signal .* step_sig;
updated_weight = correction_factor + filter_coeff;

if reset_weights
    weights = zeros(1,40);
else    
    weights = updated_weight;
end
end