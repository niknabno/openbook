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

module smallHinge(x) {
	rotate([90, 0, 0]) {
		translate([0, h/2-10.5, -w/2-20]) {
			translate([x, 2.5, 0]) m4Hole();
			translate([x+26, 2.5, 0]) m4Hole();
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
     cylinder(1.5, 3.3, 3.3);
}

module m2Hole() {
     cylinder(90, 1.35, 1.35);
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





//provide a strong connection from hinge to lid
module hingeMountPoint()
{
	difference()
	{
		minkowski()
		{
			translate([0, -w/2+4.5, 0]) cube([42, 6, 2.5]);
			cylinder(0.000000000001, 3, 3);
		}
		translate([39, -w/2+7, -1]) m4Hole();
		translate([3, -w/2+7, -1]) m4Hole();

	}
}

module unifiedHingeMountPoint()
{

	//translate([HINGE_AX-8, -w/2-1.5, 1.5]) cube([36, 13, 1]);
        difference()
        {
                minkowski()
                {
                        translate([HINGE_AX-8, -w/2-1.5, 0]) cube([315, 13, 2.5]);
                        //cylinder(0.000000000001, 3, 3);
                }
		translate([HINGE_AX, 0, 0])
		{
			translate([-8, -w/2-2.5, 1.5]) cube([52, 15, 2]);
                	translate([36, -w/2+7, -1]) m4Hole();
                	translate([0, -w/2+7, -1]) m4Hole();
		}
		translate([HINGE_BX, 0, 0])
		{
			translate([-8, -w/2-2.5, 1.5]) cube([52, 15, 2]);
			translate([36, -w/2+7, -1]) m4Hole();
                	translate([0, -w/2+7, -1]) m4Hole();
		}
		translate([HINGE_CX, 0, 0])
		{
                	translate([26, -w/2+6, -1]) m4Hole();
                	translate([0, -w/2+6, -1]) m4Hole();
		}

        }
}

module smallHingeMountPoint()
{
	difference()
	{
		minkowski()
		{
			translate([0, -w/2+4.5, 0]) cube([32, 6, 2.5]);
			cylinder(0.000000000000001, 3, 3);
		}
		translate([29, -w/2+7, -1]) m4Hole();
		translate([3, -w/2+7, -1]) m4Hole();

	}

}

//m4 screw holes for hinge on the lid
module lidHinge(x) {
    translate([0, -w/2+4.5, -5]) {
        translate([x, 2.5, 0]) {
            m4Hole();
        }
        translate([x+36, 2.5, 0]) {
            m4Hole();
        }
     }
}

module smallLidHinge(x) {
    translate([0, -w/2+3.5, -5]) {
        translate([x, 2.5, 0]) m4Hole();
        translate([x+26, 2.5, 0]) m4Hole();
     }
}


module bulbHolder()
{
	difference()
	{
		cube([BULB_HOLDER_W, 5, BULB_HOLDER_H]);
		rotate([90, 0, 0])
		{
			translate([4, BULB_HOLDER_H/2, -6])
			{
				m2Hole();
				translate([BULB_HOLES_DIST, 0, 0]) m2Hole();
			}
		}
		translate([BULB_HOLDER_W/2, 0, 0]) cube([17.5, 5*10, BULB_HOLDER_H*4], center = true);

	}
}

//mounting holes for IPS panel
module screenMountHoles()
{
	translate([0,-0.75,0])
	{
		translate([-125.75,0,0]) m2Hole();
		translate([125.75,0,0]) m2Hole();
	}
	translate([0, 192, 0])
	{
		translate([-136.5,0,0]) m2Hole();
		translate([136.5,0,0]) m2Hole();
	}

}


module voltometreMount()
{
	difference()
	{
		translate([2,0,h/2+2.5]) cube([7.75, 16, 3.5]);
		translate([VOLT_W/2,VOLT_W/2,0]) m2Hole();
    	}
	difference()
        {
                translate([26+1.25,0,h/2+2.5]) cube([7.5, 16, 3.5]);
                translate([26+VOLT_W/2,VOLT_W/2,0]) m2Hole();
      	}
}
