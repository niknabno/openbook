//define how nice the curves are. Higher no. increases render times.
$fn = 90;

include<consts.scad>; //include global vars
include<modules.scad>; //include modules

//start with one rounded rect, remove internal volume and mounting holes.
difference() {
	//make rect
	minkowski(){
		cube([l, w, h], center=true);
		cylinder(3, 0, 3);
    	}

    	//hollow out the rect
    	translate([0, -2, 3])
    	cube([l, w-3, h+1], center = true);

    	//start bottom intake on east side
    	for(a = [0 : 1 ]) {
        	for(i = [0 : 3]) {
            	translate([(i*11.5)+LAPTOP_EAST-70, (a*20.5)-5, -20]) largeIntake();
        	}
    	}

        for(a = [0 : 1 ]) {
        	for(i = [0 : 3]) {
            	translate([(i*11.5)+LAPTOP_EAST-64, (a*20.5)-15, -20]) largeIntake();
        	}
    	}
	//end bottom intake on east side

        //start bottom intake on west side
        for(a = [0 : 2 ]) {
        	for(i = [0 : 2]) {
            	translate([(i*11.5)+LAPTOP_WEETBIX+40, (a*20.5)-7.5, -20]) rotate(0) largeIntake();
        	}
    	}

        for(a = [0 : 3 ]) {
        	for(i = [0 : 2]) {
            	translate([(i*11.5)+LAPTOP_WEETBIX+32.5, (a*20.5)-17.5, -20]) rotate(0) largeIntake();
        	}
    	}
	//end bottom intake on west side

    	//side intake. circles with six sides = hexagons
    	for(a = [0 : 1 ]) {
            for(i = [0 : 13]) {
            	rotate([90, 0, 0]) translate([(i*5)+90, (a*10)-5, -w/2-10]) cylinder(25, 2.25, 2.25, $fn = 6);
    		}
             for(i = [0 : 13]) {
            	rotate([90, 0, 0]) translate([(i*5)+87, (a*10), -w/2-10]) cylinder(25, 2.25, 2.25, $fn = 6);

            }
        }

    	//Zip tie holes, to secure AC PSU wires
    	translate([-75, 67, -h]) cube([4,2,40]);
	translate([-75, 75, -h]) cube([4,2,40]);

	translate([-110, 67, -h]) cube([4,2,40]);
	translate([-110, 75, -h]) cube([4,2,40]);

	//Hinges
	hinge(-143);
	hinge(25);
	hinge(-61);
	//laptopHingeA(-75, LAPTOP_NORTH-27);
	//Let hinge be a hinge
        //translate([LAPTOP_WEETBIX+37, LAPTOP_NORTH-1, SURFACE_MOUNT+2.5]) cube([32.8,8, 50]);

	//switching buck converter mounting holes
        translate([-70, -10, -20])
	{
        	translate([20, 50]) m3Hole();
        	translate([44, 50]) m3Hole();
        	translate([20, -4]) m3Hole();
        	translate([44, -4]) m3Hole();
    	}

	//bms mounting holes
    	translate([BMS_X, BMS_Y, -12])
	{
        	m2Hole();
        	translate([BMS_L, 0, 0]) m2Hole();
        	translate([0, BMS_W, 0]) m2Hole();
		translate([BMS_L, BMS_W, 0]) m2Hole();

	}


    	translate([BMS_X, BMS_Y, -20])
	{
        	m2Hole();

    	}


    	//HDMI-EDP main board
    	translate([-95, 49, -20]) m3Hole();
    	translate([-150, -20, -20]) m3Hole();
    	translate([-150, 46, -20]) m3Hole();
    	translate([-95, -20, -20]) m3Hole();

    	//HDMI-daughter board
    	translate([-l/2+19.5, -w/2+21, -15]) m3Hole();
    	translate([-l/2+7.5, -w/2+63, -15]) m3Hole();

	//Pi mouning holes. M3 nuts should be used as spacers.
	//M2.5 Pi holes needs to be widened w/drill

	translate([l/2-24, w/2-3.5-17, -25]) rotate([0, 0, 90]) m3Hole();
	translate([l/2-24-58, w/2-3.5-17, -25]) rotate([0, 0, 90]) m3Hole();
	translate([l/2-24, w/2-3.5-49-17, -25]) rotate([0, 0, 90]) m3Hole();
	translate([l/2-24-58, w/2-3.5-49-17, -25]) rotate([0, 0, 90]) m3Hole();

	//allow for the pcb mount air cooler for the pi. (it sticks out below)
	if(OFFICAL_PI_5_COOLER)
	{
		translate([l/2-24, w/2-27, -25]) rotate([0, 0, 90]) m4Hole();
		translate([l/2-24-58, w/2-63, -25]) rotate([0, 0, 90]) m4Hole();
	}

	//pi front I/O cutout
	translate([l/2-70, w/2-55.5-15.5, -6.25]) cube([85, piCutoutX, piCutoutY]);

    	//indent so smd components on bottom of pi can fit
    	translate([l/2-90, w/2-55.5-15.5-3, -9.75]) cube([90, piCutoutX+6, piCutoutY]);

    	//No spacers to fit HDMI-EDP board
    	//HDMI-EDP daughter I/O board cutout
    	translate([-l/2-10, -w/2+13, -8.5]) cube([20, 53, 5.5]);

	//IEC C13 cutout
	translate([-l/2 - 25, IEC_Y+0.75, -6]) cube([90, IEC_W-1.5, IEC_H]);
    	translate([-l/2, IEC_Y-5, -20]) cube([5, IEC_W+10, IEC_H]);


	//IEC socket mountng holes
	rotate([0, 90, 0])
	{
    		translate([-2, IEC_Y+(IEC_W/2)+(IEC_HOLES_DISTANCE/2), -l/2-6])
		{
                	m3Hole();
                	translate([0,0, 2.917]) cylinder(1.25, 3, 3);
            	}
    		translate([-2, IEC_Y+(IEC_W/2)-(IEC_HOLES_DISTANCE/2), -l/2-6])
		{
                	m3Hole();
                	translate([0,0, 2.917]) cylinder(1.25, 3, 3);
            	}
   	 }


	//mounting holes for 3s 18650 holders
	for(i = [0 : 1])
	{
    		batHoles(BAT_X_OFFSET);
            	batHoles(-BAT_X_OFFSET-BAT_HOLES_DISTANCE);

            	//Inset
            	translate([-BAT_X_OFFSET-BAT_HOLES_DISTANCE/2, -w/2+51.25])
            	cube([BAT_W, BAT_H, 20], center=true);
            	translate([BAT_X_OFFSET+BAT_HOLES_DISTANCE/2, -w/2+51.25])
            	cube([BAT_W, BAT_H, 20], center=true);
       }


	//circular cutouts for switches
	rotate([0, 90, 0])
	{
    		//Key
    		translate([-2, -20, l/2-20]) cylinder(90, 6.5, 6.5);
    		//Red Button
    		translate([-1, 22, l/2-20]) cylinder(90, 6.5, 6.5);
	}

    	//USB-C cutout
    	translate([l/2-80, -w/4, 0]) cube([85, 12, 4.5]);
    	translate([l/2-1, -w/4+14.5, 2.5]) rotate([0, 90, 0]) m2Hole();
    	translate([l/2-1, -w/4-2.5, 2.5]) rotate([0, 90, 0]) m2Hole();

    	//HDMI Panel mount
    	translate([l/2-80, -w/2.5+0.5, -3]) cube([85, 19.5, 11]);
    	translate([l/2-1, -w/2.5+22.5, 2.5]) rotate([0, 90, 0]) m2Hole();
    	translate([l/2-1, -w/2.5-2.5, 2.5]) rotate([0, 90, 0]) m2Hole();

    	rotate([90, 0, 0])
    	{
        	translate([l/2-80, -w/2.5+12.5, -2.5]) m2Hole();
        	translate([l/2-80, -w/2.5-12.5, -2.5]) m2Hole();
    	}

    	//cutout for PSU indentation
	translate([0, w/2-38, -10])
	{
        	cube([PSU_HOLE_L, PSU_HOLE_W, 10], center=true);
        	//translate([PSU_HOLE_L/2-7, 0, -10]) cube([2, 99, 40]);
    	}

	//holes for the above cutout
	translate([-62, w/2-21, -20]) m3Hole();
	translate([-62, w/2-54, -20]) m3Hole();
	translate([62, w/2-21, -20]) m3Hole();
	translate([62, w/2-54, -20]) m3Hole();

	translate([-16, w/2-70, -20]) m3Hole();
    	translate([16, w/2-70, -20]) m3Hole();

	translate([18, w/2-6, -20]) m3Hole();
    	translate([-18, w/2-6, -20]) m3Hole();

	//Holes for a door handle
	rotate([90, 0, 0])
	{
    		translate([-65, 8, 100]) m3Hole();
    		translate([65, -4, 100]) m3Hole();
    		translate([-65, -4, 100]) m3Hole();
            translate([65, 8, 100]) m3Hole();
	}
}

