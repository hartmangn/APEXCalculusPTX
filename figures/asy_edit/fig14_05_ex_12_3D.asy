import graph3;

//ASY file for fig13_06_ex_133D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={1};
defaultpen(0.5mm);

pair xbounds=(-0.25,1.5);
pair ybounds=(-0.25,1.5);
pair zbounds=(-0.25,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//parabola in plane
triple g(real t) {return (t,1-t^2,0);}
path3 mypath=graph(g,0,1,operator ..);draw(mypath,blue+linewidth(2));
triple g(real t) {return (0,1-t^2,t);}
path3 mypath=graph(g,0,1,operator ..);draw(mypath,blue+linewidth(2));
triple g(real t) {return (t,1-t^2,t);}
path3 mypath=graph(g,0,1,operator ..);draw(mypath,blue+linewidth(2));

//draw square and sideline
draw((0,0,0)--(1,0,0)--(1,0,1)--(0,0,1)--(0,0,0),blue+linewidth(2));
draw((0,0,0)--(0,1,0),blue+linewidth(2));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,(1-t.x^2),t.y*t.x);//
}
surface s=surface(f,(0,0),(1,1),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.y*t.x,(1-t.x^2),t.x);//
}
surface s=surface(f,(0,0),(1,1),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,0,t.y);//
}
surface s=surface(f,(0,0),(1,1),1,1,usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (0,t.y*(1-t.x^2),t.x);//
}
surface s=surface(f,(0,0),(1,1),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y*(1-t.x^2),0);//
}
surface s=surface(f,(0,0),(1,1),8,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);





//label and arrow
label("$y=1-x^2$",(1,1,0));
draw((0.9,0.9,.1)--(.65,.6,.4),Arrow3(size=2mm));
label("$y=1-z^2$",(0,1,.85));
draw((.1,.9,.75)--(.3,.8,.45),Arrow3(size=2mm));






//shade object
//import three;
//int k=12;
//for (int i=0; i<k; ++i)
//{
//path3 p=(0,1-(i/k)^2,i/k)--(0,1-((i+1)/k)^2,(i+1)/k)--((i+1)/k,1-((i+1)/k)^2,(i+1)/k)--((i)/k,1-((i)/k)^2,(i)/k);
//draw(surface(p -- cycle), emissive(rgb(1,.6,.6)+opacity(0.7)));//pink

//path3 p=(i/k,1-(i/k)^2,0)--((i+1)/k,1-((i+1)/k)^2,0)--((i+1)/k,1-((i+1)/k)^2,(i+1)/k)--((i)/k,1-((i)/k)^2,(i)/k);
//draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));//blue
//}



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);
//draw(mypath,blue+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
