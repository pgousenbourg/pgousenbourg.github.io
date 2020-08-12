<div style="display: none" id="nt-interp_hybrid_curves">
			<h2 class="code">The code</h2>
				<p>Here is the code for interpolating data with a hybrid composite Bézier curve on the sphere.</p>

<pre class="codeinput"><span class="comment">% Add the paths for manopt and for the tools</span>
cd manopt;
addpath(genpath(pwd));
cd ..;
addpath(genpath([pwd,'/tools']));
	
<span class="comment">% Some data points on the sphere.</span>
phi     = [pi/3 ; 4*pi/7 ; 4*pi/7 ; pi/3] - 2*pi/12; 
theta   = [pi/2 ; pi/4 ; 3*pi/4 ; pi/2] + 10*pi/12;
x       = cos(theta).*sin(phi); y = sin(theta).*sin(phi); z = cos(phi);
points  = [x y z];
data    = reshape(points',1,3,4);

<span class="comment">% Problem parameters</span>
n = size(data,3);
t = linspace(0,n-1,100);

<span class="comment">% Structure creation</span>
problem.M = spherefactory(3);
problem.data = data;

<span class="comment">% Phase 1: Control points generation.</span>
problem.control = cp_arnould(problem);

<span class="comment">% Phase 2: Reconstruction of the curve.</span>
problem = bezier_reconstruction(problem,t);

<span class="comment">% Optional: velocity and acceleration computation.</span>
problem.velocity = bezier_velocity(problem,t);
problem.acceleration = bezier_acceleration(problem,t);
	
<span class="comment">% Plotting</span>
y = squeeze(problem.curve)'; b = squeeze(problem.control)'; p = squeeze(problem.data)';	
a = problem.acceleration; v = problem.velocity;

[X,Y,Z] = sphere(); 
figure;
subplot(2,2,[1 3]); surf(0.95*X,0.95*Y,0.95*Z,...
    <span class="string">'FaceAlpha'</span>,0.7,<span class="string">'EdgeAlpha'</span>,1,...
    <span class="string">'FaceColor'</span>, [238 197 145]/255);
  hold on;
  plot3(y(:,1),y(:,2),y(:,3),<span class="string">'b'</span>,<span class="string">'LineWidth'</span>,2);
  plot3(b(:,1),b(:,2),b(:,3),<span class="string">'.'</span>,<span class="string">'Color'</span>,[0 0.7 0],<span class="string">'Markersize'</span>,30);
  plot3(p(:,1),p(:,2),p(:,3),<span class="string">'.r'</span>,<span class="string">'Markersize'</span>,30);
  title(<span class="string">'Bezier spline'</span>);
subplot(222); plot(t(2:end-1),v,<span class="string">'-b'</span>,<span class="string">'LineWidth'</span>,2); title(<span class="string">'velocity'</span>);
subplot(224); plot(t(2:end-1),a,<span class="string">'-b'</span>,<span class="string">'LineWidth'</span>,2); title(<span class="string">'acceleration'</span>);</pre>

				<p>Okay, let's dig a bit into that...</p>
				


			<h2 class="code">Data points</h2>
				<p>The data points must be stored in a (l,c,n) matrix, where (l,c) is the matrix size of the embedded space. Here, for the sphere, it would be (1,3), as $\mathbb{S}^2$ is embedded in $\mathbb{R}^3$. The points here are draw a triangle on the sphere, and the first and last points coincide.</p>
				<p>Hint: You may also call <code>data_points(manifold,type)</code> to create some predefined test sets. Do not forget to add the path to it (<code>addpath([pwd,'/data_points']);</code>).</p>

<pre class="codeinput"><span class="comment">% Some data points on the sphere.</span>
phi     = [pi/3 ; 4*pi/7 ; 4*pi/7 ; pi/3] - 2*pi/12; 
theta   = [pi/2 ; pi/4 ; 3*pi/4 ; pi/2] + 10*pi/12;
x       = cos(theta).*sin(phi); y = sin(theta).*sin(phi); z = cos(phi);
points  = [x y z];
data    = reshape(points',1,3,4);</pre>
				
			<h2 class="code">Problem structure preparation</h2>
				<p>The system is based on a structure called successively by different subfunctions in matlab. Each subfunction will use the elements of differential geometry (the exponential, the logarithm, the distance, etc.) extracted from Manopt and stored in that structure. The names of the different elements of the structure will be very important as they are used by the rest of the code later on.</p>
				
				<p>We prepare first the time parameter <code>t</code> to be able, later on, to compute the reconstruction spline. Typically, it is a discretization of the domain (here $t \in [0,3]$).</p>
				
<pre class="codeinput"><span class="comment">% Problem parameters</span>
n = size(data,3);
t = linspace(0,n-1,100);</pre>
				
				<p>Now, we store the crucial information in a structure.</p>
				
<pre class="codeinput"><span class="comment">% Structure creation</span>
problem.M = spherefactory(3);
problem.data = data;</pre>
				
				<p>The structure <code>problem</code> is supposed to be at the end composed of the following elements (in this specific problem):</p>
				
<pre class="codeoutput">problem = 				
            data: [1×3×4 double]
               M: [1×1 struct]
         control: [1×3×8 double]
           curve: [1×3×100 double]
        velocity: [98×1 double]
    acceleration: [98×1 double]
</pre>
				
				<p>The data points are stored in the field <code>data</code>, the control points in <code>control</code>, the curve in <code>curve</code> and the manifold in <code>M</code>. It is important to respect these four names. The other names have less importance.</p>
			
			
			<h2 class="code">Bézier curve optimization and reconstruction</h2>
				<p>The interpolation problem works in two steps: </p>
				<ol>
					<li>find the control points leading the Bézier curve</li>
					<li>reconstruct the actual spline.</li>
				</ol>
				
			
			<h3 class="code">Phase 1: Control points generation</h3>
				<p>The subfunction takes the structure as entry and will return the control points. Store it in the structure for reconstruction.</p>
				
<pre class="codeinput">problem.control = cp_arnould(problem);</pre>
				
				<p>There exist different methods to compute the control points:</p>
				<ul>
					<li>
						<code>cp_arnould(problem)</code>: technique proposed in the paper <a href="#research">Arnould et al. 2015</a>. This technique is recommended.
					</li>
					<li>
						<code>cp_gousenbourger(problem)</code>: suboptimal technique proposed in the paper <a href="#research">Gousenbourger et al. 2014</a>, where the velocity vectors must be specified in the beginning of the method. It works but... well, there is better, so why not using it ? ;-).
					</li>
				</ul>
				
			<h3 class="code">Phase 2: Reconstruction of the curve</h3>
				<p>Here also, the subfunction takes the structure as entry and will update it by adding the computed spline. If the structure does not contain the field <code>control</code>, filled with the control points returned by the control points generation method, the reconstruction is not possible.</p>
<pre class="codeinput">problem = bezier_reconstruction(problem,t);</pre>

				<p>The method is a simple De Casteljau algorithm adapted to compute a hybrid composite Bézier curve.</p>
			
			<h2 class="code">Optional phase: Acceleration and velocity of the curve</h2>
				<p>Once the curve is reconstructed, we offer a generic code to evaluate the velocity and the acceleration of the curve. Just use the following piece of code:</p>
<pre class="codeinput">a = bezier_velocity(problem,t);
v = bezier_acceleration(problem,t);</pre>
				
				<p>Be sure that the field <code>curve</code> is available in the structure <code>problem</code>.</p>


				<p>The rest is just plotting the curve on a sphere. Try it :-) !</p>

				<p><img src="pics/nt_sphere_hybrid_interp.png" class="rounded-pic" width=100%/></p>
		</div>
