import graph3;

//ASY file for figspace4c.pdf in Chapter 10.1

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-2.25,2.25);
pair ybounds=(-2.25,2.25);
pair zbounds=(-0.25,4.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the parabola z=y^2 for t from -2 to 2
triple g(real t) {return (0,t,t^2);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,blue);

//Draw the cylinder z=y^2
triple f(pair t) {
  return (t.x,t.y,(t.y)^2);
}
surface s=surface(f,(-2,-2),(2,2),32,32,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);









// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);