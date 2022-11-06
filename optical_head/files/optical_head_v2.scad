// optical head for electrometer. gas meter, water meter
// With magnet from unimagnet 
// parameters
$fn=60;
stena = 2;
dmagout = 32;
dmagin = 15.8;
hmag = 3;
dout = dmagout+2*stena;
hvicka = 27;

module led_holder_lower() {
    difference() {
         union() {
              cylinder(d=dout,h=stena);
              translate([0,0,stena]) cylinder(d=dmagin,h=2*hmag);
             }
         union() {
              translate([3.25,0,0]) cylinder(d=5.2,h=2*hmag+stena);
              translate([-3.25,0,0]) cylinder(d=5.2,h=2*hmag+stena);
             }    
        }
    
}
module led_holder_upper() {
  difference() {  
      cylinder(d=dmagout,h=hmag);
      cylinder(d=dmagin,h=hmag);
     } 
}

module vicko() {
    difference() {
         union() {
          cylinder(d=dout,h=hvicka);
          hull() {
           cylinder(d=dout,h=hvicka/2);
           translate([dout,0,0]) cylinder(d=dmagin,h=hvicka/2);   
          }   
         }
         union() {
           translate([0,0,stena]) cylinder(d=1.02*dmagout,h=hvicka);
           translate([dout/4,0,hvicka/4]) rotate([0,90,0]) cylinder(d=hvicka/4,h=dout);  
         }
        }
}


// led_holder_lower();
// translate([1.5*dmagout,0,0]) led_holder_upper();
translate([0,1.5*dmagout,0]) vicko();

