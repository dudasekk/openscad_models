// fake aa battery for use with ev3 LiIon battery holder
// AA battery size is diameter 14.5mm; length 50.5mm include plus terminal
// diameter of plus terminal max 5mm; minimal length is 1mm
batdia = 14.4;
batlen = 50.5;
plusterdia = 5;
plusterlen = 2;
fulllen = 4;
hoff = 3.2;
$fn=120;

module battery () {
  difference() {
    union() {
      rotate([270,0,0]) {
        cylinder(d=batdia, h=(batlen-plusterlen)); // battery cell
        translate([0,0,(batlen-plusterlen)]) cylinder(d=plusterdia,h=plusterlen);
       }   
    } // full part
    union() {
      translate([-(batdia/2),fulllen,-(batdia/2-hoff)]) cube([batdia,batlen - 2*fulllen,batdia]); // vybrani pro LiIon
      rotate([270,0,0]) cylinder(d=1,h=batlen); // dira pro drat  
    } // space for LiIon battery
  } // difference
}

battery();

