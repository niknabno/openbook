l = 134;
w = 53.5;
h = 11.45;

bracketW = 10;
bracketL = 45;

$fn = 90;

difference() {
    minkowski(){
        translate([0, 110-38, 10]) cube([l-3, w-3, h], center=true);
        cylinder(1.75, 4, 1);
    }


    translate([0, 110-38, 9.5]) cube([l-20, w, h], center=true);

    translate([-62, 89, 0]) cylinder(90, 1.85, 1.85, center=true);
    translate([-62, 56, 0]) cylinder(90, 1.85, 1.85, center=true);
    translate([62, 56, 0]) cylinder(90, 1.85, 1.85, center=true);
    translate([62, 89, 0]) cylinder(90, 1.85, 1.85, center=true);
    
    translate([-62, 89, 18]) cylinder(12, 4.25, 4.25, center=true);
    translate([-62, 56, 18]) cylinder(12, 4.25, 4.25, center=true);
    translate([62, 89, 18]) cylinder(12, 4.25, 4.25, center=true);
    translate([62, 56, 18]) cylinder(12, 4.25, 4.25, center=true);
    
    translate([48.5, 100-11, -25]) rotate([0, 0, 90]) cylinder(90, 1.85, 1.85, center=true);
    translate([-49.5, 100-11, -25]) rotate([0, 0, 90]) cylinder(90, 1.85, 1.85, center=true);
    translate([48.5, 100-33-11, -25]) rotate([0, 0, 90]) cylinder(90, 1.85, 1.85, center=true);
    translate([-49.5, 100-33-11, -25]) rotate([0, 0, 90]) cylinder(90, 1.85, 1.85, center=true);
    
    

    linear_extrude(20) {
    translate([0, 65, 0]) text("Linux", size=18, spacing=1.05, halign="center", font = "Dejavu Serif:style=Bold");
    }
    
    
    translate([-30, 60, 0]) cube([60, 3, 40]);
}

difference() {
    minkowski(){
            translate([-bracketL/2, 99.5, 4.5]) cube([bracketL, bracketW-1, 3.5]);
        cylinder(1, 1, 0);
    }
    translate([0, 110-38, 9.5]) cube([l-20, w, h], center=true);
    translate([18, 104, 5]) m3Hole();
    translate([-18, 104, 5]) m3Hole();
}


difference() {
    minkowski(){
        translate([-(bracketL-3)/2, 34.5, 4.5]) cube([bracketL-3, bracketW, 3.5]);
        cylinder(1, 1, 0);
    }
    translate([0, 110-38, 9.5]) cube([l-20, w, h], center=true);
    translate([16, 40.5-0.925+0.5, 5]) m3Hole();
    translate([-16, 40.5-0.925+0.5, 5]) m3Hole();
}


module m3Hole()
{
    cylinder(90, 1.85, 1.85, center=true);
}






