% PLOT_SPHERE
% Plot in the spherical case the Bézier function (f) interpolating the
% interpolation points (p) and driven by the control points (b).

function plot_sphere(p,b,f)
    assert(length(p{1})==3,'Plot only available for S^2');
    p = cell2mat(p);
    b = cell2mat(b);
    
    [X,Y,Z] = sphere(); 
    surf(0.95*X,0.95*Y,0.95*Z,...
        'FaceAlpha',0.7,'EdgeAlpha',1,...
        'FaceColor', [238 197 145]/255);
    hold on;
    
    f = reshape(f,3,[])';
    plot3(f(:,1), f(:,2), f(:,3),'b','LineWidth',2);
    hold on;
    plot3(p(:,1),p(:,2),p(:,3),'.r','Markersize',30);
    plot3(b(:,1),b(:,2),b(:,3),'.','Color',[0 0.7 0],'Markersize',30);
    
    title('Bezier path');
end