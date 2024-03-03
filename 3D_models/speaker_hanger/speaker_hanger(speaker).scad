

$fn =36; //to smooth the sides

//difference to create the screwhole
difference(){
	
//outer layer of the hanger (the base)
cylinder(5, 5, 10);

//screwhole
cylinder(5, 2, 2);
	//caviot for the screw top to hide in
	translate([0, 0, 3]){
		cylinder(2, 2, 4);
	}
//}