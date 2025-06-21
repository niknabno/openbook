$fn = 90;

include<consts.scad>;
include<modules.scad>;


h=5;

difference() {
    minkowski() {
        cube([l, w, h], center=true);
        cylinder(3, 2, 3);
    };
    //the rounding above adds height: so me cut that extra height off
    translate([0, 0, 5]) cube([l+7, w+7, 3], center=true);
    translate([-l/2+5,-w/2+2,0]) cube([l-22, w-5, 4]);
    hinge(-143);
    hinge(25);
    hinge(-61);
    translate([-151, -w/2-15, -5]) cube([220, 12.75, 30]);
    translate([-151, -w/2-10, 0]) cube([220, 12.75, 30]);
    //laptopHingeA(-117.5);
    //translate([-118,106,-10]) cylinder(20, 2.85, 2.85);
    //translate([-102,106,-10]) cylinder(20, 2.85, 2.85);

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

//difference() {
    //translate([80, -w/2+29-5.5, -1]) cube([75, 5.5, 2.5]);
    //translate([82.5, -w/2+12, 0])
    //linear_extrude(4)
  //  text("void-fck", size=8, spacing=1.15, halign="left", font = "Plaster:style=Regular");
//}



translate([22, 0, 0]) hingeMountPoint();

translate([-64, 0, 0]) hingeMountPoint();

translate([-146, 0, 0]) hingeMountPoint();


//Holes to mount door hinges (70mm x 50mm or somethin')
module hinge(x) {
    translate([0, -w/2+4.5, -5]) {
        translate([x, 2.5, 0]) {
            m3Hole();
        }
        translate([x+36, 2.5, 0]) {
            m3Hole();
        }
        }
    }


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



module bigFeckingHole() {
     cylinder(2.5, 3.3, 3.3);
}

