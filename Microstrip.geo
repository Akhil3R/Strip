// Gmsh project created on Mon Sep 23 19:11:16 2024

SetFactory("OpenCASCADE");

// Define parameters
w = 10;    // Width of the signal line
t = 0.5;   // Thickness of the signal line and ground plane
h = 16;    // Height of the substrate
air = 50;  // Air space around the microstrip

// Create points for the cross-section
Point(1) = {-w/2, h, 0};
Point(2) = {w/2, h, 0};
Point(3) = {w/2, h+t, 0};
Point(4) = {-w/2, h+t, 0};
Point(5) = {-(w/2+air), -t, 0};
Point(6) = {w/2+air, -t, 0};
Point(7) = {w/2+air, h+t+air, 0};
Point(8) = {-(w/2+air), h+t+air, 0};

// Create lines
Line(1) = {1, 2};  // Substrate top
Line(2) = {2, 3};  // Signal line right
Line(3) = {3, 4};  // Signal line top
Line(4) = {4, 1};  // Signal line left
Line(5) = {5, 6};  // Ground plane
Line(6) = {6, 7};  // Right boundary
Line(7) = {7, 8};  // Top boundary
Line(8) = {8, 5};  // Left boundary

// Create surfaces
Curve Loop(1) = {3, 4, 1, 2};  // Signal line
Plane Surface(1) = {1};

Curve Loop(2) = {1, -4, -3, -2, 6, 7, 8, 5};  // Substrate
Plane Surface(2) = {2};

Curve Loop(3) = {5, 6, 7, 8};  // Air
Plane Surface(3) = {3};

// Define physical groups
Physical Curve("signal", 1) = {2, 3, 4};
Physical Surface("substrate", 2) = {2};
Physical Curve("ground", 3) = {5};
Physical Surface("air", 4) = {3};

// Mesh size control
Mesh.CharacteristicLengthMin = t/2;
Mesh.CharacteristicLengthMax = air/2;

// Refine mesh around the signal line
Field[1] = Box;
Field[1].VIn = t/2;
Field[1].VOut = air/4;
Field[1].XMin = -w/2-t;
Field[1].XMax = w/2+t;
Field[1].YMin = h-t;
Field[1].YMax = h+2*t;

Background Field = 1;