//what if I just made the whole lid out of carbob fibre

$fn = 90;

include<consts.scad>;
include<modules.scad>;

h=2;


difference()
{
	minkowski()
	{
		cube([l,w,h], center=true);
		cylinder(0.00000000000000001,0.0000000000000001, 3);
	}

	lidHinge(HINGE_AX);
        smallLidHinge(HINGE_BX);
        lidHinge(HINGE_CX);

        translate([LAPTOP_EAST,0,-h]) m3Hole();
        translate([LAPTOP_WEETBIX, 0,-h]) m3Hole();
        translate([LAPTOP_WEETBIX,LAPTOP_NORTH,-h]) m3Hole();
        translate([0,LAPTOP_NORTH,-h]) m3Hole();
        translate([LAPTOP_EAST,w/2,-h]) m3Hole();

	translate([0, LAPTOP_SOUTH+25, -5])
        {
                screenMountHoles();
                translate([-138.5-1.5-4, 192-7, 5]) cube([14.5,11.25,5]);
                translate([138.5+1.5-14.5, 192-7, 5]) cube([14.5,11.25,5]);
        }
	//cutout for hinge to fit.
	translate([-159, -w/2-10, -20]) cube([232, 13.5, 30]);

}


translate([0,0,h])
difference()
{

        minkowski()
        {
                cube([l,w,h], center=true);
                cylinder(0.00000000000000001,0.0000000000000001, 3);
        }
	//cutout inside
	cube([l-10,w-10,h*2], center=true);
	//cutout for hinge barrel
	translate([-159, -w/2-12.5, -10]) cube([232, 20, 30]);
}
