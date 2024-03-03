//module to create centered 15mm wide round edged extrusion for frames
// used as extrusion(length, type_number); //type_number is 0 for flat ends or 1 single rounded end. leave empty for both ends to be rounded
//extrusion_cutout module for cutting holes for extruded pices
// used as extrusion_cut(length);
//extrusion_cut is .5mm larger than the extrusion

module extrusion(x, type)//x for length and type is a number that defines the ends of the extrusion
{
$fn = 36; //define the accuracy of round edges
	if(type == 0)//for not rounding edges
	{
		linear_extrude(x)offset(3) square(9, center = true); //just extrudes round edged square
	}
	else if (type == 1) //rounds one end by attaching hulled spheres to the end and shortening the extrusion
	{
		union()
		{
			hull() //generating the hull spheres for round edges
			{
				translate([4.5, 4.5, 3])sphere(3);
				translate([4.5, -4.5, 3])sphere(3);
				translate([-4.5, 4.5, 3])sphere(3);
				translate([-4.5, -4.5, 3])sphere(3);
			}
			translate([0, 0, 3])linear_extrude(x-3) offset(3) square(9, center = true);//extrusion has to be shorter as 
		}																					//the spheres add 3mm to length
	}
	else //to round both ends by default
	{
		union()
		{
			hull()//generating the hull spheres for round edges
			{
				translate([4.5, 4.5, 3])sphere(3);
				translate([4.5, -4.5, 3])sphere(3);
				translate([-4.5, 4.5, 3])sphere(3);
				translate([-4.5, -4.5, 3])sphere(3);
			}
			hull()//generating the hull spheres for round edges
			{
				translate([4.5, 4.5, x-3])sphere(3);
				translate([4.5, -4.5, x-3])sphere(3);
				translate([-4.5, 4.5, x-3])sphere(3);
				translate([-4.5, -4.5, x-3])sphere(3);
			}
			translate([0, 0, 3])linear_extrude(x-6) offset(3) square(9, center = true);
		}
	}	
}
//---------------------------------------------------------START OF EXTRUSION CUT MODULE---------------------
module extrusion_cut(x)//x for length
{
$fn = 36; //define the accuracy of round edges
	
	linear_extrude(x) offset(3) square(9.5, center = true); //just extrudes round edged square .5mm larger than the extrusion
}

