% PLOT_SO(3)
% Plot in the SO3 case the B�zier function (f) interpolating the
% interpolation points (p) and driven by the control points (b).

function plot_so3(pb)
    % variables
    f = pb.curve;
    step = (pb.n-1)*3 + 1;
    
    % prepare the orientations to plot
    plotteur = zeros(3,3,step);
    for i = 1:step
        plotteur(:,:,i) = f(:,:,1 + (i-1)*floor((pb.t-1)/3));
    end
    
    % plot
    switch pb.object_so3
        case 'ellipsoid'
            [Xs,Ys,Zs] = ellipsoid(0, 0, 0, 1, .5, .5, 30);
            for i = 1:size(plotteur,3)
                hold on;
                draw_ellipse(plotteur(:,:,i),[203 220 237]/255,Xs,Ys,Zs,i-1);
            end
        case 'car'
            %disp('Does not work for now');
            plotrotations(plotteur,pb.object_so3);
        case 'satellite'
            %disp('Does not work for now');
            plotrotations(plotteur,pb.object_so3);
        otherwise
            error('No such object for SO3 plotting');
    end
    title('Bezier path');
end

function draw_ellipse(x,color,Xs,Ys,Zs,place)
    S = x*[Xs(:).'; Ys(:).'; Zs(:).'];
    Xr = reshape(S(1,:), size(Xs));
    Yr = reshape(S(2,:), size(Ys));
    Zr = reshape(S(3,:), size(Zs));
    center = place*3;
    
    %clf;
    hold on;
    
    % Plot the ellispoid
    surf(Xr + center*ones(size(Xr)),Yr,Zr,'Facecolor',color);
    
    % Plot the axes
    r = 1.1;
    plot3(r*[1 -1] + center*[1,1], [0 0], [0 0], '-', 'LineWidth', 2, 'Color', [42 83 125]/255);
    plot3([0 0] + center*[1,1], r*[1 -1], [0 0], '-', 'LineWidth', 2, 'Color', [42 83 125]/255);
    plot3([0 0] + center*[1,1], [0 0], r*[1 -1], '-', 'LineWidth', 2, 'Color', [42 83 125]/255);
    
    %axis equal;
    axis off;
    axis equal;
end


function plotrotations(R,object)
    switch object
        case 'car'
            m = model3d('plot/SO3/3Dobjects/Toy car N130810.3DS'); D = 350;
        case 'satellite'
            m = model3d('plot/SO3/3Dobjects/MGSatellite.3ds'); D = 70;
    end
    m = m - center_of_mass(m);
    
    Mp = qrot(m, dc2quat(R(:, :, 1)));
    for i = 2 : size(R, 3)
        Mp = Mp + ((i-1)*[D 0 0] + qrot(m, dc2quat(R(:, :, i))));
    end

    plot(Mp);
    light;
    lighting gouraud;
    view(0,0);
    axis off;
    save('MP.mat','Mp');
end
