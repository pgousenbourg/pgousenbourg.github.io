<div style="display: none" id="nt-bezier-surfaces">
			<h2 class="code">The code</h2>
				<p>Here is the code for interpolating data with a 2d-Bézier spline.</p>

<pre class="codeinput"><span class="comment">% Some random data points.</span>
m = 6; n = 7;
data = cell(m,n);
<span class="keyword">for</span> i=1:m
<span class="keyword">for</span> j=1:n
  data{i,j} = [i-1,j-1,randn(1)];
<span class="keyword">end</span>
<span class="keyword">end</span>

<span class="comment">% Some useful information...</span>
manifold = <span class="string">'euclidean'</span>;
set_path
global_variables
geo_functions

<span class="comment">% Create the problem structure.</span>
problem  = prepare_structure(data,manifold,10);

<span class="comment">% Phase 1: Control points generation.</span>
problem = control_points_simple_generation_2d(problem);

<span class="comment">% Phase 2: Reconstruction of the curve.</span>
problem = curve_reconstruction_double_bezier_c1(problem,1); <span class="comment">% horizontal-vertical</span>

<span class="comment">% Plotting</span>
figure;
draw_bezier_surface(problem);
title([<span class="string">'Bezier surface with method: '</span>,problem.method,<span class="string">'.'</span>]);</pre>

				<p>Okay, let's dig a bit into that...</p>
				


			<h2 class="code">Data points</h2>
				<p>As mentionned, the data points must be stored in a 2d-cell. Let's construct a random set of data points where the (x,y)-values correspond to (m,n) and the z-value is random.</p>
				<p>Hint: You may also call <code>data_points_2d(manifold,type)</code> to create some predefined test sets.</p>
				

<pre class="codeinput">m = 6; n = 7;
data = cell(m,n);
<span class="keyword">for</span> i=1:m
<span class="keyword">for</span> j=1:n
  data{i,j} = [i-1,j-1,randn(1)];
<span class="keyword">end</span>
<span class="keyword">end</span></pre>
				
			<h2 class="code">Problem structure preparation</h2>
				<p>The system is based on a structure called successively by different subfunctions in matlab. Each subfunction will use elements of differential geometry (the exponential, the logarithm, the distance, etc.). This is why this preparation step is crucial in order to inform the computer on the paths needed (the script set_path depends on the manifold) and on the elements of differential geometry available for the code (global_variables and geo_functions depend on the manifold).</p>
				
<pre class="codeinput">manifold = <span class="string">'euclidean'</span>;

<span class="comment">% define the paths where the manifold-tools are stored</span>
set_path
<span class="comment">% define the global variables, i.e. the elements of differential geometry.</span>
global_variables
geo_functions</pre>
				
				<p>Create the problem structure.</p>
				
<pre class="codeinput"><span class="comment">% the structure stored the name of the manifold, the data points and the discretization of the surface when reconstructed.</span>
problem  = prepare_structure(data,manifold,10);</pre>
				
				<p>The structure should look like</p>
				
<pre class="codeoutput">problem = 				
interp: {6x7 cell}
type: ''
manifold: 'euclidean'
   n: 6
   m: 7
dim1: 1
dim2: 3
   d: []
   t: 10
nint: 0</pre>
			
			
			<h2 class="code">Bézier spline optimization and reconstruction</h2>
				<p>The interpolation problem works in two steps: </p>
				<ol>
					<li>find the control points leading the Bézier curve</li>
					<li>reconstruct the actual spline.</li>
				</ol>
				
			
			<h3 class="code">Phase 1: Control points generation</h3>
				<p>The subfunction takes the structure as entry and will update it by adding the computed control points.</p>
				
<pre class="codeinput">problem = control_points_simple_generation_2d(problem);</pre>
				
				<p>There exist different methods to compute the control points:</p>
				<ul>
					<li>
						<code>control_points_generation(problem)</code>: By an exact technique minimizing the Euclidean acceleration of the path. Warning, this technique is costly in time when the log and exp are not trivial. The technique is documented in the <a href="http://sites.uclouvain.be/absil/2015.10">technical report of 2015</a>.
					</li>
					<li>
						<code>control_points_simple_generation_2d(problem)</code> With an efficient but not perfect algorithm based on the B-spline representation of curves generalized to surfaces. This technique is documented in <a href="#research">ESANN2016</a>
					</li>
					<li>
						<code>control_points_double_tensorization(problem)</code> With the same efficient algorithm but applied to 1D curves horizontally and then vertically. The technique is also documented in <a href="#research">ESANN2016</a>
					</li>
				</ul>
				<p>In the Euclidean space, all these techniques are identical.</p>
				
			<h3 class="code">Phase 2: Reconstruction of the curve</h3>
				<p>Here also, the subfunction takes the structure as entry and will update it by adding the computed spline. If the structure does not contain the control points, the reconstruction is not possible.</p>
<pre class="codeinput">problem = curve_reconstruction_double_bezier_c1(problem,1); <span class="comment">% horizontal-vertical</span></pre>

				<p>There also exist different techniques to reconstruct the Bézier spline. The following ones return a C^1 surface. They are documented in <a href="http://sites.uclouvain.be/absil/2015.10">technical report of 2015</a>.</p>
				<ul>
					<li>
						<code>curve_reconstruction_mean_all_c1(problem)</code> uses the altered defintion of Bezier surfaces based on averaging of all control points of the patch.
					</li>
					<li>
						<code>curve_reconstruction_double_bezier_c1(problem,k)</code> uses the altered definition of Bezier curves horizontal-vertical (k=1) or vertical-horizontal (k=2) depending on the argument.
					</li>
				</ul>	
				<p>The two following ones return a C^0 surface and their limits are also discussed in the <a href="http://sites.uclouvain.be/absil/2015.10">technical report of 2015</a>.</p>
				
				<ul>
					<li>
						<code>curve_reconstruction_mean_all(problem)</code> uses the basic definition of Bezier surfaces based on averaging of all the points of the patch.
					</li>
					<li>
						<code>curve_reconstruction_double_bezier(problem,k)</code> uses the basic definition of Bezier curves horizontal-vertical (1) or vertical-horizontal (2) depending on the argument.
					</li>
				</ul>
			
			<h2 class="code">Plotting</h2>
				<p>We propose a method to plot the solution. The plotting method is chosen based on the manifold and on the paths set at the beginning.</p>
<pre class="codeinput">figure;
draw_bezier_surface(problem);
title([<span class="string">'Bezier surface with method: '</span>,problem.method,<span class="string">'.'</span>]);
</pre>
				<p><img src="pics/nt_eucl_2d_surface.png" class="rounded-pic" width=100%/></p>
		</div>
