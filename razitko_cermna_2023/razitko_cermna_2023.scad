// Razitko Harry Potter - bryle a blesk
// cca 3cm celkový průměrand
// výška reliéfu cca 2mm
razd = 30;
relh = 2;
stopa = 1;
// bryle
obrd = 9;
spojka = 5;
// blesk
blx = 8;
bly = 18;

module blesk() {
  linear_extrude(relh) resize([6,11,1]) import("flash.svg", convexity=3);
}

module obroucka() {
    difference() {
      cylinder(d=obrd,h=relh);  
      cylinder(d=obrd-2*stopa,h=relh);
     }
 }

// obloucek
module spojka() {
  intersection() {
    translate([-0.65*spojka,0,0]) cube([1.3*spojka,spojka,relh]);  
    translate([0,-1.2*obrd,0]) difference() {
      cylinder(d=3*obrd,h=relh);  
      cylinder(d=3*obrd-2*stopa,h=relh);
     }
   }  
 }

module bryle() {
 translate([(spojka+obrd)/2,razd/4-obrd/2,0]) obroucka();
 translate([-(spojka+obrd)/2,razd/4-obrd/2,0]) obroucka();
 translate([0,razd/4-obrd/2,0]) spojka();
}


module razitko() {
cylinder(d=razd, h= relh);
translate([0,0,relh]) difference() {
    cylinder(d=razd, h= relh);
    cylinder(d=razd-2*stopa, h=relh);
}
translate([0,relh,relh]) bryle();
translate([-1.4,-7,relh]) blesk();
}

// blesk();
// spojka();
razitko();