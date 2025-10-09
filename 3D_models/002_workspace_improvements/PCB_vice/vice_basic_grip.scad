//PCB vice V1.0
//
//0.5mm total tolerance for slide shaft
//slide shaft is 10x10mm
tolerance = 1;
ht = tolerance/2;
shaftWidth = 10 + tolerance;
nutWidth = 6;
difference()
{
union()
{
    difference()
    {
        //box for the slide`
        cube([25, 15, 15]);
        //shaft cutout

        translate([0, 2.5-ht,2.5-ht])cube([25, shaftWidth, shaftWidth ]);
    }

    //----------------------------------------------CLAMP
    difference()
    {
        union()
        {
            hull()
            {
                hull()
                {
                    
                    translate([24, 15, 3]) cube([1, 80, 1]);
                    translate([24, 94, 5]) cube([1, 1, 1]);
                    translate([24, 15, 11]) cube([1, 1, 1]);
                    translate([24, 94, 11]) cube([1, 1, 1]);
                }
                translate([15, 30, 7.5]) cube([1, 1, 1]);
            }
            hull()
            {
                translate([15, 30, 7.5]) cube([1, 1, 1]);
                translate([5, 15, 5.5]) cube([1, 1, 4]);
                translate([24, 15, 3]) cube([1, 1, 1]);
                translate([24, 15, 11]) cube([1, 1, 1]);
            }
        }
        //cut for pcb
        translate([24, 15, 6.5]) cube([1, 80, 2]);
    }
    //base for nut
    translate([20, -3, 7.5]) rotate([-90, 0, 0]) cylinder(h=3, r=4, $fn = 36);
}

//nut mount and screw hole
translate([20, -3, 7.5]) rotate([-90, 0, 0]) cylinder(h=6, r=2, $fn = 36);
translate([20, -3, 7.5]) rotate([-90, 0, 0]) cylinder(h=3, d=6, $fn = 6);
}



