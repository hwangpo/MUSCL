function dt = ComputeTimeStep(node)
%********************************************************************************
%* This subroutine computes the explicit time-step: the minimum dt over nodes.
%*
%* ------------------------------------------------------------------------------
%*  Input: node(i)%vol = Dual volume
%*         node(i)%wsn = Sum of the max wave speed multiplied by the face length
%*
%* Output:         dt  = global time step
%*         node(:)%dt  =  local time step
%* ------------------------------------------------------------------------------
%*
%* NOTE: Local time step is computed and stored at every node, but not used.
%*       For steady problems, it can be used to accelerate the convergence.
%*
%********************************************************************************
dt_min = 1.0E+05;

for i = 1:nN
    % Local time step: dt = volume/sum(0.5*max_wave_speed*face_area).
    node(i).dt = node(i).vol / node(i).wsn;
    
    % Keep the minimum dt
    if i==1, dt_min=node(i).dt; end; dt_min = min(dt_min,node(i).dt);
end

% Global time-step
dt = dt_min;

end