// drzak zarazky dveri
$fn=60;
stena = 2;
dout = 28;
din = 11.3;
hh = 12.7;
// hvicka = 27;

module holder_door_stopper() {
    difference() {
         union() {
              cylinder(d=dout,h=stena);
              translate([0,0,stena]) cylinder(d=din,h=hh-2*stena);
              translate([0,0,hh-stena]) cylinder(d1=din,d2=din-stena,h=2*stena);
             }
         union() {
              translate([0,0,stena]) cylinder(d=din-2*stena,h=hh+stena);
             }    
        }
    
}


holder_door_stopper();
