//PCB vice tolerance test V1.0
//
//

rodWidth = 11; // cut out for rod


difference()
{
    cube([20, 15, 15], center = true);
    cube([20, rodWidth, rodWidth], center = true);
}