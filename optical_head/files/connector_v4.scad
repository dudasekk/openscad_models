// optical head for electrometer. gas meter, water meter
// With magnet from unimagnet 
// parameters
$fn=60;
stena = 2;
dmagout = 32;
dmagin = 15.8;
hmag = 3;
// vyska drzaku LED
hdrz = 8;
// vyska vyvodni casti
hvyvod = 14;
dkabel = 5.5;
dout = dmagout;
vout = dmagout+2*stena;

module ledconn() {
    difference() {
         union() {
              cylinder(d=dout,h=hdrz);
             }
         union() {
//              translate([3.25,0,0]) cylinder(d=5.2,h=hdrz+stena);
//              translate([-3.25,0,0]) cylinder(d=5.2,h=hdrz+stena);
             translate([0,0,0]) cylinder(d=dout-3*stena,h=hdrz+stena);
             }    
        }
    
}

module connector() {
    difference() {
         union() {
          cylinder(d=vout,h=3*hdrz);   
         }
         union() {
           cylinder(d=1.02*dmagout,h=3*hdrz);
         }
        }
}

connector();
//translate([0,0,hdrz]) ledconn();
