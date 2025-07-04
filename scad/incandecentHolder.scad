$fn = 90;

include<consts.scad>;
include<modules.scad>;

bulbHolder();

BULB_HOLDER_W = 21;
BULB_HOLDER_H = 10;
BULB_HOLES_DIST = 13;

module bulbHolder()
{
	difference()
	{
		cube([BULB_HOLDER_W, 3, BULB_HOLDER_H]);
		rotate([90, 0, 0])
		{
			translate([4, BULB_HOLDER_H/2, -4])
			{
				m2Hole();
				translate([BULB_HOLES_DIST, 0, 0]) m2Hole();
			}
		}
	}
}
