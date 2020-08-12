% PLOT_EUCL
% Plot in the euclidean case the B�zier function (f) interpolating the
% interpolation points (p) and driven by the control points (b).

function plot_eucl_2d(pb)
    disp('--------------------------------------------------------------');
    fprintf('Plotting...');
    
    % variables
    c = pb.curve;
    p = pb.control;
    
    plot3(c(:,1),c(:,2),c(:,3),'.');
    hold on;
    plot3(p(:,1),p(:,2),p(:,3),'r.','MarkerSize',20);
    
    fprintf('ok! \n');
end
