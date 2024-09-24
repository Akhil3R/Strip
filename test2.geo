// Gmsh project created on Mon Sep 23 19:27:45 2024
SetFactory("OpenCASCADE");
//+
Rectangle(1) = {-100, -100, 0, 100, 100, 0};
//+
Rectangle(2) = {-55, -54, 0, 10, 10, 0};
//+
Rectangle(3) = {-54.8, -65.4, 0, 10, 10, 0};
//+
Rectangle(4) = {-54.5, -77.2, 0, 10, 10, 0};
//+
Curve Loop(5) = {4, 1, 2, 3};
//+
Curve Loop(6) = {5, 6, 7, 8};
//+
Curve Loop(7) = {11, 12, 9, 10};
//+
Curve Loop(8) = {15, 16, 13, 14};
//+
Plane Surface(5) = {5, 6, 7, 8};
//+
Physical Surface("air", 17) = {5};
