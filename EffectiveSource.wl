(* ::Package:: *)

(*Calculating Effective Source by using analytically given "puncture scalar field" *)
(*Author: Nami Nishimura *)


(*You can change those values to try different mode m, spin parameter a, mass M, and resolutions. *)

m=2; (* mode m *)
n=23; (* resolution *)
rminapp=-20;(*approximate value for the r^* minimum *)
rmaxapp=250;(*approximate value for the r^* maximum  *)
q=1; (* sclar charge *)
d=3.6; (*width of the worldtube *)
a=0.0; (* spin parameter *)
M=1; (* mass of the central black hole *)
r0=10.0;(* location of the worldline *)
v=1/Sqrt[r0];(* particle's angular velocity *)
\[CapitalOmega]=v^3/(1+a v^3);(* particle's angular frequency *)



(*Solving m-mode scalar wave operator *)

(*Here, I'm solving a m-mode scalar wave operator by using finite difference approximation. 
The coefficient of Subscript[\[Psi], i,j], Subscript[\[Psi], i+1,j], Subscript[\[Psi], i-1, j], Subscript[\[Psi], i,j+1]  and Subscript[\[Psi], i,j-1] are calculated (which are controlled by the parameter "A" inside this function) 
Function below was re-implemented for package friendliness *)

getfxyCoeff[r_, \[Theta]_, A_, \[CapitalDelta]rstar_, \[CapitalDelta]\[Theta]_, m_] :=Module[ {M},
    M = 1;
    Return[
      If[A == 1,
        (a^2 m^2 r^2 (a^2 + r (-2 M + r)) \[CapitalDelta]rstar^2 \[CapitalDelta]\[Theta]^2 \[CapitalOmega]^2 + (2 r^2 
          (a^2 + r (-2 M + r)) \[CapitalDelta]rstar^2 + 2 (r^2 (a^2 + r^2)^2 - (a^2 - I a m r
           - M r) (a^2 + r (-2 M + r)) \[CapitalDelta]rstar^2) \[CapitalDelta]\[Theta]^2 + 4 a m^2 M r^3 \[CapitalDelta]rstar^2 
          \[CapitalDelta]\[Theta]^2 \[CapitalOmega] - m^2 r^2 (a^2 + r^2)^2 \[CapitalDelta]rstar^2 \[CapitalDelta]\[Theta]^2 \[CapitalOmega]^2) Csc[\[Theta]]^2 + m^2 r^2 
          (a^2 + r (-2 M + r)) \[CapitalDelta]rstar^2 \[CapitalDelta]\[Theta]^2 Csc[\[Theta]]^4) / (r^2 \[CapitalDelta]rstar^2 \[CapitalDelta]\[Theta]^2 (-a
          ^2 (a^2 + r (-2 M + r)) + (a^2 + r^2)^2 Csc[\[Theta]]^2))
        ,
        If[A == 2,
          (-r (a^2 + r^2)^2 + a (a^3 - I a^2 m r - I m r^3 + a r (-2 
            M + r)) \[CapitalDelta]rstar) / (r \[CapitalDelta]rstar^2 ((a^2 + r^2)^2 - a^2 (a^2 + r (-2 M + r
            )) Sin[\[Theta]]^2))
          ,
          If[A == 3,
            -(r (a^2 + r^2)^2 + a (a^3 - I a^2 m r - I m r^3 + a r (-
              2 M + r)) \[CapitalDelta]rstar) / (r \[CapitalDelta]rstar^2 ((a^2 + r^2)^2 - a^2 (a^2 + r (-2 M +
               r)) Sin[\[Theta]]^2))
            ,
            If[A == 4,
              (a^2 + r (-2 M + r)) (2 + \[CapitalDelta]\[Theta] Cot[\[Theta]]) / (2 \[CapitalDelta]\[Theta]^2 (-(a^2 +
                 r^2)^2 + a^2 (a^2 + r (-2 M + r)) Sin[\[Theta]]^2))
              ,
              -(a^2 + r (-2 M + r)) (-2 + \[CapitalDelta]\[Theta] Cot[\[Theta]]) / (2 \[CapitalDelta]\[Theta]^2 (-(a^2
                 + r^2)^2 + a^2 (a^2 + r (-2 M + r)) Sin[\[Theta]]^2))
            ]
          ]
        ]
      ]
    ]
  ]
  
  
  

(*This is the original function *)

(*getfxyCoeff[r_,\[Theta]_,A_,\[CapitalDelta]rstar_,\[CapitalDelta]\[Theta]_,m_]:=Module[{\[CapitalDelta],\[CapitalSigma]sq,box,\[Delta]t2,\[Delta]t,\[Delta]rstar,\[Delta]rstar2,\[Delta]\[Theta],\[Delta]\[Theta]2,none,fxy,fxyp,fxym,fxpy,fxmy,\[Omega],returnvalue},\[Omega]=m*\[CapitalOmega];\[CapitalDelta][r,\[Theta]]= r^2-2 M r +a^2;\[CapitalSigma]sq[r,\[Theta]]= (r^2+a^2)^2-a^2 ( r^2-2 M r +a^2) Sin[\[Theta]]^2;box[r,\[Theta]] = (\[Delta]t2+((4 \[ImaginaryI] a m M r)/\[CapitalSigma]sq[r,\[Theta]])\[Delta]t-((r^2+a^2)^2/\[CapitalSigma]sq[r,\[Theta]])\[Delta]rstar2-((2 \[ImaginaryI] a m r (r^2+a^2)-2a^2\[CapitalDelta])/(r \[CapitalSigma]sq[r,\[Theta]]))\[Delta]rstar-(\[CapitalDelta][r,\[Theta]]/\[CapitalSigma]sq[r,\[Theta]])\[Delta]\[Theta]2-(\[CapitalDelta][r,\[Theta]]/\[CapitalSigma]sq[r,\[Theta]]Cot[\[Theta]])\[Delta]\[Theta]-(\[CapitalDelta][r,\[Theta]]/\[CapitalSigma]sq[r,\[Theta]](-m^2/Sin[\[Theta]]^2-(2M)/r(1-a^2/(M r))-(2 \[ImaginaryI] a m )/r))none) ;(*getting rid of e^(-\[ImaginaryI] \[Omega] t)*)
\[Delta]t2=-\[Omega]^2Subscript[\[Psi], ij]; \[Delta]t=-\[ImaginaryI] \[Omega] Subscript[\[Psi], ij]; \[Delta]rstar2=(Subscript[\[Psi], ipj]-2Subscript[\[Psi], ij]+Subscript[\[Psi], imj])/\[CapitalDelta]rstar^2; \[Delta]rstar=(Subscript[\[Psi], ipj]-Subscript[\[Psi], imj])/(2 \[CapitalDelta]rstar); \[Delta]\[Theta]2=(Subscript[\[Psi], ijp]-2Subscript[\[Psi], ij]+Subscript[\[Psi], ijm])/\[CapitalDelta]\[Theta]^2; \[Delta]\[Theta]=(Subscript[\[Psi], ijp]-Subscript[\[Psi], ijm])/(2 \[CapitalDelta]\[Theta]);none = Subscript[\[Psi], ij]; 
fxy[r,\[Theta]]=Coefficient[box[r,\[Theta]],Subscript[\[Psi], ij]]//Simplify;fxpy[r,\[Theta]]=Coefficient[box[r,\[Theta]],Subscript[\[Psi], ipj]]//Simplify;
fxmy[r,\[Theta]]=Coefficient[box[r,\[Theta]],Subscript[\[Psi], imj]]//Simplify;fxyp[r,\[Theta]]=Coefficient[box[r,\[Theta]],Subscript[\[Psi], ijp]]//Simplify;
fxym[r,\[Theta]]=Coefficient[box[r,\[Theta]],Subscript[\[Psi], ijm]]//Simplify;returnvalue =If[A\[Equal]1,fxy[r,\[Theta]],If[A\[Equal]2,fxpy[r,\[Theta]],If[A\[Equal]3,fxmy[r,\[Theta]],If[A\[Equal]4,fxyp[r,\[Theta]],fxym[r,\[Theta]]]]]];returnvalue]*)


(*Here, I'm getting 4th order puncture field *)
\[CapitalPhi]4p[t_,r_,\[Theta]_,\[Phi]_]:=Module[{r0s,as,v,\[CapitalOmega],\[CapitalDelta]0s,us\[Phi],ut,ust,s002,s020,s200,s102,s120,s300,s220,s040,s004,s022,s202,s140,s320,s122,s500,s104,s302,\[Alpha]4,\[Alpha]5,\[Beta]5,s2,s3,s5,\[CapitalPhi]4p1,s400},r0s=r0/M;as=a/M;v=r0s^(-1/2);(*ok*)
\[CapitalOmega]=v^3/(M(1+as v^3)); \[CapitalDelta]0s=r0s^2-2 r0s+as^2;(*ok*)
us\[Phi]=1/(r0s Sqrt[r0s-3+2 as v]);ut=(v(r0s+as v))/Sqrt[r0s-3+2 as v];(*ok*)
ust=ut*M(*is it true?*); s002=\[CapitalDelta]0s ust^2;s020=r0s^2;s200=r0s^2/\[CapitalDelta]0s;(*ok*)
s102=(r0s-1)(ut)^2;s120=r0s;s300=(r0s(as^2-r0s))/\[CapitalDelta]0s^2;s220=-((r0s-3 as^2)/(6 \[CapitalDelta]0s));(*ok*)
s040=1/12 (3 as^2-r0s(r0s-2));s400=(2 as^2 r0s(1-6 r0s)+3 as^4+r0s^2 (8r0s-1))/(12 \[CapitalDelta]0s^3);(*ok*)
s004=(\[CapitalDelta]0s (ut)^2)/(12 r0s^4) (as v - r0s)(as(r0s-5) v^-1+2 as^2+r0s^2 (r0s+1));(*ok*)
s022=-(us\[Phi]^2/(6 r0s)) (as^4 (9 r0s+11) +2 as^3 v^-1 (r0s+1)(3 r0s-8)+as^2 r0s(3 r0s^3+10 r0s^2-3r0s+2)+2 as v^-5 (3 r0s^2-11 r0s+2)+r0s^4 (r0s-1)(3 r0s-2));(*ok*)
s202=us\[Phi]^4/(6 v^2 \[CapitalDelta]0s) (r0s-3+2 as v)(6 \[CapitalDelta]0s (as+v^-3)^2+as^4 (9 r0s+7)+2 as^3 v^-1 (3 r0s^2-7r0s-4)+as^2 r0s(r0s^2-1)(3 r0s+5)-14 as v^-5 (r0s-1)-r0s^4 (r0s-1));(*ok*)
s140=1/12 (1-r0s);s320=(as^2 (5-6r0s)+r0s^2)/(12 \[CapitalDelta]0s^2);s500=(as^4 (4-9r0s)+as^2 r0s(12 r0s^2-5 r0s+3)-r0s^2 (6r0s^2-2 r0s+1))/(12 \[CapitalDelta]0s^4);(*ok*)
s122=us\[Phi]^2/(12r0s^2) (as^4 (9r0s+29)-2 as^3 v^-1 (5r0s+16)+as^2 r0s(3r0s-17r0s^2+12)+2as r0s^3 v^-1 (11-6r0s)-2r0s^4 (3r0s^2+2 r0s-3));(*ok*)
s104=-(us\[Phi]^2/(12 r0s^4))(1+as v^3)(r0s^6 (r0s^2+4r0s-9)+as v^-9 (r0s^2-8r0s+9)+as^2 r0s^3 (8r0s^2+3r0s-21)-as^3 v^-3 (r0s+3)(6r0s-11)+as^4 r0s(3r0s^2+15r0s-10)-as^5 v^-1 (3r0s+19)+6as^6);(*ok*)
s302=us\[Phi]^4/(12 \[CapitalDelta]0s^2) (r0s-3+2 as v)(r0s^6 (r0s-1)-4\[CapitalDelta]0s r0s^4+as^2 r0s(4\[CapitalDelta]0s(3r0s^2-4r0s+5)-6r0s^5-7r0s^4+19r0s^3+6r0s^2-6r0s)-as^6 (3r0s+7)+2 as^5 v^-1 (r0s+4)-as^4 (23r0s^3-r0s^2-26r0s+12\[CapitalDelta]0s)+4as^3 v^-1 (2 \[CapitalDelta]0s-3r0s^4+10 r0s^3-8 r0s)+2 as v^-5 (8 \[CapitalDelta]0s+r0s(13r0s^2-22r0s+6-12\[CapitalDelta]0s)));(*ok*)
\[Alpha]4=-((M^2 us\[Phi]^2)/(6 \[CapitalDelta]0s^4 r0s^6))(\[CapitalDelta]0s r0s^4 \[Delta]rs^2+\[CapitalDelta]0s^2 r0s^4 \[Delta]\[Theta]^2+\[CapitalDelta]0s^2 r0s(as^2 (r0s+2)+r0s^3)(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]))(\[CapitalDelta]0s r0s^4 (2 as v^-1-3 as^2+3 r0s-2r0s^2)\[Delta]rs^2+\[CapitalDelta]0s^2 r0s^4 (-4 as v^-1+3 as^2+r0s^2)\[Delta]\[Theta]^2+\[CapitalDelta]0s^3 r0s (as+v^-3)^2 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]));(*ok*)
\[Alpha]5=-((M^2 us\[Phi]^2)/(6 \[CapitalDelta]0s^4 r0s^6))(\[CapitalDelta]0s r0s^4 \[Delta]rs^2+\[CapitalDelta]0s^2 r0s^4 \[Delta]\[Theta]^2+\[CapitalDelta]0s^2 r0s(as^2 (r0s+2)+r0s^3)(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+(r0s^3 (as^2-r0s)\[Delta]rs^2+\[CapitalDelta]0s^2 r0s^3 \[Delta]\[Theta]^2+\[CapitalDelta]0s^2 (r0s^3-as^2)(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]))\[Delta]rs)(\[CapitalDelta]0s r0s^4 (2as v^-1-3 as^2+3r0s-2r0s^2)\[Delta]rs^2+\[CapitalDelta]0s^2 r0s^4 (-4 as v^-1+3 as^2+r0s^2)\[Delta]\[Theta]^2+\[CapitalDelta]0s^3 r0s (as+v^-3)^2 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+(\[CapitalDelta]0s^2 r0s^3 (9as^2-10 as v^-1+4 r0s^2-3r0s)\[Delta]\[Theta]^2+\[CapitalDelta]0s^2 (as^2 r0s(3r0s^2-2r0s+5)+2 as v^-5 (r0s-1)-3 as^4+r0s^4 (4r0s-7))(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+r0s^3 (2as^3 v^-1-2as^2 r0s(r0s-3)-2 as v^-3-3as^4+2r0s^3-3r0s^2)\[Delta]rs^2)\[Delta]rs);(*ok*)
\[Beta]5=(M^2 \[Delta]rs)/(8 \[CapitalDelta]0s^2 r0s^7) (r0s^2 (r0s^3 \[Delta]rs^2+\[CapitalDelta]0s r0s^3 \[Delta]\[Theta]^2+\[CapitalDelta]0s(as^2 (r0s+2)+r0s^3)(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]))((8 as r0s us\[Phi] ut (r0s-1)+10 as^3 ut us\[Phi]+as^2 (2r0s us\[Phi]^2 (2-3r0s)-5 ut^2)-5as^4 us\[Phi]^2-r0s(r0s^3 us\[Phi]^2+2 ut^2 (r0s-2)))\[Delta]rs^2+\[CapitalDelta]0s(15 as^4 us\[Phi]^2-30 as^3 ut us\[Phi]+as^2 (r0s(19r0s-6)us\[Phi]^2+15 ut^2)+2 as r0s us\[Phi] ut (6-11r0s)+r0s(4r0s^3 us\[Phi]^2+3 ut^2 (r0s-2)))\[Delta]\[Theta]^2+\[CapitalDelta]0s^2 ut(3ut-2as us\[Phi])(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]))-2 \[CapitalDelta]0s^2 ut us\[Phi](as^2 us\[Phi](r0s+2)-2 ut as+r0s^3 us\[Phi])(ut-as us\[Phi])(3r0s^4 \[Delta]rs^2+3\[CapitalDelta]0s r0s^4 \[Delta]\[Theta]^2+\[CapitalDelta]0s(as^2 (4r0s^3 us\[Phi]^2 (r0s+2)+3r0s^2+6r0s+8ut^2)-8ut as^3 (r0s+2)us\[Phi]-8 ut as r0s^3 us\[Phi]+2 as^4 (r0s+2)^2 us\[Phi]^2+r0s^4 (2r0s^2 us\[Phi]^2+3))(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]))(5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]));(*ok*)
s2=M^2 (s002 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s020 \[Delta]\[Theta]^2+s200 \[Delta]rs^2);
s3=M^2 (s002 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s020 \[Delta]\[Theta]^2+s200 \[Delta]rs^2+s102 \[Delta]rs (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s120 \[Delta]rs \[Delta]\[Theta]^2+s300 \[Delta]rs^3);
s5=M^2 (s002 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s020 \[Delta]\[Theta]^2+s200 \[Delta]rs^2+s102 \[Delta]rs (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s120 \[Delta]rs \[Delta]\[Theta]^2+s300 \[Delta]rs^3+s220 \[Delta]rs^2 \[Delta]\[Theta]^2+s040 \[Delta]\[Theta]^4+s400 \[Delta]rs^4+s004 ((5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]))^2+s022 \[Delta]\[Theta]^2 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s202 \[Delta]rs^2 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s140 \[Delta]rs \[Delta]\[Theta]^4+s320 \[Delta]rs^3 \[Delta]\[Theta]^2+s500 \[Delta]rs^5+s122 \[Delta]rs \[Delta]\[Theta]^2 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]])+s104 \[Delta]rs ((5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]))^2+s302 \[Delta]rs^3 (5/2-8/3 Cos[\[Delta]\[Phi]]+1/6 Cos[2\[Delta]\[Phi]]));
\[CapitalPhi]4p1:=q(1/s5^(1/2)+\[Alpha]5/s3^(3/2)+\[Beta]5/s2^(3/2))/.{\[Delta]rs->(r-r0)/M,\[Delta]\[Theta]-> \[Theta]-\[Pi]/2,\[Delta]\[Phi]->\[Phi]-\[CapitalOmega] t};\[CapitalPhi]4p1]


