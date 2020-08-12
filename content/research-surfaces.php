<section>
	<!-- Surfaces -->
	<aside class="image-left"><a href="pics/trucks.png"><img title="Surfaces on SO(3)" class="rounded-pic" src="pics/trucks.png" width="100%"/></a></aside>
	
	<article>
		<p class="subtitle">
			Bidimensional Bézier interpolation on manifolds
		</p>
		<p>
			In this project, we receive a set of data points evaluated on a Riemannian manifold $\mathcal{M}$ (for instance the space of matrices of rotation like in the picture; or the sphere). These points $p_{ij}$ are time-labeled, so associated to time-stamps $(t_1^i,t_2^j)$ organised on a regular rectangular grid $D$.
		</p>
		<p>
			Based on these points, the goal of the game is to propose a smooth (i.e. $C^1$) surface of Bézier
			$$\mathfrak{B}: D \to \mathcal{M}: (t_1,t_2) \mapsto \mathfrak{B}(t_1,t_2)$$ 
			such that the data points are interpolated by the surface, meaning $\mathfrak{B}(t_1^i, t_2^j) = p_{ij}$.
		</p>
		<p>
			This task is very well understood when the space is Euclidean, but quite less when points live on a nonlinear manifold. It is also a generalization of my master thesis.
		</p>
		<p class="more" onclick="$('#surfaces-bezier-more').slideToggle(400);">Learn more/less.</p>
		<div style="display: none" id="surfaces-bezier-more">
			<p>
				This work was done in collaboration with the university of Münster (Applied mathematics department) joinly with <a href="http://wwwmath.uni-muenster.de/num/wirth/">Benedikt Wirth</a> and <a href="http://wwwmath.uni-muenster.de/num/wirth/people/Striewski/index.html">Paul Striewski</a>. It has application in shape interpolation, matrix reconstruction or cartography.
			</p>
			<p> 
				The amont of possible functions interpolating the data points is infinite. We reduce the search set by constraining the surface to be a piecewise cubic Bézier spline, i.e. driven by control points. This family of function is of the form
				$$\beta(t_1,t_2,\mathbf{b})$$
				where $\mathbf{b} \in \mathcal{M}$ is a set of 16 control points on the manifold, and $\beta$ corresponds to a weighted (Karcher) mean of these control points.
				This choice implies a very simple (geodesic) constrain on the control points to achieve the smoothness of the spline.
				Finally, to propose the best function possible, a solution is to minimize its mean square (Riemannian) acceleration over the control points.
			</p>
			<blockquote>
				P.-A. Absil, Pierre-Yves Gousenbourger, Paul Striewski, Benedikt Wirth<br/>
				<a href="https://epubs.siam.org/doi/10.1137/16M1057978"><em>Differentiable piecewise-Bézier surfaces on Riemannian manifolds</em></a><br/>
				SIAM Journal on Imaging Sciences, 9(4), 1788-1828.<br/>
				DOI: 10.1137/16M1057978<br/>
				2017.
			</blockquote>
			<p>
				As the control points generation is quite long in the above article, we developped an other method to compute those based on a B-spline representation of the curve. We increase drastically the speed of the generation by paying the price of a smallest accuracy.
			</p>
			<blockquote>
				P.-A. Absil, Pierre-Yves Gousenbourger, Paul Striewski, Benedikt Wirth<br/>
				<a href="https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2016-96.pdf"><em>Differentiable piecewise-Bézier interpolation on Riemannian manifolds</em></a>.<br/>
				24th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning (ESANN 2016).<br/>
				2016.
			</blockquote>
			<p>
				We developped different algorithms and methods to compute these surfaces on a general Riemannian manifold. Mainly, the computation of control points and the reconstruction of the curve may vary. Check our Numerical Tour.
			</p>
		</div>
	</article>
</section>
