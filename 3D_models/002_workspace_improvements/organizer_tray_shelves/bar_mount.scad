bar_radius = 6.1;
$fn = $preview ? 32 : 64;
difference(){
    union(){
        cylinder(15, bar_radius+1, bar_radius+1, false);
        difference(){
            translate([0, 0, 12])
                hull(){
                    translate([bar_radius*2, 0, 0])
                        cylinder(3, bar_radius+1, bar_radius+1, false);
                    cylinder(3, bar_radius+1, bar_radius+1, false);
                }
            translate([bar_radius*2, 0, 12])
                        cylinder(3, 2, 2, false);
        }
    }
    cylinder(10, bar_radius, bar_radius, false);
}