\[CapitalPhi]4pm[t_,r_,\[Theta]_,m_]:=Module[{r0s,as,v,\[CapitalDelta]0s,\[CapitalOmega],rplus,rminus,\[CapitalDelta]\[Phi],\[CapitalPhi]4pm1},r0s=r0/M;as=a/M;v=r0s^(-1/2);\[CapitalDelta]0s=r0s^2-2 r0s+as^2;
\[CapitalOmega]=v^3/(M(1+as v^3));rplus=M+Sqrt[M^2-a^2];rminus=M-Sqrt[M^2-a^2];
\[CapitalDelta]\[Phi]=a/(rplus-rminus) Log[(r-rplus)/(r-rminus)];\[CapitalPhi]4pm1:=(Exp[-I m \[CapitalDelta]\[Phi]]/(2\[Pi]))NIntegrate[(Exp[-I m \[Phi]])\[CapitalPhi]4p[t,r,\[Theta],\[Phi]],{\[Phi],-\[Pi],\[Pi]},Method->{"Trapezoidal"}];\[CapitalPhi]4pm1]


box\[CapitalPhi]4p[t1_,r1_,\[Theta]1_,\[Phi]1_]:=Module[{rplus,rminus,\[CapitalDelta]\[Phi],\[CapitalDelta],\[CapitalSigma]sq,\[Rho]sq,gijdown,gijup,comp,g,A,box\[CapitalPhi]4p1,t,r,\[Theta],\[Phi]},rplus=M+Sqrt[M^2-a^2];rminus=M-Sqrt[M^2-a^2];\[CapitalDelta]\[Phi][r_]=a/(rplus-rminus) Log[(r-rplus)/(r-rminus)];\[CapitalDelta]=r^2-2M r + a^2; 
\[CapitalSigma]sq= (r^2+a^2)^2-a^2 \[CapitalDelta] Sin[\[Theta]]^2;
\[Rho]sq=r^2+a^2 (Cos[\[Theta]])^2; 
gijdown=({
 {-(1-(2M r )/\[Rho]sq), 0, 0, (-2a M r (Sin[\[Theta]])^2)/\[Rho]sq},
 {0, \[Rho]sq/\[CapitalDelta], 0, 0},
 {0, 0, \[Rho]sq, 0},
 {(-2 a M r (Sin[\[Theta]])^2)/\[Rho]sq, 0, 0, (r^2+a^2+(2 M r a^2 (Sin[\[Theta]])^2)/\[Rho]sq) (Sin[\[Theta]])^2}
}); 
gijup=Inverse[gijdown];
comp={t,r,\[Theta],\[Phi]}; 
g= -\[Rho]sq^2 Sin[\[Theta]]^2;
A[t,r,\[Theta],\[Phi]] =Table[ Sum[Sqrt[-g] *gijup[[l,n]]*D[\[CapitalPhi]4p[t,r,\[Theta],\[Phi]],comp[[n]]],{n,1,4}],{l,1,4}];
box\[CapitalPhi]4p1= Sum[1/Sqrt[-g]*D[A[t,r,\[Theta],\[Phi]][[l]],comp[[l]]],{l,1,4}]/.{t->t1,r->r1,\[Theta]->\[Theta]1,\[Phi]->\[Phi]1};box\[CapitalPhi]4p1]


