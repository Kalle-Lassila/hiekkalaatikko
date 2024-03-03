//this is model for project car
//triple_ultrasound_sensor_mount 1.0

include<USS_single.scad>
union()
{
    USS_mount();

    difference()
    {
        hull()
        {
            //hole hull targets for base
            translate([25, 15, 0]) cylinder(r=3, h=3, $fn=36);
            translate([-25, 15, 0]) cylinder(r=3, h=3, $fn=36);
            //hull target for USS_mount
            translate([-25, 6, 0]) cube([50, 1, 3]);
        }
        //hole cutouts
        translate([25, 15, 0]) cylinder(r=1.5, h=5, $fn=36);
        translate([-25, 15, 0]) cylinder(r=1.5, h=5, $fn=36);
    }
    //left mount
    translate([60, 20, 0]) rotate([0, 0, 45]) translate([-5, 0, 0])USS_mount();
    hull()
    {
        //hull target for left mount
        translate([42, 3, 0]) rotate([0, 0, 45]) translate([-5.5, -0.7, 0])cube([1.5, 6, 22]);
        //hull target for center mount->left
        translate([24, 0, 0])cube([1, 6, 22]);
    }

    translate([-60, 20, 0]) rotate([0, 0, -45]) translate([5, 0, 0])USS_mount();

    hull()
    {
        //hull target for rigth mount
        translate([-42, 3, 0]) rotate([0, 0, -45]) translate([3.7, -0.7, 0])cube([1.5, 6, 22]);
        //hull target for center mount->rigth
        translate([-25, 0, 0])cube([1, 6, 22]);
    }
}