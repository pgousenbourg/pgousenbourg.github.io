<section>
	<aside class="image-left"><a href="http://nl.mathworks.com"><img title="Matlab" class="rounded-pic" src="pics/matlab.png" width=100%/></a></aside>
	
	<article>
		<p class="subtitle">
			Bidimensional interpolation with Bézier spline
		</p>
		<p>
			We are given a set of data points in the Euclidean space associated with two timestamps (m,n) organised on a regular grid. These timestamps give the order in which points must be interpolated. In this problem, for visualization convenience and without loss of generality, the (x,y) value of the data points correspond to the regular grid (m,n) and the z-value is randomly chosen. The points are organized in a 2D-cell corresponding to the order of interpolation.</p>
		<p>
			From these data points, the goal here is to draw a 2d-Bézier spline interpolating those in a $C^1$ way. For this, you can use our code here, general for manifolds. The possible manifolds are the Euclidean space, the sphere and the special orthogonal group SO(3).</p>
		
		<a href="codes/bezier-surface.zip">Download the code.</a>
		<p class="more" onclick="$('#nt-bezier-surfaces').slideToggle(400);">Show/hide the code tutorial.</p>
		
		<?php include('content/nt-codes/surfaces.php');?>
	</article> <!-- corps -->
</section>
