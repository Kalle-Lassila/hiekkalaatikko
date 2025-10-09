
x= 150;
union(){
    //front side
    hull(){
    cube([5,5,0.35]);
    translate([x,0,0]) cube([5,5,0.35]);
    }

    //left
    hull(){
        
    cube([5,5,0.35]);
    translate([0,x,0]) cube([5,5,0.35]);
    }

    //rigth
    hull(){
    translate([x,x,0])
    cube([5,5,0.35]);
    translate([x,0,0]) cube([5,5,0.35]);
    }

    //rear

    hull(){
    translate([x,x,0])
    cube([5,5,0.35]);
    translate([0,x,0]) cube([5,5,0.35]);
    }

    //cross
    hull(){
    translate([x,x,0])
    cube([5,5,0.35]);
    translate([0,0,0]) cube([5,5,0.35]);
    }
    hull(){
    translate([0,x,0])
    cube([5,5,0.35]);
    translate([x,0,0]) cube([5,5,0.35]);
    }
}
