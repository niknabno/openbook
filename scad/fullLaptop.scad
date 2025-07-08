include<consts.scad>;
rotate([5, 0, 0])
{
	color([0.5,0.5,0.5])
	{
		//rotate([180,0,0]) translate([0,0,-h+4.5]) import("../stl/lid.stl");
		import("../stl/base.stl");
		rotate([0,180,0]) translate([0,0,7]) import("../stl/psu.stl");
		//translate([0,0.5,h/2+5]) import("../stl/top.stl");
	};

	rotate([-10, 0, 0])
	{
		color([0.5,0.5,0.5]) rotate([90,0,0]) translate([0,w/2+h+12,LAPTOP_SOUTH-5]) import("../stl/lid.stl");
		color([1,1,1])
		{
			rotate([90,0,0]) translate([0,w/2+h+9+12,LAPTOP_SOUTH-3]) cube([l, w-18, 2], center = true);
		};
	}
       	color([1,1,1]) translate([-150, 50, 11]) cube([220, 40, 1]);

};
