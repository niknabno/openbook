$fn = 90; //how many faces for circles

include<consts.scad>; //include global vars
include<modules.scad>; //include modules

h=2;//ALUMINIUM_THICKNESS;

METAL_BUFFER = 20; //width of the border and struts
METAL_CUTOUT_W = (w-METAL_BUFFER*3)/2;
METAL_CUTOUT_L = (l-METAL_BUFFER*3)/2;

difference()
{
	cube([w,l,h], center=true);

	//---start cutout for weight saving and backlight---//
	translate([LAPTOP_SOUTH+METAL_BUFFER, LAPTOP_WEETBIX+METAL_BUFFER, -h]) cube([METAL_CUTOUT_W, METAL_CUTOUT_L, h*2]);
        translate([LAPTOP_SOUTH+METAL_BUFFER, LAPTOP_EAST-METAL_BUFFER-METAL_CUTOUT_L, -h]) cube([METAL_CUTOUT_W, METAL_CUTOUT_L, h*2]);
        translate([LAPTOP_NORTH-METAL_BUFFER-METAL_CUTOUT_W, LAPTOP_WEETBIX+METAL_BUFFER, -h]) cube([METAL_CUTOUT_W, METAL_CUTOUT_L, h*2]);
        translate([LAPTOP_NORTH-METAL_BUFFER-METAL_CUTOUT_W, LAPTOP_EAST-METAL_BUFFER-METAL_CUTOUT_L, -h]) cube([METAL_CUTOUT_W, METAL_CUTOUT_L, h*2]);
	//---end cutout for weight savng and backlight---//


	//---start mount points for joining aluminium and 3d print---//
	translate([0,0,-h]) m3Hole();
	translate([w/2-METAL_BUFFER/2,0,-h]) m3Hole();
	translate([w/2-METAL_BUFFER/2,l/2-METAL_BUFFER/2,-h]) m3Hole();
	translate([w/2-METAL_BUFFER/2,-l/2+METAL_BUFFER/2,-h]) m3Hole();
        translate([0,l/2-METAL_BUFFER/2,-h]) m3Hole();
	translate([0,-l/2+METAL_BUFFER/2,-h]) m3Hole();
	//---end mount points for joining aluminium and 3d print---//

	//---start hinge mount point---//
	rotate([0,0,270])
	{
		lidHinge(HINGE_AX);
		smallLidHinge(HINGE_BX);
		lidHinge(HINGE_CX);
	}
	//---end hinge mount point---//
}

