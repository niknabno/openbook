$fn = 90;

include<consts.scad>;
include<modules.scad>;


h=5;

difference()
{
	minkowski()
	{
		cube([l, w, h], center=true);
        	cylinder(3, 2, 3);
    	};

    	translate([0, 0, 5]) cube([l+7, w+7, 3], center=true);//the rounding above adds height: so me cut that extra height off
    	translate([LAPTOP_WEETBIX+5,LAPTOP_SOUTH+2,0]) cube([l-22, w-5, 4]); //main cutout

    	lidHinge(HINGE_AX);
    	lidHinge(HINGE_BX);
    	lidHinge(HINGE_CX);

	//cutout to allow hinge barrel to fit
    	translate([-151, -w/2-15, -5]) cube([220, 12.75, 30]);
    	translate([-151, -w/2-10, 0]) cube([220, 12.75, 30]);

    	//capital letters show up best in this font
    	rotate([0, 180, 0]) {
    		translate([0, 0, -5]) linear_extrude(9) {
    			translate([0, 5, 0]) text("OPENBOOK", size=21, spacing=1.15, halign="center", font = "Plaster:style=Regular");

    			//translate([-84, -17, 0]) text("MK.lV", size=11, spacing=1.05, halign="left", font = "Dejavu Serif:style=Bold italic");
    			translate([0, -25, 0]) text("BY NIKNABNO", size=15, spacing=1.25, halign="center", font = "Plaster:style=Regular");

    			translate([0, -45, 0]) text("", size=8, spacing=1.25, halign="center", font = "Plaster:style=Regular");

    		}
    		translate([-100, -6.5,-5]) cube([90, 4, 40]);
    		translate([10, -6.5,-5]) cube([90, 4, 40]);
    		translate([+100, -4, -5]) cylinder(90, 2, 2);
    		translate([-100, -4, -5]) cylinder(90, 2, 2);
    		translate([-10, -4, -5]) cylinder(90, 2, 2);
    		translate([10, -4, -5]) cylinder(90, 2, 2);
   }
}

//ensure strong conection with hinge and lit
translate([HINGE_BX-3, 0, 0]) hingeMountPoint();
translate([HINGE_CX-3, 0, 0]) hingeMountPoint();
translate([HINGE_AX-3, 0, 0]) hingeMountPoint();


module laptopHingeA(x) {
        translate([0, -w/2+15, -5]) {
            translate([x, 0, 0]) m3Hole();
            translate([x-7, 0, 0]) m3Hole();
            translate([x+10, +1, 0]) m3Hole();
            translate([x-7, 0, 0]) m3Hole();

            translate([x-12, -4, 0]) cube([2, 19, 10]);
            translate([x+16, -23, 0]) cube([2, 26, 10]);
       }
}

//Holes to mount door hinges (70mm x 50mm or somethin')
module doorHinge(x) {
      translate([0, -w/2+13, -5]) {
        translate([x, 0, 0]) m3Hole();
        translate([x+25, 2.5, 0]) m3Hole();
        translate([x+50, 0, 0]) m3Hole();
     }
}


