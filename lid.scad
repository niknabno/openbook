$fn = 90;

include<consts.scad>;
h = 5;

difference() {
    minkowski() {
        cube([l, w, h], center=true);
        cylinder(0.0000001, 3, 3);
    };
    translate([-l/2+5,-w/2+2,0]) cube([l-22, w-5, 4]);
    hinge(-143);
    hinge(25);
    hinge(-61);
    translate([-151, -w/2-15, -5]) cube([220, 12.75, 30]);
    translate([-151, -w/2-10, 0]) cube([220, 12.75, 30]);
    //laptopHingeA(-117.5);
    //translate([-118,106,-10]) cylinder(20, 2.85, 2.85);
    //translate([-102,106,-10]) cylinder(20, 2.85, 2.85);
    
    
    rotate([0, 180, 0]) {
    translate([0, 0, -5]) linear_extrude(9) {
    translate([0, 5, 0]) text("OPENBOOK", size=26, spacing=1.15, halign="center", font = "Plaster:style=Regular");
        
    //translate([-84, -17, 0]) text("MK.lV", size=11, spacing=1.05, halign="left", font = "Dejavu Serif:style=Bold italic");
        
    translate([0, -25, 0]) text("BY NIKNABNO", size=13, spacing=1.25, halign="center", font = "Plaster:style=Regular");
    
    translate([0, -45, 0]) text("", size=8, spacing=1.25, halign="center", font = "Plaster:style=Regular");     
        
    }
    
    
    translate([-100, -6.5,-5]) cube([90, 5, 40]);
    translate([10, -6.5,-5]) cube([90, 5, 40]);
    translate([+100, -4, -5]) cylinder(90, 2.5, 2.5);
    translate([-100, -4, -5]) cylinder(90, 2.5, 2.5);
    translate([-10, -4, -5]) cylinder(90, 2.5, 2.5);
    translate([10, -4, -5]) cylinder(90, 2.5, 2.5);

}
}

//difference() {
    //translate([80, -w/2+29-5.5, -1]) cube([75, 5.5, 2.5]);
    //translate([82.5, -w/2+12, 0])
    //linear_extrude(4) 
  //  text("void-fck", size=8, spacing=1.15, halign="left", font = "Plaster:style=Regular");
//}
      
m3Extrude(25, -w/2+7, 0);
translate([27, -w/2+4.5, 0]) cube([32, 5, 2.5]);
m3Extrude(61, -w/2+7, 0);

m3Extrude(-61, -w/2+7, 0);
translate([-59, -w/2+4.5, 0]) cube([32, 5, 2.5]);
m3Extrude(-25, -w/2+7, 0);

m3Extrude(-143+36, -w/2+7, 0);
translate([-141, -w/2+4.5, 0]) cube([32, 5, 2.5]);
m3Extrude(-143, -w/2+7, 0);


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




module m3Hole() {
     cylinder(25, 1.85, 1.85);
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
module m3Extrude(x, y, z) {
    difference() {
        translate([x, y, z]) bigFeckingHole();
        translate([x, y, z-1]) m3Hole();

    }
}
