$fn = 90;

include<consts.scad>;
include<modules.scad>;

h = 2;

//3s bat holder
BAT_W = 62.5;
BAT_H = 77.5;

cutoutL = 150;
cutoutW = 200;
cutoutH = 6;

sqrSupportZ = -h/3-keyboardPlateW;
sqrSupportH = 21;

//Square supports prevent the walls from flexing
SQR_SUPPORT_L = 10;
LARGE_SQR_SUPPORT_W = 15;

difference() {
    minkowski() {
        cube([l, w, h], center=true);
    };
    //wall w/hinges is 1.5mm thicker
    translate([-l/2, w/2-2, -5]) cube([l,w,10]);

	for(i = [0 : 1]) {
            //Inset
            translate([-BAT_X_OFFSET-BAT_HOLES_DISTANCE/2, -w/2+51.25, -10])
            cube([BAT_W, BAT_H, 20], center=true);
            translate([BAT_X_OFFSET+BAT_HOLES_DISTANCE/2, -w/2+51.25, -10])
            cube([BAT_W, BAT_H, 20], center=true);
      }


     translate([-40, 70, -5]) linear_extrude(10) text("VIOLENCE?", size=18, spacing=1.16, halign="center", font =  "Plaster:style=Regular"); 
  
      
     

     
      //Bottom intake on eastSide
    	for(a = [0 : 1 ]) {
        	for(i = [0 : 4]) {
            	translate([(i*11)+LAPTOP_EAST-73, (a*20.5)+55, -20]) largeIntake();
        	}
    	}
        
        for(a = [0 : 1 ]) {
        	for(i = [0 : 4]) {
            	translate([(i*11)+LAPTOP_EAST-67, (a*20.5)+65, -20]) largeIntake();
        	}
    	}
        
      
      
        //West intake
        for(a = [0 : 1 ]) {
        	for(i = [0 : 2]) {
            	translate([(i*11)+LAPTOP_WEETBIX+40, (a*20.5)+25, -20]) rotate(0) largeIntake();
        	}
    	}
        
        for(a = [0 : 1 ]) {
        	for(i = [0 : 2]) {
            	translate([(i*11)+LAPTOP_WEETBIX+32.5, (a*20.5)+15, -20]) rotate(0) largeIntake();
        	}
    	}
        
        
        //Center
         for(a = [0 : 1 ]) {
        	for(i = [0 : 2]) {
            	translate([(i*11)-40, (a*20.5)+25, -20]) rotate(0) largeIntake();
        	}
    	}

        for(a = [0 : 1 ]) {
        	for(i = [0 : 2]) {
            	translate([(i*11)-47.5, (a*20.5)+15, -20]) rotate(0) largeIntake();
        	}
    	}

        cornerSqr(-l/2, -w/2);
        cornerSqr(l/2-12, w/2-12);
        cornerSqr(l/2-12, -w/2);
        cornerSqr(-l/2, w/2-12);

        translate([0, LAPTOP_NORTH-sqrSupportW-1.85, sqrSupportZ]) m3Hole();
        translate([0, LAPTOP_SOUTH+sqrSupportW, sqrSupportZ]) m3Hole();

        translate([LAPTOP_WEETBIX + LARGE_SQR_SUPPORT_W/2-2, 0, sqrSupportZ]) m3Hole();
        translate([LAPTOP_EAST-LARGE_SQR_SUPPORT_W/2+2, 0, sqrSupportZ]) m3Hole();
        translate([0, 0, -3]) m3Hole();

	translate([75+TRI_SUPPORT_W/2*1.25, w/2-TRI_SUPPORT_L/2, -3]) m3Hole();
	translate([-68-TRI_SUPPORT_W/2*1.25, w/2-TRI_SUPPORT_L/2, -3]) m3Hole();



	//start screw indent for hinges
	translate([HINGE_AX, LAPTOP_NORTH-8, -3]) screwIndent();
	translate([HINGE_AX+36, LAPTOP_NORTH-8, -3]) screwIndent();

	translate([HINGE_BX, LAPTOP_NORTH-8, -3]) screwIndent();
	translate([HINGE_BX+36, LAPTOP_NORTH-8, -3]) screwIndent();

	translate([HINGE_CX, LAPTOP_NORTH-8, -3]) screwIndent();
	translate([HINGE_CX+26, LAPTOP_NORTH-8, -3]) screwIndent();
	//end screw intent for hinges

        //for the iec plug
        translate([-l/2-1, IEC_Y-3, -5]) cube([6, IEC_W+6, IEC_H]);

        //For the edp cable
        translate([-62, w/2-4, -4]) cube([18, 1.25, IEC_H]);

       }

module m3Hole() {
     translate([0,0,2.917]) cylinder(95, 3, 3);
     cylinder(25, 1.85, 1.85, center=true);
}

module screwIndent()
{
	translate([0,0,2.917]) cylinder(95, 3, 3);
}

module largeIntake() {
    cylinder(25, LARGE_INTAKE_R, LARGE_INTAKE_R, $fn = 6);
}

//Designed to support KB+TP & M3 heatpress threaded inserts.
module cornerSqr(x, y) {
      translate([x+6,y+6, 30]) cylinder(95, 1.85, 1.85, center=true);
      translate([x+6,y+6, 0.25]) cylinder(95, 3, 3);

}
