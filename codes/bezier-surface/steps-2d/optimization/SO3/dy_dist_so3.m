% Function matlab to evaluate the gradient of the distance between two points on so3

function df = dy_dist_so3(x,y)
	df = -2*(x - y);
end
