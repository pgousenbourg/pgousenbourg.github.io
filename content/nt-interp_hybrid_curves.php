<section>
	<aside class="image-left"><img title="interpolation morphing" class="rounded-pic" src="pics/hybrid_curve_code_logo.gif" width=100%/></aside>
	
	<article>
		<p class="subtitle">
			Unidimensional interpolation with hybrid composite Bézier curves
		</p>
		<p>
			We are given a set of data points in the Euclidean space associated with a timestamp $t_i \in \mathbb{Z}$. We would like to compute a composite Bézier curve that interpolates the data points $d_i$ at time $t_i$. In this problem, we try to interpolate four data points $d_i \in \mathbb{S}^2$, the unit sphere. These points are places such that they represent a triangle.</p>
		<p>
			To fit the curve $\mathfrak{B}(t): [0,3] \to \mathbb{S}^2$, you can use our code here, general for manifolds. The possible manifolds are the Euclidean space, the sphere, the special orthogonal group SO(3),... actually all manifolds you can find in Manopt are operational. It is however mandatory to add manopt to your working path. The zip file hereunder contains an old version of Manopt for consistency. You can download the last version of Manopt here (recommended) : <a href="www.manopt.org">www.manopt.org</a>.
		</p>
		
		<a href="codes/toolbox_1d_hybride.zip">Download the code.</a>
		<p class="more" onclick="$('#nt-interp_hybrid_curves').slideToggle(400);">Show/hide the code tutorial.</p>
		
		<?php include('content/nt-codes/interp_hybrid_curves.php');?>
	</article> <!-- corps -->
</section>
