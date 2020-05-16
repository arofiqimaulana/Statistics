*Source Code Metode Bayesian ZIG;
*Import Data;
proc import out=work.ZIG datafile='D:\BANK DATA\DATABASE\data zig.xlsx' dbms=xlsx replace;
run;
*Menampilkan Data;
proc print data=ZIG;
run;
*Metode Bayesian;
proc mcmc data=ZIG
	outpost=mcmcout nmc=400000 nbi=20000 thin=50 seed=2016 propcov=quanew init=mode diag=(HEIDELBERGER RAFTERY GEWEKE MCSE );
array alpha[2] alpha1-alpha2;
array beta[2] beta1-beta2;
array gamma[2] gamma1-gamma2;
array x[2] x1 x2;

*parameter;
parms (alpha: beta: gamma: alpha0 beta0 gamma0) 1;

*Prior;
prior alpha: ~ normal(0,var=1000);
prior gamma: ~ normal(0,var=1000);
prior beta: ~ normal(0,var=1000);

*Linier Prediktor;
xg=gamma0;
xb=beta0;
xa=alpha0;
do i =1 to 2;
	xg = xg + x[i]*gamma[i];
	xb = xb + x[i]*beta[i];
	xa = xa + x[i]*alpha[i];
end;
p0=logistic(xg);
mu=exp(xb);
sd=exp(xa);
a=(mu**2)/(sd**2); 
b=mu/(sd**2);

if y = 0 then ll=log(p0);
else if y>0 then ll=log(1-p0)+a*log(b)-log(gamma(a))+(a-1)*log(y)-b*y;
model y~general(ll);
run;
*Regresi ZIG;
proc nlmixed data=ZIG;
      parms b0_f=0 b1_f=0 b2_f=0
            b0_h=0 b1_h=0 b2_h=0 
            log_theta=0;

      eta_f = b0_f + b1_f*x1 + b2_f*x2;
      p_yEQ0 = 1 / (1 + exp(-eta_f));

      eta_h = b0_h + b1_h*x1 + b2_h*x2;
      mu    = exp(eta_h);
      theta = exp(log_theta);
      r = mu/theta;

      if y=0 then
         ll = log(p_yEQ0);
      else
         ll = log(1 - p_yEQ0)
              - lgamma(theta) + (theta-1)*log(y) - theta*log(r) - y/r;

      model y ~ general(ll);
      predict (1 - p_yEQ0)*mu out=expect_zig;
      predict r out=shape;
      estimate "scale" theta;
    run;
