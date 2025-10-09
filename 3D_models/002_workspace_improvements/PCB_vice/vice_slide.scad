//PCB vice V1.0
//a simple slide that can be attatched to the head of an articulated lamp


ds = 4; //screw cutout diameter

module extrude(x) //extrusion
{
    linear_extrude(x)
    {
            offset(1)
            {
                square(8, center = true);
            }
    }
}

union()
{
    translate([0,5,5]) rotate([0, 90, 0]) extrude(170); //slide itself

    translate([85, 5, 9]) rotate([0, 0, 0]) extrude(11); //shaft mount piece

    difference()
    {
        translate([76, 0, 20]) cube([4, 10, 20]); //left mount piece 
        translate([76, 5, 35]) rotate([0, 90, 0]) cylinder(d = ds, h = 5, $fn = 36); //screw cutout
    }
    difference()
    {
    translate([90, 0, 20]) cube([4, 10, 20]); //right mount piece 
    translate([90, 5, 35]) rotate([0, 90, 0]) cylinder(d = ds, h = 5, $fn = 36); //screw cutout
    }

    hull() //left mount hull
    {
        translate([80, 0, 15]) cube([4, 10, 1]); //left mount piece base hull
        translate([76, 0, 20]) cube([4, 10, 1]); //left mount piece hull
    }

    hull() //right mount hull
    {
        translate([90, 0, 20]) cube([4, 10, 1]); //right mount piece hull
        translate([86, 0, 15]) cube([4, 10, 1]); //right mount piece base hull
    }
}