# FitSeries
A stripped down Julia version of MATLAB's fit function

![FittingResult](https://github.com/Timmmdavis/fit/blob/master/Result.png) 

Example usage: 
```
x = range(0,stop=2*pi,length=n) 
r=rand(1)[1] #Random number between 0 and 1
y=sin(x)+cos(x/pi)+((r-0.5)/10)
nocoeffs=5
fitType="Chebyshev"
f=FitSeries.fit(x,y,fitType,nocoeffs)
#Check approximation at certain x location within interval (pi)
y_approx = f(pi);
```