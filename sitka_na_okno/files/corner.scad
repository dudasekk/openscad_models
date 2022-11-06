//
// mensi cast 18x18mm
cp1 = 30.5;
roh1 = 18;
vroh1 = 11.6;
$fn=120;

module centralpart () {
  cube([roh1,roh1,vroh1]);
  intersection(){
       translate([roh1,0,0]) cube([cp1-roh1,cp1,vroh1]);
       translate([roh1,0,vroh1-20]) rotate([270,0,0]) cylinder(d=40,h=roh1);
      }
  intersection(){
       translate([0,roh1,0]) cube([cp1,cp1-roh1,vroh1]);
       translate([0,roh1,vroh1-20]) rotate([180,270,0]) cylinder(d=40,h=roh1);
      }
  intersection(){
       translate([roh1,roh1,0]) cube([cp1-roh1,cp1-roh1,vroh1]);
       translate([roh1,roh1,vroh1-20]) rotate([180,270,0]) cylinder(d=40,h=roh1);
       translate([roh1,roh1,vroh1-20]) rotate([270,0,0]) cylinder(d=40,h=roh1);
      }
}

centralpart();