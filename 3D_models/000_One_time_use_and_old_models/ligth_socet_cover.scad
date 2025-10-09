//light socket cover

//________________________________________________COMMENT THIS WHEN EDITING FOR FASRER RENDERING__________________________________
$fn=360;
//line above sets the number of fracmetnts in rounded edges, is slow as hell to render when enabled

//base diameter 115mm
//base width is propably good at 3mm
difference(){
cylinder(3, d=115);			//this is the base of the cover

//7mm long and 4mm wide holes 65mm apart
// so propably 8 and 5 millimeters so the screws fit through

translate([35, 0, 0]){
	hull(){
		cylinder(3, d=5);					//two cylinders hulled together to make nice rounded hole for screws
		translate([3, 0, 0])
			cylinder(3, d=5);
	}//end of hull
}//end of translate to the right

translate([-35, 0, 0]){						//this is a copy of the function above just modified to make another 
	hull(){									// hole.
		cylinder(3, d=5);					//two cylinders hulled together to make nice rounded hole for screws
		translate([-3, 0, 0])
			cylinder(3, d=5);
	}//end of hull
}//end of translating hole models to the left

//hole for the wiring
//24x50mm is propably big enough
hull(){
	translate([13, 0, 0])					
		cylinder(3, 12, 12);				//RADIUS USED HERE!!
	
	translate([-13, 0, 0])
		cylinder(3, 12, 12);				//RADIUS USED HERE!!
}//end of hull



}//difference to cut holes in base