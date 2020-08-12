<!-- Publications -->
<div name="Publications" id="sec-publications" style="display: none" class="tab">
	<section>
		<aside class="image-left"><img title="UCL" class="rounded-pic" src="pics/publications.png" width=100%/></aside>
		
		<article>
			<p class="subtitle" style="margin-top:0">
				<img style="padding-right: 10px;" height="20px" src="pics/icon_pdf.png"> Journal papers
			</p>
			<ul class="papers">
				<!-- Frontiers -->
				<li>
					<div class="paperEntry">
						<div>
							P.-Y. Gousenbourger, <a target="_blank" href="https://ronnybergmann.net/">R. Bergmann</a>. 
							<span class="paperTitle">A variational model for data fitting on manifolds by minimizing the acceleration of a Bézier curve.</span>
							<span class="paperJournal">Frontiers in Applied Mathematics and Statistics</span>, 4(59), 2018.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_J03').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/frontiers2018.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_J03').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a target="_blank" href="https://www.frontiersin.org/articles/10.3389/fams.2018.00059/full"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_J03">
						We derive a variational model to fit a composite Bézier curve to a set of data points on a Riemannian manifold.
						The resulting curve is obtained in such a way that its mean squared acceleration is minimal in addition to remaining close the data points. 
						We approximate the acceleration by discretizing the squared second order derivative along the curve. 
						We derive a closed-form, numerically stable and efficient algorithm to compute the gradient of a Bézier curve on manifolds with respect 
						to its control points, expressed as a concatenation of so-called adjoint Jacobi fields. 
						Several examples illustrate the capabilites and validity of this approach both for interpolation and approximation. 
						The examples also illustrate that the approach outperforms previous works tackling this problem.
					</p>
					<div class="paperQuote" id="cite_J03">
