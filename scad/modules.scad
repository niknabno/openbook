include<consts.scad>; //include gloabal vars

module sqrSupport(w, l) {
    cube([w, l, sqrSupportH]);
}

module triSupport() {
    difference(){
        //creating a cube
        cube([TRI_SUPPORT_W, TRI_SUPPORT_L, sqrSupportH]);
        //rotating the cube
        translate([-1, TRI_SUPPORT_L, -1]) rotate([TRI_SUPPORT_ANGLE, 0, 0]) cube([10, 20, 25]);
    }
}


//For 2s 18650 holders. Lots of space between them.
module batHoles(x) {
    rotate([0, 0, 90]) {
        translate([-w/2+51.25, x, -25]) m3Hole();
        translate([-w/2+51.25, x+BAT_HOLES_DISTANCE, -25]) m3Hole();
    }
}


//Holes to mount door hinges (70mm x 50mm or somethin')
module doorHinge(x) {
   rotate([90, 0, 0]) {
      translate([0, h/2-10.5 , -w/2-20]) {
        translate([x, 2.5, 0]) m3Hole();
        translate([x+25, 0, 0]) m3Hole();
        translate([x+50, 2.5, 0]) m3Hole();
       }
    }
}





module hinge(x) {
   rotate([90, 0, 0]) {
      translate([0, h/2-10.5 , -w/2-20]) {
        translate([x, 2.5, 0]) m4Hole();
        translate([x+36, 2.5, 0]) m4Hole();
       }
    }
}

//M3 Hole. 1.85mm radius for telerance.
//Drill the pi w/m3 drill bit to widen annoying m2.5 hole
module m3Hole() {
     cylinder(30, 1.85, 1.85);
}

//Used for air intakes only
//Hexagonal for coolness factor
module largeIntake() {
    cylinder(25, largeIntakeRadius, largeIntakeRadius, $fn = 6);
}
module m4Hole() {
     cylinder(25, 2.2, 2.2);
}

module bigFeckingHole() {
     cylinder(1.5, 3.3, 3.30);
}

module m2Hole() {
     cylinder(6, 1.35, 1.35);
}


//For pico
module m2Holder() {
    cylinder(4.25, 3, 3);
    cylinder(6.25, 0.875, 0.875);
}

//Designed to support KB+TP & M3 heatpress threaded inserts.
module cornerSqr(x, y) {
        difference() {
            translate([x, y, SURFACE_MOUNT]) cube([12, 12, h+3-keyboardPlateW]);
            translate([x+6,y+6, 30]) cylinder(49, HEATSET_INSERT_HOLE, HEATSET_INSERT_HOLE, center=true);
        }
}

module m3Extrude() {
    difference() {
        bigFeckingHole();
        translate([0, 0, -1]) m3Hole();
    }
}


module iecCornerTriangle() {
        difference() {
            rotate([0,0,90]) cube([IEC_CORNER_TRIANGLE_SIZE, 3, IEC_CORNER_TRIANGLE_SIZE]);
            //Translate to stoep z-fighting
            rotate([0,315, 90]) translate([0,-1,0])  cube([IEC_CORNER_TRIANGLE_SIZE*2, 5, IEC_CORNER_TRIANGLE_SIZE]);
        }
}
