Mathematica notebooks developed by Nami Nishimura  

### How to use 
Change the values for the resolution n, spin parameter a, radial distance of the point particle r0, domain of r* and m-mode. 

EffectiveSource code provides you with the numerical values of the effective source. 

EllipticSSF code provides you with the numerical values of radial and angular component of the scalar self-force. 

# EllipticSSF
Mathematica code calculates the scalar self force in Kerr spacetime via Elliptic PDEs

### Our Thoretical Model and Method
A point particle carrying scalar cahrge q and moving around a massive Kerr black hole. 

We culculate the scalar-self force by ...  

- Removing singular part of MP with analytically given puncture function by locally expanding it near the worldline
- Separating phi variable using m-mode decomposition by taking advantage of symmetry under rotation around a spin axis 
- Separating t variable with a Fourier series by leveraging the periodicity of the source
- Applying finite difference approximation scheme to discretization considering grid of points in r-theta plane
- Reconstructing the self-force using standard mode-sum regularization 


# EffectiveSource 
Mathematica notebook to compute the effective source. 

### Method 
- Locally expand the singular field with 4th Taylor expansion in order to gain finite and continuous puncture field 
- Take inverse form of Fourier transform to obtain m-mode of the puncture field