/*
---------------------
Below is addative.
----------------------
*/
//Clean up pi cutout

//rotate([0, 180, 0]) translate([0,0,10])import("psuPlateLarge.stl");

//Fits above rj-45 bcuz is shorter than the usb-a connecters
if(PI_4_ETHERNET)
{
	translate([l/2, w/2-38, 8]) cube([3, PI_CUTOUT_ADDON_W, PI_CUTOUT_ADDON_H]);
}
else
{
	translate([l/2, w/2-71, 8]) cube([3, PI_CUTOUT_ADDON_W, PI_CUTOUT_ADDON_H]);
}

//IEC mounting spacers
	rotate([0, 90, 0])  {
    		translate([-2, IEC_Y+(IEC_W/2)+(IEC_HOLES_DISTANCE/2), -l/2]) {
                scale([1,1,1.2]) m3Extrude();
            }
    		translate([-2, IEC_Y+(IEC_W/2)-(IEC_HOLES_DISTANCE/2), -l/2]) {
                scale([1,1,1.2]) m3Extrude();
            }
    }

//IEC C13 CORNER TRIANGLES
    translate([LAPTOP_WEETBIX,IEC_Y,-h/2+IEC_CORNER_TRIANGLE_SIZE]) {
        translate([0, IEC_W-IEC_CORNER_TRIANGLE_SIZE]) iecCornerTriangle();
        rotate(180) translate([3,-IEC_CORNER_TRIANGLE_SIZE,0]) iecCornerTriangle();
    }




