//this is model for project car
//steering servo mount 1.0


x = 17; //mount height  (adds 0.1mm to height in the hull functions)

//join all together
union()
    {
    difference()
    {
        //servo mount plate 17x33mm 2mm thick
        cube([33, 17, 2]);

        //hole for servo to go trough
        translate([5, 2, 0]) cube([23, 13, 2]);

        //screwhole #1
        translate([2.5, 8.5, 0]) cylinder(r=1.5, h=2, center=false, $fn=36);
        //screwhole #2
        translate([30.5, 8.5, 0]) cylinder(r=1.5, h=2, center=false, $fn=36);
    }
    hull()
    {
        //rear piece for hull
        translate([9, 15, 0]) cube([29, 2, 2]);
        //rear bottom piece to hull
        translate([33, 15, x]) cube([13, 2, 0.1]);
    }

    hull()
    {
        //front piece for hull
        translate([9, 0, 0]) cube([29, 2, 2]);
        //front bottom piece to hull
        translate([33, 0, x]) cube([13, 2, 0.1]);
    }
}