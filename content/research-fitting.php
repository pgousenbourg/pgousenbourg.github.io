<!-- Curves -->
<section>
	<aside class="image-left"><a href="pics/research_fitting.png"><img title="Fitting on manifolds" class="rounded-pic" src="pics/research_fitting.png" width="100%"/></a></aside>
	
	<article>
		<p class="subtitle">
			Unidimensional Bézier fitting on manifolds
		</p>
		<p>
			The natural next step after developping interpolation techniques on manifolds is to relax the interpolation constraint. I'm now interested in fast Bézier techniques to fit a curve $\gamma \in \mathcal{M}$ to manifold-valued data points $d_0,\dots,d_n \in \mathcal{M}$ associated to time-stamps $t_0,\dots,t_n$ where $t_i = i \in \mathbb{Z}$.
		</p>
		<p>
			An application of this project concerns wind field estimation for unmanned aerial vehicule (UAV) control (drones, if you prefer). In that application the wind field can be characterized by a covariance matrix of rank r, represented in the manifold of SDP matrices of size p and rank r ($\mathcal{S}_+(p,r)$). However, computing such a matrix for a given prevalent wind orientation $\theta_i$ requires time-consumable numerical simulations. Therefore, give a bench of $n$ covariance matrices $C(\theta(i))$, therefore, there is an interrest in finding a fitting a curve $\gamma(\theta(t)): [0,n-1] \to \mathcal{S}_+(p,r)$ with a fast a numerically efficient method.
		</p>
		<p>
			A first approach was presented at the ESANN2017 conference, as a joint work with Estelle Massart (UCL, Belgium) and Antoni Musolas (MIT, USA). That approach modifies the previous work on interpolation and thus still provides elegant and fast solutions in closed form.
		</p>
		<p class="more" onclick="$('#bezier-fitting-more').slideToggle(400);">Learn more/less.</p>
		<div style="display: none" id="bezier-fitting-more">
			<p>
				In the solution we propose, the curve $\gamma$ takes the form of a composite cubic Bézier curve
				$$B: [0,n] \to \mathcal{M}: B(t) = \beta_i(t-i;p_i,b_i^{+}, b_{i+1}^{-}, p_{i+1}), \quad \text{with } i = \lfloor t \rfloor,$$
				where $\beta_{i}$ is a cubic Bézier function $p_k, b_k^{\pm} \in \mathcal{M}$ are respectively the extreme control points of $\beta_i$ and the inner control points.
			</p>
			<p>
				In the following paper, we relax the interpolation constraint from Arnould et al (2015) and we search the curve $B(t)$ such that
				$$ \int_0^n \left\| \frac{D^2 B(t)}{dt^2} \right\|^2_\mathcal{M} \mathrm{d} t + \lambda \sum_{i=0}^n \mathrm{d}_\mathcal{M}(d_i,B(t_i))$$
				is minimized on the Euclidean space.
			</p>
			<p>
				The most recent method to achieve this goal is called the <em>Blended cubic spline</em> method. The method consists in 
				building polynomial pieces by solving the above-mentioned optimization problem in various (Euclidean) tangent spaces, and
				then blending together corresponding pieces by means of carefully chosen weights in order to satisfy all the following properties:
			</p>
			<ul>
				<li>The curve $B(t)$ is differentiable on its domain;</li>
				<li>The curve $B(t)$ interpolates the data points at their associated parameter when $\lambda$ goes to infinity;</li>
				<li>The curve $B(t)$ is the natural smoothing spline on the Euclidean space (i.e., the optimization problem is solved);</li>
				<li>The algorithm is only based on two operators: the Riemannian exponential and logarithm;</li>
				<li>The algorithm builds the curve $B(t)$ at a given $t$ in $\mathcal O(1)$ operations;</li>
				<li>The curve $B(t)$ is stored with only $\mathcal O(n)$ vectors, where $n$ is the number of data points.</li>
			</ul>
			<p>
				This method is summarized in the following paper:
			</p>
			<blockquote>
				Pierre-Yves Gousenbourger, Estelle Massart, P.-A. Absil<br/>
				<a href="https://link.springer.com/article/10.1007/s10851-018-0865-2"><em>Data fitting on manifolds with composite Bézier-like curves and blended cubic splines</em></a><br/>
				Journal on Mathematical Imaging and Vision, Springer.<br/>
				DOI: 10.1007/s10851-018-0865-2<br/>
				2018.
			</blockquote>			
			<p>
				Another approach consists in generalizing the optimality conditions to manifolds. The curve $B(t)$ is computed (in closed form) with very few elements of Riemannian geometry (the exp and the log, only !) and returns the	natural Bézier spline on the Euclidean space and is differentiable everywhere.
			</p>
			<blockquote>
				Pierre-Yves Gousenbourger, Estelle Massart, Antoni Musolas, P.-A. Absil, Laurent Jacques, Julien M. Hendrickx, Yousef Marzouk<br/>
				<a href="https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2017-77.pdf"><em>Piecewise-Bézier $C^1$ smoothing on manifolds with application to wind field estimation.</em></a><br/>
				ESANN2017, Springer.<br/>
				2017.
			</blockquote>
			<p>
				The efficiency of our fast solution is analysed in the following papers. We compare the quality of our reconstruction with the solution obtained by directly optimizing the objective function.
			</p>
			<p>
				In the following paper, we derive a variational model in which we approximate the acceleration by discretizing the squared second order derivative along the curve. We derive a closed-form, numerically stable and efficient algorithm to compute the gradient of a Bézier curve on manifolds with respect to its control points, expressed as a concatenation of so-called adjoint Jacobi fields. This is joint work with <a href="https://ronnybergmann.net/">Dr. Ronny Bergmann</a>, from TU Chemnitz.
			</p>
			<blockquote>
				Ronny Bergmann, Pierre-Yves Gousenbourger<br/>
				<a href="https://www.frontiersin.org/articles/10.3389/fams.2018.00059/full"><em>A Variational Model for Data Fitting on Manifolds by Minimizing the Acceleration of a Bézier Curve</em></a><br/>
				Frontiers in Applied Mathematics and Statistics, 4(59), 1-16.<br/>
				DOI: 10.3389/fams.2018.00059<br/>
				2018.
			</blockquote>
			<p>
				The paper hereunder is the preliminary study that lead to the document above.
			</p>
			<blockquote>
				Pierre-Yves Gousenbourger, Laurent Jacques, P.-A. Absil<br/>
				<a href="http://hdl.handle.net/2078.1/189233"><em>Fast Method to Fit a C1 Piecewise-Bézier Function to Manifold-Valued Data Points: How Suboptimal is the Curve Obtained on the Sphere S2?</em></a><br/>
				Geometric Science of Information: 3rd International Conference 2017, France.<br/>
				Proceedings (GSI2017), Springer.<br/>
				2017.
			</blockquote>
		</div>
	</article>
</section>