//make the door handle fit better
translate([-17, LAPTOP_SOUTH-3, -11]) {
    translate([65, 0, 0]) cube([24,3,3]);
}

translate([-7, LAPTOP_SOUTH-3, -11]) {
    translate([-65, 0, 0]) cube([24,3,3]);
}

//spacers
translate([l/2-24, w/2-3.5-17, -9.75]) {
    m3Extrude();
    translate([-58, 0, 0]) {
        m3Extrude();
        translate([0, -49, 0]) m3Extrude();
    }
    translate([0, -49, 0]) m3Extrude();
}


//Pico
translate([picoX, picoY, SURFACE_MOUNT]) m2Holder();
translate([picoX+11.4, picoY, SURFACE_MOUNT]) m2Holder();
translate([picoX, picoY-47, SURFACE_MOUNT]) m2Holder();
translate([picoX+11.4, picoY-47, SURFACE_MOUNT]) m2Holder();

//Join two halves of laptop w/M3 screws
difference() {
    translate([-connecterW/2, 17, SURFACE_MOUNT+1]) cube([connecterW, 29, 8]);
    translate([-11, 25, -5]) rotate([0, 90, 0]) m3Hole();
    translate([-11, 35, -5])  rotate([0, 90, 0]) m3Hole();

}

difference() {
    translate([-connecterW/2, -5, SURFACE_MOUNT+1]) cube([connecterW, 10, h-keyboardPlateW]);
    translate([-20, 0, -5])  rotate([0, 90, 0]) m3Hole();
    translate([0, 0, 3]) m3Hole();
}