Seff[t_,m_,r_,\[Theta]_]:=Module[{rplus,rminus,\[CapitalDelta]\[Phi],Seff1,\[CapitalDelta],\[CapitalSigma]sq,\[Rho]sq},rplus=M+Sqrt[M^2-a^2];rminus=M-Sqrt[M^2-a^2];\[CapitalDelta]\[Phi]=a/(rplus-rminus) Log[(r-rplus)/(r-rminus)];
\[CapitalDelta]=r^2-2M r + a^2; 
\[CapitalSigma]sq= (r^2+a^2)^2-a^2 \[CapitalDelta] Sin[\[Theta]]^2;
\[Rho]sq=r^2+a^2 (Cos[\[Theta]])^2; 
Seff1:=(-1-(4 M r (a^2+r^2))/((a^2+r (-2 M+r)) (a^2+2 r^2+a^2 Cos[2 \[Theta]])))^-1 ((r  \[CapitalDelta] \[Rho]sq)/\[CapitalSigma]sq) Exp[-I m \[CapitalDelta]\[Phi]]/(2\[Pi]) NIntegrate[box\[CapitalPhi]4p[t,r,\[Theta],\[Phi]]*Exp[-I m \[Phi]],{\[Phi],-\[Pi],\[Pi]},Method->"Trapezoidal"];Seff1]


