% PLOT_EUCL
% Plot in the euclidean case the B�zier function (f) interpolating the
% interpolation points (p) and driven by the control points (b).

function plot_eucl(p,b,f)
    % variables
    p = cell2mat(p);
    b = cell2mat(b);
    
    switch length(p(1,:));
        case 2
            f = reshape(f,2,[])';
            plot(f(:,1), f(:,2),'b','LineWidth',2);
            hold on;
            plot(p(:,1),p(:,2),'.r','Markersize',30);
            plot(b(:,1),b(:,2),'.','Color',[0 0.7 0],'Markersize',30);
        case 3
            f = reshape(f,3,[])';
            plot3(f(:,1), f(:,2), f(:,3),'b','LineWidth',2);
            hold on;
            plot3(p(:,1),p(:,2),p(:,3),'.r','Markersize',30);
            plot3(b(:,1),b(:,2),b(:,3),'.','Color',[0 0.7 0],'Markersize',30);
        otherwise
            disp('Dimension to high. Impossible to represent the function.');
    end
    title('Bezier path','Fontsize',14);
end