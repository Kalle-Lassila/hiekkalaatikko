screw_mount = false; //Set true to add mount points, false for no mount points.
shelf_depth = 200;
shelf_heigth = 57;
support_tube_radius = 6.25;
lip_width = 15;

$fn= $preview ? 32 : 64;
module support_tube()
{
    difference(){
        union(){
            hull(){
                translate([0, 0, 0])
                    cube([3, support_tube_radius+10, 10], false);
                translate([3+support_tube_radius, support_tube_radius+2, 5])
                    cylinder(10, support_tube_radius+2, support_tube_radius+2, true);
            }
            translate([3+support_tube_radius, support_tube_radius+2, (shelf_heigth+3)/2])
                cylinder(shelf_heigth+3, support_tube_radius+2, support_tube_radius+2, true);
        }
    translate([3+support_tube_radius, support_tube_radius+2, (shelf_heigth+3)/2])
        cylinder(shelf_heigth+3, support_tube_radius, support_tube_radius, true);
    }
}

module mounting_ear()
{
    difference(){   
        hull(){
            cube([3, 10, 3], false);
            translate([5, 5, 1.5]) cylinder(3, 5, 5, true);
        }
        translate([5, 5, 1.5]) cylinder(3, 2, 2, true);
    }
}

difference(){
    union(){  
        union(){
            cube([lip_width, shelf_depth, 3], false);
            translate([lip_width, 0, 0]) cube([3, shelf_depth, 10], false);
        }
        translate([lip_width, 0, 0]) support_tube();
        translate([lip_width, shelf_depth-support_tube_radius-10, 0]) support_tube();

        if(screw_mount){
            translate([lip_width+3, 16, 0]) mounting_ear();
            translate([lip_width+3, shelf_depth-10-16, 0]) mounting_ear();
        }
    }
}