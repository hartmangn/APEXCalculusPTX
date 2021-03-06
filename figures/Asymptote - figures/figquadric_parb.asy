import graph3;

//ASY file for figquadric_parb.pdf in Chapter 10.1

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-3.5,3.5);
pair ybounds=(-3.5,3.5);
pair zbounds=(-0.25,5.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z = x^2/4+y^2
triple f(pair t) {
  return (2*sqrt(t.y)*cos(t.x),sqrt(t.y)*sin(t.x),t.y);//
}
surface s=surface(f,(0,0),(2*pi,4),32,16,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);


//Draw the trace for y=0 in red
triple g(real t) {return (t,0,t^2/4);}
path3 mypath=graph(g,-4,4,operator ..); draw(mypath,red);
//Draw the trace for x=0 in red
triple g(real t) {return (0,t,t^2);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,red);
//Draw the trace for z=2 in red
triple g(real t) {return (2*sqrt(2)*cos(t),sqrt(2)*sin(t),2);}
path3 mypath=graph(g,0,2*pi,operator ..); draw(mypath,red);

//Add labels
label("In plane",(4,0,6),N);label("$y=0$",(4,0,5.5),N);
draw((4.25,0,5.5)--(4,0,4.25),linewidth(.75),Arrow3);
label("In plane",(0,2,6),N);label("$x=0$",(0,2,5.5),N);
draw((0,2.25,5.5)--(0,2,4.25),linewidth(.75),Arrow3);
label("In plane",(-1,3,1),N);label("$z=d$",(-1,2,0.5),E);
draw((-1,3,1.75)--(-2.1,1.1,2),linewidth(.75),Arrow3);

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