SourceCombined[n_,m_]:=Module[{rplus,rminus,rtorstar,r0star,rsmin,rsmax,guess,rstartor,listr,listrsource,\[Theta]smin,\[Theta]smax,imax,jmax,rsourcestart,rsourceend,listSeff1,SourceMatrix1,i,j,r,LeftBC,RightBC,TopBC,BottomBC,SecondTopBC,SecondBottomBC,SecondLeftBC,SourceBC1,SecondRightBC,Sourcelist,\[CapitalDelta]\[Theta],\[Theta]sourcegrid,l,\[CapitalDelta]rstar,d,rmatrixfactorminus,rmatrixfactorplus,rmin,rmax,\[Theta]start,\[Theta]end},\[CapitalDelta]\[Theta]=\[Pi]/(5(2n+1));\[Theta]sourcegrid=2n+1;l=3n+1;
\[CapitalDelta]rstar=d/(2l+1);
d=6/5 3M;
rplus=M+Sqrt[M^2-a^2];rminus=M-Sqrt[M^2-a^2];rtorstar[r_]=r+(2M )/(rplus - rminus) (rplus Log[(r-rplus)/(2M)]-rminus Log[(r-rminus)/(2M)]);
r0star=rtorstar[r0];
rsmin=r0star-\[CapitalDelta]rstar/2-l*\[CapitalDelta]rstar;rsmax=r0star+\[CapitalDelta]rstar/2+l*\[CapitalDelta]rstar;
\[Theta]smin=\[Pi]/2-\[CapitalDelta]\[Theta]/2-n*\[CapitalDelta]\[Theta];\[Theta]smax=\[Pi]/2+\[CapitalDelta]\[Theta]/2+n*\[CapitalDelta]\[Theta];
rmatrixfactorminus=Floor[(rsmin-rminapp)/d]+1;
rmatrixfactorplus=Floor[(rmaxapp-rsmax)/d]+1;
rmin=rsmin-(rmatrixfactorminus-1)*d;
rmax=(rmatrixfactorplus-1)*d+rsmax;
\[Theta]start=\[Theta]smin/\[CapitalDelta]\[Theta];\[Theta]end=\[Theta]smax/\[CapitalDelta]\[Theta];

imax=Floor[(rmax-rmin)/\[CapitalDelta]rstar+1];jmax=Floor[\[Pi]/\[CapitalDelta]\[Theta]+1];
guess[rstar_]:=If[rstar<= -2,rplus+2*(1-a^2)^(1/rplus-1/2) Exp[(a^2-rplus+(rplus-1)*rstar)/rplus],If[-2<rstar<= 1000,rplus+2(ProductLog[Exp[1/2 (rstar-rplus)]]),rstar+rplus]];
rstartor[rstar_]:=If[rstar<-50,guess[rstar],r/.FindRoot[rtorstar[r]-rstar==0,{r,guess[rstar]},Method->"Newton"]];
listr=Table[Re[rstartor[rstar]],{rstar,rmin,rmax,\[CapitalDelta]rstar}]//Quiet;listrsource=Table[Re[rstartor[rstar]],{rstar,rsmin,rsmax,\[CapitalDelta]rstar}]//Quiet;
rsourcestart=Floor[(rsmin-rmin)/\[CapitalDelta]rstar+1];rsourceend=rsourcestart+Length[listrsource]-1;
listSeff1=Table[Seff[0,m,listrsource[[i]],N[j]],{i,1,Length[listrsource]},{j,\[Theta]smin,\[Theta]smax,\[CapitalDelta]\[Theta]}];

SourceMatrix1=SparseArray[Flatten[Table[{i+rsourcestart-1,j+\[Theta]start}->listSeff1[[i,j]],{i,1,Length[listrsource]},{j,1,\[Theta]end-\[Theta]start+1}]],{imax,jmax}];LeftBC:=SparseArray[Flatten[Table[{i2+rsourcestart-1,\[Theta]start}-> -getfxyCoeff[listrsource[[i2]],\[Theta]smin-\[CapitalDelta]\[Theta],4,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m] listrsource[[i2]] \[CapitalPhi]4pm[0,listrsource[[i2]],N[\[Theta]smin],m],{i2,1,Length[listrsource]}]],{imax,jmax}];SecondLeftBC:=SparseArray[Flatten[Table[{i2+rsourcestart-1,\[Theta]start+1}-> getfxyCoeff[listrsource[[i2]],\[Theta]smin,5,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m] listrsource[[i2]] \[CapitalPhi]4pm[0,listrsource[[i2]],N[\[Theta]smin-\[CapitalDelta]\[Theta]],m],{i2,1,Length[listrsource]}]],{imax,jmax}];RightBC:=SparseArray[Flatten[Table[{i1+rsourcestart-1,\[Theta]end+2}-> -getfxyCoeff [listrsource[[i1]],\[Theta]smax+\[CapitalDelta]\[Theta],5,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m]listrsource[[i1]] \[CapitalPhi]4pm[0,listrsource[[i1]],N[\[Theta]smax],m],{i1,1,Length[listrsource]}]],{imax,jmax}];
SecondRightBC:=SparseArray[Flatten[Table[{i1+rsourcestart-1,\[Theta]end+1}-> getfxyCoeff[listrsource[[i1]],\[Theta]smax,4,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m] listrsource[[i1]] \[CapitalPhi]4pm[0,listrsource[[i1]],N[\[Theta]smax+\[CapitalDelta]\[Theta]],m],{i1,1,Length[listrsource]}]],{imax,jmax}];TopBC:=SparseArray[Flatten[Table[{rsourcestart-1,\[Theta]start+j}-> -getfxyCoeff [listr[[rsourcestart-1]],\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1),2,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m]listr[[rsourcestart]] \[CapitalPhi]4pm[0,listr[[rsourcestart]],N[\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1)],m],{j,1,\[Theta]end-\[Theta]start+1}]],{imax,jmax}];
SecondTopBC:=SparseArray[Flatten[Table[{rsourcestart,\[Theta]start+j}-> getfxyCoeff[listr[[rsourcestart]],\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1),3,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m] listr[[rsourcestart-1]] \[CapitalPhi]4pm[0,listr[[rsourcestart-1]],N[\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1)],m],{j,1,\[Theta]end-\[Theta]start+1}]],{imax,jmax}];BottomBC:=SparseArray[Flatten[Table[{rsourceend+1,\[Theta]start+j}-> -getfxyCoeff[listr[[rsourceend+1]],\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1),3,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m] listr[[rsourceend]] \[CapitalPhi]4pm[0,listr[[rsourceend]],N[\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1)],m],{j,1,\[Theta]end-\[Theta]start+1}]],{imax,jmax}];SecondBottomBC:=SparseArray[Flatten[Table[{rsourceend,\[Theta]start+j}-> getfxyCoeff[listr[[rsourceend]],\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1),2,\[CapitalDelta]rstar,\[CapitalDelta]\[Theta],m] listr[[rsourceend+1]] \[CapitalPhi]4pm[0,listr[[rsourceend+1]],N[\[Theta]smin+\[CapitalDelta]\[Theta]*(j-1)],m],{j,1,\[Theta]end-\[Theta]start+1}]],{imax,jmax}];
SourceBC1=LeftBC+SourceMatrix1+SecondLeftBC+RightBC+SecondRightBC+TopBC+SecondTopBC+BottomBC+SecondBottomBC;
Sourcelist=Flatten[ArrayReshape[SourceBC1,{1,imax*jmax}]];
SourceBC1]


SourceMatrix=SourceCombined[n1,m1]