<pre class="codeinput">@article{Bergmann2018a,
  title   = {{A variational model for data fitting on manifolds by minimizing 
             the acceleration of a B\'ezier curve}},
  author  = {Bergmann, Ronny and Gousenbourger, Pierre-Yves},
  journal = {Frontiers in Applied Mathematics and Statistics},
  doi     = {10.3389/fams.2018.00059},
  volume  = {4},
  number  = {59},
  pages   = {1--16},
  year    = {2018}
}</pre>
					</div>
				</li>
				
				
				
				<!-- JMIV -->
				<li>
					<div class="paperEntry">
						<div>
							P.-Y. Gousenbourger, <a target="_blank" href="https://perso.uclouvain.be/estelle.massart/">E. Massart</a>, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>. 
							<span class="paperTitle">Data Fitting on Manifolds with Composite Bézier-Like Curves and Blended Cubic Splines.</span>
							<span class="paperJournal">Journal of Mathematical Imaging and Vision</span>, 61(5), pp. 645-671, 2018.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_J02').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/jmiv2018.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_J02').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a target="_blank" href="https://link.springer.com/article/10.1007%2Fs10851-018-0865-2"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_J02">
						We propose several methods that address the problem of fitting a $C^1$ curve $\gamma$ to time-labeled data points on a manifold. 
						The methods have a parameter, $\lambda$, to adjust the relative importance of the two goals that the curve should meet: 
						being "straight enough" while fitting the data "closely enough". 
						The methods are designed for ease of use: 
						they only require to compute Riemannian exponentials and logarithms, they represent the curve by means of a number of tangent 
						vectors that grows linearly with the number of data points, and, once the representation is computed, evaluating $\gamma(t)$ at any $t$ 
						requires a small number of exponentials and logarithms (independent of the number of data points). 
						Among the proposed methods, the blended cubic spline technique combines the additional properties of interpolating the data when $\lambda \to \infty$ 
						and reducing to the well-known cubic smoothing spline when the manifold is Euclidean. The methods are illustrated on synthetic and real data.
					</p>
					<div class="paperQuote" id="cite_J02">
<pre class="codeinput">@article{Gousenbourger2018,
  author  = {Gousenbourger, Pierre-Yves and Massart, Estelle and Absil, P.-A.},
  title   = {Data fitting on manifolds with composite {B\'e}zier-like curves and blended cubic splines},
  journal = {Journal of Mathematical Imaging and Vision},
  doi     = {10.1007/s10851-018-0865-2},
  volume  = {61},
  number  = {5},
  pages   = {645-671},
  year    = {2018}
}</pre>
					</div>
				</li>
				
				
				
				<!-- SIAM -->
				<li>
					<div class="paperEntry">
						<div>
							<a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>, P.-Y. Gousenbourger, <a target="_blank" href="https://www.uni-muenster.de/AMM/num/wirth/people/Striewski/index.html">P. Striewski</a>, <a target="_blank" href="https://www.uni-muenster.de/Cells-in-Motion/people/all/wirth-b.php">B. Wirth</a>. 
							<span class="paperTitle">Differentiable Piecewise-Bézier Surfaces on Riemannian Manifolds.</span>
							<span class="paperJournal">SIAM Journal on Imaging Sciences</span>, 9(4), pp. 1788-1828, 2016.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_J01').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/siims2016.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_J01').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a target="_blank" href="https://epubs.siam.org/doi/10.1137/16M1057978"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_J01">
						We propose several methods that address the problem of fitting a $C^1$ curve $\gamma$ to time-labeled data points on a manifold. 
						The methods have a parameter, $\lambda$, to adjust the relative importance of the two goals that the curve should meet: 
						being "straight enough" while fitting the data "closely enough". 
						The methods are designed for ease of use: 
						they only require to compute Riemannian exponentials and logarithms, they represent the curve by means of a number of tangent 
						vectors that grows linearly with the number of data points, and, once the representation is computed, evaluating $\gamma(t)$ at any $t$ 
						requires a small number of exponentials and logarithms (independent of the number of data points). 
						Among the proposed methods, the blended cubic spline technique combines the additional properties of interpolating the data when $\lambda \to \infty$ 
						and reducing to the well-known cubic smoothing spline when the manifold is Euclidean. The methods are illustrated on synthetic and real data.
					</p>
					<div class="paperQuote" id="cite_J01">
<pre class="codeinput">@article{Absil2016,
  author  = {Absil, P.-A. and Gousenbourger, Pierre-Yves and Striewski, Paul and Wirth, Benedikt},
  title   = {{Differentiable Piecewise-B\'ezier Surfaces on Riemannian Manifolds}},
  doi     = {10.1137/16M1057978},
  journal = {SIAM Journal on Imaging Sciences},
  volume  = {9},
  number  = {4},
  pages   = {1788--1828},
  year    = {2016}
}</pre>
					</div>
				</li>
			</ul>
			
			
			
			
			
			
			<p class="subtitle">
				<img style="padding-right: 10px;" height="20px" src="pics/icon_pdf.png"> Conference papers
			</p>
			<ul class="papers">
				<!-- CoDiT2019 -->
				<li>
					<div class="paperEntry">
						<div>
              <a target="_blank" href="https://sites.google.com/view/ntson/home?fbclid=IwAR35yNqlZr5D93VeebbRvhxet_n_CXwfOrZwunlWopXizz9ojUjlzdhM7wA">N. T. Son</a>, P.-Y. Gousenbourger, <a target="_blank" href="https://perso.uclouvain.be/estelle.massart/">E. Massart</a>, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>.
							<span class="paperTitle">Online balanced truncation for linear time-varying systems using continuously differentiable interpolation on Grassmann manifold
</span>
							<span class="paperJournal">Proceedings of the 6th International Conference on Control, Decision and Information Technologies (CoDIT 2019)</span>, 2019, to appear.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C08').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/codit2019.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C08').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="https://codit19.com/index.php/accueil" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C08">
						We consider model order reduction of linear time-varying systems on a finite time interval using balanced truncation. A standard way to perform MOR is to first numerically integrate the associated pair of differential Lyapunov equations for the two gramians, then compute projection matrices using the square root method, and finally formulate the reduced systems at each time instant of a chosen grid. This approach is well-known for delivering good approximation, but rather costly in computation and storage requirement. Furthermore, if one needs to compute the reduced system for any new time instant that is not included in the chosen grid, the mentioned procedure must be performed again without explicitly making use of the already computed data. For dealing with such a situation, we propose to store the projection matrices corresponding to a simplified sparse time grid and to use them to recover the projection subspaces at any other time instant via curve interpolation on the Grassmann manifold. By doing this, we can avoid the repetition of solving the differential Lyapunov equations which is the most expensive step in the procedure and therefore, as shown in a numerical example, accelerate the online reduction process.
					</p>
          <div class="paperQuote" id="cite_C08">
<pre class="codeinput">@inproceedings{Son2019,
  author  = {Son, Nguyen Thanh and Gousenbourger, Pierre-Yves and Massart, Estelle and Absil, P.-A.},
  title   = {Online balanced truncation for linear time-varying systems using continuously differentiable interpolation on Grassmann manifold},
  booktitle = {2019 6th International Conference on Control, Decision and Information Technologies (CoDIT)},
  pages   = {165--170},
  year    = {2019},
  organization = {IEEE}
}</pre>
					</div>
				</li>
        
        
        <!-- ESANN2019 -->
				<li>
					<div class="paperEntry">
						<div>
							<a target="_blank" href="https://perso.uclouvain.be/estelle.massart/">E. Massart</a>, P.-Y. Gousenbourger, <a target="_blank" href="https://sites.google.com/view/ntson/home?fbclid=IwAR35yNqlZr5D93VeebbRvhxet_n_CXwfOrZwunlWopXizz9ojUjlzdhM7wA">N. T. Son</a>, <a target="_blank" href="https://scwww.math.uni-augsburg.de/~stykel/index_en.html">T. Stykel</a>, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>.
							<span class="paperTitle">Interpolation on the manifold of fixed-rank positive-semidefinite matrices for parametric model order reduction: preliminary results.</span>
							<span class="paperJournal">ESANN2019</span>, submitted.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C07').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/esann2019.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C07').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="https://www.elen.ucl.ac.be/esann/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C07">
						We present several interpolation schemes on the manifold of fixed-rank positive-semidefinite (PSD) matrices.
						We explain how these techniques can be used for model order reduction of parameterized linear dynamical systems, 
						and obtain preliminary results on an application.
					</p>
          <div class="paperQuote" id="cite_C07">
<pre class="codeinput">@inproceedings{Massart2019a,
  author  = {Massart, Estelle and Gousenbourger, Pierre-Yves and Son, Nguyen Thanh and Stykel, Tatjana and Absil, P.-A.},
  title   = {Interpolation on the manifold of fixed-rank positive-semidefinite matrices for parametric model order reduction: preliminary results},
  booktitle = {ESANN2019},
  pages   = {281--286},
  isbn    = {978-287-587-065-0},
  publisher = {Springer},
  year    = {2019}
}</pre>
					</div>
				</li>
				
				
				<!-- GSI2017 -->
				<li>
					<div class="paperEntry">
						<div>
							P.-Y. Gousenbourger, <a target="_blank" href="https://perso.uclouvain.be/laurent.jacques/">L. Jacques</a>, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>.
							<span class="paperTitle">Fast method to fit a $C^1$ piecewise-Bézier function to manifold-valued data points: how suboptimal is the curve obtained on the sphere $\mathbb S^2$?</span>
							<span class="paperJournal">Nielsen, F. and Barbaresco F., editors, GSI2017</span>, pp. 595-603, 2017.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C06').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/gsi2017.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C06').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="https://www.see.asso.fr/gsi2017" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C06">
						We propose an analysis of the quality of the fitting method proposed in [<a href="https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2017-77.pdf" target="_blank">7</a>].
						This method fits smooth paths to manifold-valued data points using $C^1$ piecewise-B ́ezier functions. 
						This method is based on the principle of minimizing an objective function composed of a data-attachment term and a regularization term chosen as the mean squared
						acceleration of the path. However, the method strikes a tradeoff between speed and accuracy by following a strategy that is guaranteed to yield
						the optimal curve only when the manifold is linear. 
						In this paper, we focus on the sphere $S^2$. 
						We compare the quality of the path returned by the algorithms from [<a href="https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2017-77.pdf" target="_blank">7</a>] 
						with the path obtained by minimizing, over the same search space of $C^1$ piecewise-B́ezier curves, a finite-difference approximation of the objective 
						function by means of a derivative-free manifold-based optimization method.
					</p>
					<div class="paperQuote" id="cite_C06">
<pre class="codeinput">@inproceedings{Gousenbourger2017a,
  author  = {Gousenbourger, Pierre-Yves and Jacques, Laurent and Absil, P.-A.},
  editor  = {Nielsen, Frank and Barbaresco, Fr{\'e}d{\'e}ric},
  title   = {Fast method to fit a {$C^1$} piecewise-{B\'{e}}zier function to manifold-valued data points: how suboptimal is the curve obtained on the sphere {$\mathbb S^2$}?},
  booktitle = {Geometric Science of Information},
  doi     = {10.1007/978-3-319-68445-1_69},
  publisher = {Springer},
  address = {Berlin, Heidelberg},
  series  = {Lecture Notes in Computer Sciences},
  volume  = {10589},
  pages   = {595--603},
  year    = {2017}
}</pre>
					</div>
				</li>
				
				
				
				
				<!-- ESANN2017 -->
				<li>
					<div class="paperEntry">
						<div>
							P.-Y. Gousenbourger, <a target="_blank" href="https://perso.uclouvain.be/estelle.massart/">E. Massart</a>, A. Musolas, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>, <a target="_blank" href="https://perso.uclouvain.be/laurent.jacques/">L. Jacques</a>, <a target="_blank" href="https://perso.uclouvain.be/julien.hendrickx/">J.M. Hendrickx</a>, <a target="_blank" href="https://aeroastro.mit.edu/youssef-marzouk">Y. Marzouk</a>.
							<span class="paperTitle">Piecewise-Bézier $C^1$ smoothing on manifolds with application to wind field estimation.</span>
							<span class="paperJournal">ESANN2017, Springer eds,</span>, pp. 305-301, 2017.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C05').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/esann2017.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C05').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="https://www.elen.ucl.ac.be/esann/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C05">
						We propose an algorithm for fitting $C^1$ piecewise-Bézier curves to (possibly corrupted) data points on manifolds.
						The curve is chosen as a compromise between proximity to data points and regularity.
						We apply our algorithm as an example to fit a curve to a set of low-rank covariance matrices, a task arising in wind field modeling.
						We show that our algorithm has denoising abilities for this application.
					</p>
					<div class="paperQuote" id="cite_C05">
<pre class="codeinput">@inproceedings{Gousenbourger2017,
  author  = {Gousenbourger, Pierre-Yves and Massart, Estelle and Musolas, Antoni and Absil, P.-A. and Jacques, Laurent and Hendrickx, Julien M and Marzouk, Youssef},
  booktitle = {ESANN2017},
  pages   = {305--310},
  publisher = {Springer},
  title   = {Piecewise-{B}{\'e}zier {$C^1$} smoothing on manifolds with application to wind field estimation},
  year    = {2017}
}</pre>
					</div>
				</li>
				
				
				<!-- ESANN2016 -->
				<li>
					<div class="paperEntry">
						<div>
							<a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>, P.-Y. Gousenbourger, <a target="_blank" href="https://www.uni-muenster.de/AMM/num/wirth/people/Striewski/index.html">P. Striewski</a>, <a target="_blank" href="https://www.uni-muenster.de/Cells-in-Motion/people/all/wirth-b.php">B. Wirth</a>.
							<span class="paperTitle">Differentiable piecewise-Bézier interpolation on Riemannian manifolds.</span>
							<span class="paperJournal">ESANN2016, Springer eds,</span>, pp. 95-100, 2016.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C04').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/esann2016.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C04').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="https://www.elen.ucl.ac.be/esann/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C04">
						We propose a generalization of classical Euclidean piecewise-Bézier surfaces to manifolds, and we use this generalization to compute
						a $C^1$-surface interpolating a given set of manifold-valued data points associated to a regular 2D grid. 
						We then propose an efficient algorithm to compute the control points defining the surface based on the Euclidean concept of natural $C^2$-splines 
						and show examples on different manifolds.
					</p>
					<div class="paperQuote" id="cite_C04">
<pre class="codeinput">@inproceedings{Absil2016a,
  author    = {Absil, P.-A. and Gousenbourger, Pierre-Yves and Striewski, Paul and Wirth, Benedikt},
  title     = {Differentiable piecewise-{B\'{e}}zier interpolation on {R}iemannian manifolds},
  booktitle = {ESANN2016},
  isbn      = {978--287587027--8},
  publisher = {Springer},
  pages     = {95--100},
  year      = {2016}
}</pre>
					</div>
				</li>
				
				
				<!-- BMVC2015 -->
				<li>
					<div class="paperEntry">
						<div>
							C. Samir, P.-Y. Gousenbourger, S. H. Joshi.
							<span class="paperTitle">Cylindrical Surface Reconstruction by Fitting Paths on Shape Space.</span>
							<span class="paperJournal">EProceedings of the 1st International Workshop on DIFFerential Geometry in Computer Vision for Analysis of Shapes, Images and Trajectories (DIFF-CV 2015)</span>, 2015.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C03').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/bmvc2015.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C03').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="http://www.bmva.org/bmvc/2015/index.html" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C03">
						We present a differential geometric approach for cylindrical anatomical surface reconstruction from 3D volumetric data that may have missing slices or discontinuities.
						We extract planar boundaries from the 2D image slices, and parameterize them by an indexed set of curves. 
						Under the SRVF framework, the curves are represented as invariant elements of a nonlinear shape space. 
						Differently from standard approaches, we use tools such as exponential maps and geodesics from Riemannian geometry and solve the problem of surface reconstruction 
						by fitting paths through the given curves. 
						Experimental results show the surface reconstruction of smooth endometrial tissue shapes generated from MRI slices.
					</p>
					<div class="paperQuote" id="cite_C03">
<pre class="codeinput">@inproceedings{Samir2015,
  author = {Samir, Chafik and Gousenbourger, Pierre-Yves and Joshi, Shantanu H.},
  booktitle = {DIFF-CV 2015},
  pages  = {1--10},
  title  = {{Cylindrical Surface Reconstruction by Fitting Paths on Shape Space}},
  year   = {2015}
}</pre>
					</div>
				</li>
				
				
				
				
				<!-- GSI2015 -->
				<li>
					<div class="paperEntry">
						<div>
							A. Arnould, P.-Y. Gousenbourger, C. Samir, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>, M. Canis.
							<span class="paperTitle">Fitting smooth paths on Riemannian manifolds: Endometrial surface reconstruction and preoperative MRI-based navigation.</span>
							<span class="paperJournal">Nielsen, F. and Barbaresco F., editors, GSI2015</span>, pp. 491-498, 2015.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C02').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/gsi2015.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C02').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="https://www.see.asso.fr/gsi2015" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C02">
						We present a new method to fit smooth paths to a given set of points on Riemannian manifolds using $C^1$ piecewise-Bézier functions. 
						A property of the method is that, when the manifold reduces to a Euclidean space, the control points minimize the mean square acceleration of the path. 
						As an application, we focus on data observations that evolve on certain nonlinear manifolds of importance in medical imaging: 
						the shape manifold for endometrial surface reconstruction; the special orthogonal group $SO(3)$ and the special Euclidean group $SE(3)$ 
						for preoperative MRI-based navigation. 
						Results on real data show that our method succeeds in meeting the clinical goal: combining different modalities to improve the localization of the endometrial lesions.
					</p>
					<div class="paperQuote" id="cite_C02">
<pre class="codeinput">@inproceedings{Arnould2015,
  author  = {Arnould, Antoine and Gousenbourger, Pierre-Yves and Samir, Chafik and Absil, P.-A. and Canis, Michel},
  title   = {{Fitting Smooth Paths on Riemannian Manifolds : Endometrial Surface Reconstruction and Preoperative MRI-Based Navigation}},
  booktitle = {Geometric Science of Information},
  doi     = {10.1007/978-3-319-25040-3_53},
  editor  = {Nielsen, Frank and Barbaresco, Fr{\'e}d{\'e}ric},
  publisher = {Springer},
  address = {Berlin, Heidelberg},
  series  = {Lecture Notes in Computer Sciences},
  volume  = {9389},
  pages   = {491--498},
  year    = {2015}
}</pre>
					</div>
				</li>
				
				
				
				
				
				<!-- ICPR2014 -->
				<li>
					<div class="paperEntry">
						<div>
							P.-Y. Gousenbourger, C. Samir, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>.
							<span class="paperTitle">Piecewise-Bézier $C^1$ interpolation on Riemannian manifolds with application to 2D shape morphing.</span>
							<span class="paperJournal">International Conference on Pattern Recognition (ICPR)</span>, pp. 4086-4091, 2014.
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_C01').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/icpr2014.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a class="more" onclick="$('#cite_C01').slideToggle(400);"><img src="pics/icon_bib.png"></a></li>
							<li><a href="https://iapr.org/archives/icpr2014/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_C01">
						We propose a generalization of classical Euclidean piecewise-Bézier surfaces to manifolds, and we use this generalization to compute
						a $C^1$-surface interpolating a given set of manifold-valued data points associated to a regular 2D grid. 
						We then propose an efficient algorithm to compute the control points defining the surface based on the Euclidean concept of natural $C^2$-splines 
						and show examples on different manifolds.
					</p>
					<div class="paperQuote" id="cite_C01">
<pre class="codeinput">@inproceedings{Gousenbourger2014,
  author = {Gousenbourger, Pierre-Yves and Samir, Chafik and Absil, P.-A.},
  title  = {Piecewise-{B\'e}zier {$C^1$} interpolation on {R}iemannian manifolds with application to {2D} shape morphing},
  booktitle = {International Conference on Pattern Recognition (ICPR)},
  pages  = {4086--4091},
  year   = {2014},
  doi    = {10.1109/ICPR.2014.700},
  isbn   = {9781479952083},
  issn   = {10514651}
}</pre>
					</div>
				</li>
			</ul>
			
			
			
			
			
			<p class="subtitle">
				<img style="padding-right: 10px;" height="20px" src="pics/icon_slides.png"> Talks
			</p>
      <ul class="papers">
        <!-- ISPS2019 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Data fitting on manifolds: applications, challenges and solutions</span>
							<div><span class="paperJournal">ISP Group</span>, Louvain-la-Neuve, Belgium. Dec. 11, 2019.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T17').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/isps2019_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a target="_blank" href="https://sites.uclouvain.be/ispgroup/ISPS/HomePage"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T17">
						Storm trajectories prediction, birds migrations follow-up, rigid rotations of 3D objects, wind field estimation, model order reduction of superlarge parameter-dependent dynamical systems, MRI 3D body volumes reconstruction... All these applications have two things in common: first, they have a geometrical data-structure, i.e., the data lives on a (generally) Riemannian manifold; second, they can benefit of parameter(s)-dependent fitting methods somewhere in the process. If data fitting is a basic problem in the Euclidean space (where natural cubic splines and thin plates splines are the superstars in the domain), it become more intricate when data structure constrains the problem. 
					<br/><br/>
						This talk is an opportunity to present you an efficient, ready-to-use algorithm for data fitting on manifolds based on B\'ezier curves, applied to some of the aforementioned applications.
					</p>
				</li>
        
        
        
        <!-- Benelux2019 -->
        <li>
          <div class="paperEntry">
            <div class="talk">
              <span class="paperTitle">Data fitting on manifolds by minimizing the mean square acceleration of a Bézier curve</span>
              <div><span class="paperJournal">Benelux Meeting 2019</span>, Lommel, Belgium. Mar. 19, 2019.</div>
            </div>
            <ul class="icons">
              <li><img src="pics/icon_white.png"></li>
              <li><a target="_blank" href="pdf/blux2019.pdf"><img src="pics/icon_pdf.png"></a></li>
              <li><a target="_blank" href="talks/blux2019_web.pdf"><img src="pics/icon_slides.png"></a></li>
              <li><a target="_blank" href="http://www.beneluxmeeting.nl/2019/"><img src="pics/icon_doi.png"></a></li>
            </ul>
          </div>
        </li>
      
        <!-- Chemnitz2018 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Curve fitting on manifolds with Bézier and blended curves</span>
							<div><span class="paperJournal">Seminar at Research Group "Numerical Mathematics (Partial Differential Equations)", from TU Chemnitz</span>, Chemnitz, Germany. Jul. 18, 2018.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/chemnitz2018_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a href="https://www.tu-chemnitz.de/mathematik/part_dgl/news.en.php" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
				</li>
				
				
				
				<!-- GSI2017 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Fast method to fit a $C^1$ piecewise-Bézier function to manifold-valued data points: how suboptimal is the curve obtained on the sphere $\mathbb S^2$?</span>
							<div><span class="paperJournal">GSI2015</span>, Paris, France. Nov. 7, 2017.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T14').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/gsi2017.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="talks/gsi2017_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a href="https://www.see.asso.fr/gsi2017" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T14">
						We propose an analysis of the quality of the fitting method proposed in [<a href="https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2017-77.pdf" target="_blank">7</a>].
						This method fits smooth paths to manifold-valued data points using $C^1$ piecewise-B ́ezier functions. 
						This method is based on the principle of minimizing an objective function composed of a data-attachment term and a regularization term chosen as the mean squared
						acceleration of the path. However, the method strikes a tradeoff between speed and accuracy by following a strategy that is guaranteed to yield
						the optimal curve only when the manifold is linear. 
						In this paper, we focus on the sphere $S^2$. 
						We compare the quality of the path returned by the algorithms from [<a href="https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2017-77.pdf" target="_blank">7</a>] 
						with the path obtained by minimizing, over the same search space of $C^1$ piecewise-B́ezier curves, a finite-difference approximation of the objective 
						function by means of a derivative-free manifold-based optimization method.
					</p>
				</li>
				
				
				
				<!-- WIPS2017 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Wind field estimation via $C^1$ Bézier smoothing on manifolds</span>
							<div><span class="paperJournal">Workshop on "Regularized Inverse Problem Solving and High-Dimensional Learning Methods" (WIPS)</span>, Louvain-la-Neuve, Belgium. Aug. 30, 2017.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T13').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/wips2017_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a href="https://sites.google.com/view/wips-learn/programme" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T13">
						Unmanned aerial vehicle control is a hot topic in research and at the crossroad of a lot of disciplines. For instance, safe and reliable navigation of UAVs requires consideration of the surrounding environment, in particular, the external wind conditions. This external wind configuration is usually evaluated by computationnaly expensive efforts and depends on external meteorological parameters. Hopefully, it can be modelled as a Gaussian process characterized by a covariance matrix belonging to the space of PSD matrices of rank r. In this work, we both expoit the manifold structure of this specific space and also propose a method to fit a small set of pre-computed solutions. That way, for a new value of the external meteorological parameters, we are able to recover a sufficiently accurate wind field configuration in a computationnaly tractable effort. Our method is based on manifold-valued Bezier curves. Joint work with <a target="_blank" href="https://perso.uclouvain.be/estelle.massart/">E.M. Massart</a>, A. Musolas, <a target="_blank" href="https://sites.uclouvain.be/absil/">P.-A. Absil</a>, <a target="_blank" href="https://perso.uclouvain.be/julien.hendrickx/">J.M. Hendrickx</a>, <a target="_blank" href="https://perso.uclouvain.be/laurent.jacques/">L. Jacques</a> and <a target="_blank" href="https://aeroastro.mit.edu/youssef-marzouk">Y. Marzouk</a>.
					</p>
				</li>
				
				
				
				
				<!-- ESANN2017 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Wind field estimation via $C^1$ Bézier smoothing on manifolds</span>
							<div><span class="paperJournal">ESANN2017</span>, Bruges, Belgium. Apr. 27, 2017.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T12').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/esann2017.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="talks/esann2017_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a href="https://www.elen.ucl.ac.be/esann/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T12">
						We propose an algorithm for fitting $C^1$ piecewise-Bézier curves to (possibly corrupted) data points on manifolds.
						The curve is chosen as a compromise between proximity to data points and regularity.
						We apply our algorithm as an example to fit a curve to a set of low-rank covariance matrices, a task arising in wind field modeling.
						We show that our algorithm has denoising abilities for this application.
					</p>
				</li>
				
				
				<!-- Benelux2017 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Wind field estimation via $C^1$ Bézier smoothing on manifolds</span>
							<div><span class="paperJournal">Benelux Meeting 2017</span>, Spa, Belgium. Mar. 28, 2017.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="pdf/blux2017.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="talks/blux2017_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a target="_blank" href="http://www.beneluxmeeting.nl/2017/"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
				</li>
				
				
				<!-- ISPS2017 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation and fitting on manifolds with differentiable piecewise-Bézier functions</span>
							<div><span class="paperJournal">ISP Group</span>, Louvain-la-Neuve, Belgium. Mar. 16, 2017.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T10').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/isps2017_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a target="_blank" href="https://sites.uclouvain.be/ispgroup/ISPS/HomePage"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T10">
						Fitting and interpolation are well known topics on the Euclidean space. However, when it turns out that the data points are manifold valued (understand: when the data point belongs to a certain manifold), most of the algorithms are no more applicable because even the notion of distance is not as simple as on the Euclidean space.
					<br/><br/>
						Manifold-valued data appear in various domains as MRI acquisition (diffusion tensors, segmented shapes,...), fluid mechanics (SDP matrices or values on the Grassmann manifold), matrix completion and many more. A particular example concern the representation of local wind fields in a given domain. These can be expressed as covariance matrices which are SDP and of fixed (small) rank. The wind field changes when the prevalent wind has different orientation or magnitude. The computation of this wind field, however, resort in solving complicated and time-consuming PDEs in fluid mechanics. In order to obtain approached solutions as fast as possible, a solution is to compute several wind field covariance matrices representations for a set of given orientation/magnitude of the prevalent wind and then interpolate (or fit) a manifold-valued curve in the space of fixed rand SDP matrices.
					<br/><br/>
						In this talk, I will propose a method to fit manifold-valued data points based on a generalization of Bezier curves. This method is motivated by (but not specific to) the wind field orientation problem. I will try to introduce the concepts of manifolds and Bezier curves as a tutorial to finally show interesting results for that specific application.



					</p>
				</li>
				
				
				
				
				<!-- Floride2017 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation and fitting on manifolds with differentiable piecewise-Bézier functions</span>
							<div><span class="paperJournal">Anuj Srivastava's working group meeting</span>, Skype presentation, Tallahassee, Florida, USA. Mar. 10, 2017.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/srivastava2017_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a target="_blank" href="https://ani.stat.fsu.edu/~anuj/"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
				</li>
				
				
				
				
				<!-- GAMM2017 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Differentiable Bézier interpolation on manifolds with B-splines</span>
							<div><span class="paperJournal">GAMM 2017</span>, Weimar, Germany. Mar. 6, 2017.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="pdf/gamm2017.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="talks/gamm2017_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a target="_blank" href="https://jahrestagung.gamm-ev.de/index.php/2017/annual-meeting-2017"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
				</li>
				
				
				
				<!-- MVIP2016 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation and fitting on manifolds with differentiable piecewise-Bézier functions</span>
							<div><span class="paperJournal">Workshop on Manifold-Valued Image Processing (MVIP) 2016</span>, Kaiserslautern, Germany. Dec. 2, 2016.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/mvip2016_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
						</ul>
					</div>
				</li>
				
				
				<!-- Benelux2016 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation on manifolds with differentiable surfaces of Bézier</span>
							<div><span class="paperJournal">Benelux Meeting 2016</span>, Soesterberg, The Netherlands. Mar. 24, 2016.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="pdf/blux2016.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="talks/blux2016_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a target="_blank" href="http://www.beneluxmeeting.nl/2016/"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
				</li>
				
				
				
				
				<!-- ASCII2015 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Bézier interpolation on Riemannian manifolds</span>
							<div><span class="paperJournal">ASCII Tutorial Seminars</span>, Louvain-la-Neuve, Belgium. Nov. 27, 2015.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T05').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/ascii2015_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T05">
						Mani-what you say?
						Manifolds are mathematical sets with a smooth geometry (such as spheres) used in applications like model reduction, optimization and many more.
						What do manifold-valued objects look like? 
						Can we interpolate them? 
						Is it costly? 
						With Bézier functions, interpolation on manifolds becomes very easy.
						Bézier? You should remember this from your bachelor, isn't it?
						From a very few concepts and drawings, a variety of possibilities is open.
					</p>
				</li>
				
				
				
				
				<!-- GSI2015 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Endometriosis: MRI navigation and surface reconstruction on manifolds</span>
							<div><span class="paperJournal">GSI2015</span>, Paris, France. Oct. 30, 2015.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T04').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/gsi2015.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="talks/gsi2015_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a href="https://www.see.asso.fr/gsi2015" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T04">
						We present a new method to fit smooth paths to a given set of points on Riemannian manifolds using $C^1$ piecewise-Bézier functions. 
						A property of the method is that, when the manifold reduces to a Euclidean space, the control points minimize the mean square acceleration of the path. 
						As an application, we focus on data observations that evolve on certain nonlinear manifolds of importance in medical imaging: 
						the shape manifold for endometrial surface reconstruction; the special orthogonal group $SO(3)$ and the special Euclidean group $SE(3)$ 
						for preoperative MRI-based navigation. 
						Results on real data show that our method succeeds in meeting the clinical goal: combining different modalities to improve the localization of the endometrial lesions.
					</p>
				</li>
				
						
				
				
				
				<!-- One Day 2015 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">How to design interpolating surfaces on manifolds?</span>
							<div><span class="paperJournal">One-Day Workshop on manifolds optimization</span>, Louvain-la-Neuve, Belgium. Sep. 25, 2015.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/oneday2015_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
						</ul>
					</div>
				</li>
				
				
				
				
				<!-- GDR MIA 2014 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation on Riemannian manifolds with a $C^1$ piecewize-Bézier path.</span>
							<div><span class="paperJournal">GDR MIA 2014</span>, Paris, France. Nov. 21, 2014.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="pdf/gdrmia2014.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="talks/gdrmia2014_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
						</ul>
					</div>
				</li>
				
				
				
				<!-- ISPS -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation on Riemannian manifolds with a $C^1$ piecewize-Bézier path.</span>
							<div><span class="paperJournal">ISP Group</span>, Louvain-la-Neuve, Belgium. Oct. 8, 2014.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_T01').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="talks/isps2014_web.pdf"><img src="pics/icon_slides.png"></a></li>
							<li><a href="https://sites.uclouvain.be/ispgroup/ISPS/HomePage" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_T01">
						Nowadays, more and more problems are solved through specific manifold formulation. This often allows important reduction of computation time and/or memory management compared to classical formulations on the classical Euclidean space (because of non-linear constraints like restricting the solutions to a certain subdomain of a larger ambiant space). Interpolation and optimization tools can be useful for solving some of these problems (like defining the optimal trajectory of a humanitory plane dropping supplies, or fitting two objects orientations). However, current procedures are only defined on the Euclidean space. In this presentation, I focus on interpolation methods and, more precisely, I propose a new general framework to fit a path through a finite set of data points lying on a Riemannian manifold. The path takes the form of a continuously-differentiable concatenation of Riemannian Bézier segments. This framework will be illustrated by results on the Euclidean space, the sphere, the orthogonal group and the shape manifold.​ The content of this presentation meets also very recent research carried out in this institute for providing novel efficient manifold-based optimization methods.
					</p>
				</li>
			</ul>
			
			
			
			
			
			<p class="subtitle">
				<img style="padding-right: 10px;" height="20px" src="pics/icon_poster.png"> Posters
			</p>
      <ul class="papers">
				<!-- ESANN2019 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation on the manifold of fixed-rank positive-semidefinite matrices for parametric model order reduction: preliminary results.</span>
							<div><span class="paperJournal">Conference ESANN 2019</span>, Bruges, Belgium, 2019.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_P06').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/esann2019.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="posters/esann2019.pdf"><img src="pics/icon_poster.png"></a></li>
							<li><a href="https://www.elen.ucl.ac.be/esann/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_P06">
						We present several interpolation schemes on the manifold of fixed-rank positive-semidefinite (PSD) matrices.
						We explain how these techniques can be used for model order reduction of parameterized linear dynamical systems, 
						and obtain preliminary results on an application.
					</p>
				</li>
      
      
      
      
				<!-- iTwist2018 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Blended smoothing splines on Riemannian manifolds.</span>
							<div><span class="paperJournal">Conference iTwist 2018</span>, Marseille, France, 2018.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_P05').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/itwist2018.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="posters/itwist2018.pdf"><img src="pics/icon_poster.png"></a></li>
							<li><a href="https://arxiv.org/html/1812.00648" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_P05">
						We present a method to compute a fitting curve $B$ to a set of data points $d_0,\dots, d_m$ lying on a manifold $\mathcal M$. 
						That curve is obtained by blending together Euclidean Bézier curves obtained on different tangent spaces. 
						The method guarantees several properties among which $B$ is $C^1$ and is the natural cubic smoothing spline when $\mathcal M$ is the Euclidean space. 
						We show examples on the sphere $S^2$ as a proof of concept.
					</p>
				</li>
				
				
				
				
				<!-- Gimli2018 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Data fitting on manifolds with blended cubic splines.</span>
							<div><span class="paperJournal">ICML2018, workshop GiMLi</span>, Stockholm, Sweden, 2018.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="pdf/gimli2018.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="posters/gimli2018.pdf"><img src="pics/icon_poster.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
						</ul>
					</div>
				</li>
				
				
				
				<!-- iTwist2016 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Interpolation on manifolds using Bézier functions.</span>
							<div><span class="paperJournal">Conference iTwist 2018</span>, Aalborg, Denmark, 2016.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_P03').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/itwist2016.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="posters/itwist2016.pdf"><img src="pics/icon_poster.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_P03">
						Given a set of data points lying on a smooth manifold, we present methods to interpolate those with piecewise Bézier splines. 
						The spline is composed of Bézier curves (resp. surfaces) patched together such that the spline is continuous and differentiable at any point of its domain. 
						The spline is optimized such that its mean square acceleration is minimized when the manifold is the Euclidean space. 
						We show examples on the sphere $S^2$ and on the special orthogonal group $SO(3)$.
					</p>
				</li>
				
				
				<!-- ESANN2016 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Differentiable piecewise-Bézier interpolation on Riemannian manifolds.</span>
							<div><span class="paperJournal">Conference ESANN2016</span>, Bruges, Belgium, 2016.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_P02').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/esann2016.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="posters/esann2016.pdf"><img src="pics/icon_poster.png"></a></li>
							<li><a href="https://www.elen.ucl.ac.be/esann/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_P02">
						We propose a generalization of classical Euclidean piecewise-Bézier surfaces to manifolds, and we use this generalization to compute
						a $C^1$-surface interpolating a given set of manifold-valued data points associated to a regular 2D grid. 
						We then propose an efficient algorithm to compute the control points defining the surface based on the Euclidean concept of natural $C^2$-splines 
						and show examples on different manifolds.
					</p>
				</li>
				
				
				
				<!-- DyscoDay2014 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Piecewise-Bézier $C^1$ interpolation on Riemannian manifolds with application to 2D shape morphing.</span>
							<div><span class="paperJournal">Dysco Day</span>, Gent, Belgium, 2014.</div>
						</div>
						<ul class="icons">
							<li><img src="pics/icon_white.png"></li>
							<li><img src="pics/icon_white.png"></li>
							<li><a target="_blank" href="posters/pai2014.pdf"><img src="pics/icon_poster.png"></a></li>
							<li><img src="pics/icon_white.png"></li>
						</ul>
					</div>
				</li>
				
				
				
				<!-- ICPR2014 -->
				<li>
					<div class="paperEntry">
						<div class="talk">
							<span class="paperTitle">Piecewise-Bézier $C^1$ interpolation on Riemannian manifolds with application to 2D shape morphing.</span>
							<div><span class="paperJournal">International Conference on Pattern Recognition (ICPR)</span>, pp. 4086-4091, 2014.</div>
						</div>
						<ul class="icons">
							<li><a class="more" onclick="$('#abs_P00').slideToggle(400);"><img src="pics/icon_abstract.png"></a></li>
							<li><a target="_blank" href="pdf/icpr2014.pdf"><img src="pics/icon_pdf.png"></a></li>
							<li><a target="_blank" href="posters/icpr2014.pdf"><img src="pics/icon_poster.png"></a></li>
							<li><a href="https://iapr.org/archives/icpr2014/" target="_blank"><img src="pics/icon_doi.png"></a></li>
						</ul>
					</div>
					<p class="paperAbstract" id="abs_P00">
						We present a new framework to fit a path to a given finite set 
            of data points on a Riemannian manifold. The path takes the 
            form of a continuously-differentiable concatenation of Riemannian 
            Bézier segments. The selection of the control points that define 
            the Bézier segments is partly guided by the differentiability 
            requirement and by a minimal mean squared acceleration objective. 
            We illustrate our approach on specific manifolds: 
            the Euclidean plane (for sanity check), the sphere (as a first 
            nonlinear illustration), the special orthogonal group (with 
            rigid body motion applications), and the shape manifold (with 
            2D shape morphing applications).
					</p>
				</li>
				
			</ul>
		</article> <!-- corps -->
	</section>
</div><!-- Publications -->