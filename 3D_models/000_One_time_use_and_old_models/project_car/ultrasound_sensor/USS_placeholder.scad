//this is model for project car
//triple_ultrasound_sensor_mount_1.0
//sensor placeholder

module placeholder(){
    //sensor placeholder
    cube([46, 2, 20]);
    translate([10, 0, 10])rotate([90, 0, 0])cylinder(r=8, h=13, $fn=36);
    translate([36, 0, 10])rotate([90, 0, 0])cylinder(r=8, h=13, $fn=36);
    translate([18, 2, 17]) cube([10, 5, 10]);
}