/*translate([0, -90]) {
    difference() {
        translate([-connecterW/2, 17, SURFACE_MOUNT+1]) cube([      connecterW, 26, 8]);
        translate([-11, 25, -5]) rotate([0, 90, 0]) m3Hole();
        translate([-11, 35, -5])  rotate([0, 90, 0]) m3Hole();
    }
}
*/

cornerSqr(-l/2, -w/2);
cornerSqr(l/2-12, w/2-12);
cornerSqr(l/2-12, -w/2);
cornerSqr(-l/2, w/2-12);


//start extra supports for screwing down top plate
translate([0, 0, sqrSupportZ]) {
difference() {
    translate([ -LARGE_SQR_SUPPORT_W/2, LAPTOP_NORTH-SQR_SUPPORT_L]) sqrSupport(LARGE_SQR_SUPPORT_W, SQR_SUPPORT_L);
    translate([-17, LAPTOP_NORTH-LARGE_SQR_SUPPORT_W/2+1.85, -sqrSupportZ])  rotate([0, 90, 0]) m3Hole();
    translate([0, LAPTOP_NORTH-LARGE_SQR_SUPPORT_W/2, 32.5]) cylinder(36.75, HEATSET_INSERT_HOLE, HEATSET_INSERT_HOLE, center=true);
}

difference() {
    translate([ -LARGE_SQR_SUPPORT_W/2, LAPTOP_SOUTH]) sqrSupport(LARGE_SQR_SUPPORT_W, SQR_SUPPORT_L);
    translate([-17, LAPTOP_SOUTH+LARGE_SQR_SUPPORT_W/2-1.85, -sqrSupportZ])  rotate([0, 90, 0]) m3Hole();
    translate([0, LAPTOP_SOUTH+LARGE_SQR_SUPPORT_W/2-1.85, 32.5]) cylinder(36.75, HEATSET_INSERT_HOLE, HEATSET_INSERT_HOLE, center=true);
}

difference() {
    translate([LAPTOP_EAST-SQR_SUPPORT_L, -LARGE_SQR_SUPPORT_W/2]) sqrSupport(SQR_SUPPORT_L, LARGE_SQR_SUPPORT_W);
    translate([LAPTOP_EAST-LARGE_SQR_SUPPORT_W/2+1.85, 0, 32.5]) cylinder(36.75, HEATSET_INSERT_HOLE,    HEATSET_INSERT_HOLE, center=true);
}
difference() {
    translate([LAPTOP_WEETBIX, -LARGE_SQR_SUPPORT_W/2]) sqrSupport(SQR_SUPPORT_L, LARGE_SQR_SUPPORT_W);
    translate([LAPTOP_WEETBIX + LARGE_SQR_SUPPORT_W/2-1.85, 0, 32.5]) cylinder(36.75, HEATSET_INSERT_HOLE, HEATSET_INSERT_HOLE, center=true);
}
//end extra supports



translate([90, -w/2]) triSupport(); //sqrSupport(sqrSupportW, SQR_SUPPORT_L);
translate([-90, -w/2]) triSupport(); //sqrSupport(sqrSupportW, SQR_SUPPORT_L);

//supports north
translate([75, w/2]) rotate([0, 0, 180])
{
	difference()
	{
		scale([1.25,2,1]) triSupport(); //sqrSupport(sqrSupportW, SQR_SUPPORT_L);
		translate([TRI_SUPPORT_W/2*1.25, TRI_SUPPORT_L/2, 12])cylinder(36.75, HEATSET_INSERT_HOLE, HEATSET_INSERT_HOLE);
	}
};

translate([-68, w/2]) rotate([0, 0, 180])
{
	difference()
	{
		scale([1.25,2,1]) triSupport(); //sqrSupport(sqrSupportW, SQR_SUPPORT_L);
		translate([TRI_SUPPORT_W/2*1.25, TRI_SUPPORT_L/2, 12])cylinder(36.75, HEATSET_INSERT_HOLE, HEATSET_INSERT_HOLE);
	}
};



//supports west
translate([LAPTOP_WEETBIX, 30+TRI_SUPPORT_W]) rotate([0,0,270]) triSupport();
translate([LAPTOP_WEETBIX, -30]) rotate([0,0,270]) triSupport();
}
