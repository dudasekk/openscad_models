// optical head for electrometer. gas meter, water meter
// With magnet from unimagnet 
// parameters
$fn=60;
stena = 2;
dmagout = 32;
dmagin = 15.8;
hmag = 3;
// vyska drzaku LED
hdrz = 10;
// vyska vyvodni casti
hvyvod = 14;
dkabel = 5.5;
dout = dmagout;
hvicka = hdrz + hvyvod;
vout = dmagout+2*stena;

module led_holder_lower() {
    difference() {
         union() {
              cylinder(d=dout,h=stena/4);
              translate([0,0,stena/4]) cylinder(d=dmagin,h=hdrz);
             }
         union() {
              translate([3.25,0,0]) cylinder(d=5.2,h=hdrz+stena);
              translate([-3.25,0,0]) cylinder(d=5.2,h=hdrz+stena);
              translate([0,-dmagin/2-2,stena+hmag+3]) rotate([270,0,0]) cylinder(d=2.9,h=dmagin/2);
             }    
        }
    
}
module led_holder_upper() {
  difference() {  
      cylinder(d=dmagout,h=hdrz - hmag);
      union() {  
        cylinder(d=dmagin,h=hdrz - hmag);
        translate([0,-dmagout/2-2,hdrz-hmag-3]) rotate([270,0,0]) cylinder(d=2.9,h=(dmagout-dmagin));
      } 
     } 
}

module vicko() {
    difference() {
         union() {
          cylinder(d=vout,h=hvicka);
          hull() {
           cylinder(d=vout,h=hvyvod);
           translate([vout,0,0]) cylinder(d=dmagin,h=hvyvod);   
          }   
         }
         union() {
           translate([0,0,stena]) cylinder(d=1.02*dmagout,h=hvicka);
           translate([dout/4,0,hvyvod/2]) rotate([0,90,0]) cylinder(d=dkabel,h=vout);  
           translate([-dmagout/2-2,0,hvicka-stena-hmag-3]) rotate([0,90,0]) cylinder(d=2.9,h=(dmagout-dmagin));
         }
        }
}


led_holder_lower();
translate([1.5*dmagout,0,0]) led_holder_upper();
translate([0,1.5*dmagout,0]) vicko();

