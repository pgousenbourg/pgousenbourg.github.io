% Function matlab to evaluate the distance between two points on so(3)

function d = dist_so3(x,y)
	d = norm(x - y)^2;
end
