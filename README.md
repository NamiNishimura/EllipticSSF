# EllipticSSF

Mathematica notebook developed by Nami Nishimura  

### How to use 

Change the values for the resolution n, spin parameter a, radial distance of the point particle r0, domain of r* and m-mode. 

### Our Thoretical Model 

Point particle carrying scalar cahrge q and moving around a massive Kerr black hole. 

This Mathematica code calculates the scalar self force in Kerr spacetime via Elliptic PDEs by ... 
- Removing singular part of MP with analytically given puncture function by locally expanding it near the worldline 
- Separating phi variable using m-mode decomposition by taking advantage of symmetry under rotation around a spin axis 
- Separating t variable with a Fourier series by leveraging the periodicity of the source
- Applying finite difference approximation scheme to discretization considering grid of points in r-theta plane
- Reconstructing the self-force using standard mode-sum regularization 

# EffectiveSource 

Calculate Effective Source by using analytically given puncture field 
