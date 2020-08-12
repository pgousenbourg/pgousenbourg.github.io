<!-- Curves -->
<section>
	<aside class="image-left"><a href="pics/sphere.png"><img title="Curve on sphere" class="rounded-pic" src="pics/sphere.png" width="100%"/></a></aside>
	
	<article>
		<p class="subtitle">
			Unidimensional Bézier interpolation on manifolds
		</p>
		<p>
			This project was my master thesis lead in 2013 under Pierre-Antoine Absil's supervision. We receive a set of data points $p_0,\dots,p_n \in \mathcal{M}$ associated to time-stamps $t_0,\dots,t_n$ where $t_i = i \in \mathbb{Z}$. The goal of the project is to find a curve $\gamma$ such that the curve is smooth and looks "nice". Furthermore, we constraint the curve to interpolate the data points as $\gamma(t_i) = p_i$. This problem finds place in medical imaging and in volume reconstruction based on MRI.
		</p>
		<p>
			With Pierre-Antoine, we investigated on manifold-valued Bézier functions and on the usability of the De Casteljau algorithm in such situations. At the end of the day, we obtained that curves can be computed from a simple linear (Euclidean !) system resolution.
		</p>
		<p class="more" onclick="$('#curves-bezier-more').slideToggle(400);">Learn more/less.</p>
		<div style="display: none" id="curves-bezier-more">
			<p>
				In the solution we proposed, the curve $\gamma$ takes the form of a piecewise-Bézier function of the form
				$$\gamma: [0,n] \to \mathcal{M}: \gamma(t) = \beta(t-i,\mathbf{b}), \quad \text{with} \ i = \lfloor t \rfloor,$$
				where $\beta$ is a Bézier function and $\mathbb{b}$ is a set of control points $b_k \in \mathcal{M}$.
				We made a choice on the degree of the Bézier function: quadratic on $[t_0,t_1]$ and on $[t_{n-1},t_n]$ and cubic elsewhere.
				On this framework, we proposed different techniques to optimize the global Bézier spline (i.e. optimizing the control points).
			</p>
			<p>
				A first possibility is to fix velocities at interpolation points to assure the differentiability of the curve at those points, and then optimize the control points on a tangent space.
			</p>
			<blockquote>
				Pierre-Yves Gousenbourger, Chafik Samir, P.-A. Absil<br/>
				<a href="http://sites.uclouvain.be/absil/2014.10"><em>Piecewise-Bézier $C^1$ interpolation on Riemannian manifolds with application to 2D shape morphing</em></a><br/>
				International Conference on Pattern Recognition (ICPR2014), Stockholm.<br/>
				2014.
			</blockquote>
			<p>
				To relax this heuristic constraint on the velocities, we proposed, with Antoine Arnould, an intergrated solution. Basically, the points are projected on a (Euclidean) tangent space and the optimization is done on this Euclidean space. We apply this method to shape reconstruction in medical imaging.
			</p>
			<blockquote>
				Antoine Arnould, Pierre-Yves Gousenbourger, Chafik Samir, P.-A. Absil, Michel Canis<br/>
				<a href="http://sites.uclouvain.be/absil/2015.03"><em>Fitting Smooth Paths on Riemannian Manifolds: Endometrial Surface Reconstruction and Preoperative MRI-Based Navigation.</em></a><br/>
				Geometric Science of Information: second International Conference (GSI 2015), Palaiseau, France.<br/>
				Proceedings (Image Processing, Computer Vision, Pattern Recognition, and Graphics; 9389), Springer.<br/>
				2015.
			</blockquote>
			<p>
				Here also, codes are available on this web page. Check our Numerical Tours.
			</p>
		</div>
	</article>
</section>
