DefineConstant[ s = {1., Name "Parameters/Global mesh size factor"} ] ;
Boxx=100.*s;// Boundary
Boxy=100*s;//Boundary
pw=20*s;// PCb witdh
w=1.6*s;// microstrip witdh
h=1.6*s; //dielectric height
th=0.35*s;//copper thickness
//Box dimention
Point(1)={-1*Boxx/2,-1*Boxy/2,0, 0};
Point(2)={1*Boxx/2,-1*Boxy/2,0, 0};
Point(3)={1*Boxx/2,1*Boxy/2,0, 0};
Point(4)={-1*Boxx/2,1*Boxy/2,0, 0};
// PCB substrate
Point(5)={-1*pw/2,-0.5*h,0,1};
Point(6)={1*pw/2,-0.5*h,0,1};
Point(7)={1*pw/2,0.5*h,0,1};
Point(8)={-1*pw/2,0.5*h,0,1};
// ground line
Point(9)={-1*pw/2,-0.5*h,0,1};
Point(10)={1*pw/2,-0.5*h,0,1};
Point(11)={1*pw/2,(0.5*h)-th,0,1};
Point(12)={-1*pw/2,(0.5*h)-th,0,1};

Line(1)={1,2}; Line(2)={2,3}; Line(3)={3,4}; Line(4)={4,1};
Line(5)={5,6};Line(6)={6,7};Line(7)={7,8};Line(8)={8,5};
Line(9)={9,10};Line(10)={10,11};Line(11)={11,12};Line(12)={12,9};

Curve Loop(13)={5,6,7,8}; Plane Surface(14)={13};
Curve Loop(14)={9,10,11,12}; Plane Surface(15)={14};
Curve Loop(12)={1,2,3,4}; Plane Surface(13)={12,13,14};


Physical Surface("Air", 101) = {13};
Physical Surface("Substrate", 102) = {14};
Physical Surface("gnd", 103) = {15};
