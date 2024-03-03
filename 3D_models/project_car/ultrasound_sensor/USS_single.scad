include<USS_placeholder.scad>

//cl is board clearance per side in printing
cl = 0.3;
//cl2 is used for cutting
cl2 = cl+cl;

//placeholder();
module USS_mount()
{
    translate([-23, 2, 2])
    union()
    {
        //bottom mount
        difference()
        {
            //mount piece
            translate([-2, -2, -2]) cube([50, 6, 6]);
            
            //first and second sensor cutouts
            translate([10, 0, 10])rotate([90, 0, 0])cylinder(r=8.5, h=13, $fn=36);
            translate([36, 0, 10])rotate([90, 0, 0])cylinder(r=8.5, h=13, $fn=36);
            
            //oscillator cutout
            translate([23, 5, 3])
            {
                hull()
                {
                    translate([3.5, 0, 0]) rotate([90, 0, 0]) cylinder(r=3, h=15, $fn=36);
                    translate([-3.5, 0, 0]) rotate([90, 0, 0]) cylinder(r=3, h=15, $fn=36);
                }
            }
            //board cutout
            translate([-cl, -cl, -cl]) cube([46+cl2, 2+cl2, 5+cl2]);
        } //this ends bottom mount piece-------------------------------------------------------------------------------------------
        difference()
        {
            union()
            {
                //left side mount piece
                translate([-2, -2, 4]) cube([4, 6, 16]);
                //corner piece
                difference()
                {
                    translate([2, -2, 3.5]) cube([3, (2-cl), 5]);  
                    translate([10, 0, 10])rotate([90, 0, 0])cylinder(r=8.5, h=13, $fn=36);

                }
            }
            //ic cutout
            translate([0, 1, 5]) cube([3, 3, 10]);
            //board cutout
            translate([-cl, -cl, 4]) cube([2+cl2, 2+cl2, 16]);
            //sensor clearance
            translate([10, 0, 10])rotate([90, 0, 0])cylinder(r=8.5, h=13, $fn=36);
        }//this is the end of left mount piece

        difference()
            {
            union()
            {
                //rigth mount piece
                translate([44, -2, 4]) cube([4, 6, 16]);
                //corner piece
                difference()
                {
                    translate([41, -2, 3.5]) cube([3.5, (2-cl), 5]);
                    translate([36, 0, 10])rotate([90, 0, 0])cylinder(r=8.5, h=13, $fn=36);
                }
            }
            //board cutout
            translate([44, -cl, 4]) cube([2+cl, 2+cl2, 16]);
            //sensor clearance
            translate([36, 0, 10])rotate([90, 0, 0])cylinder(r=8.5, h=13, $fn=36);
        }
    }
}
