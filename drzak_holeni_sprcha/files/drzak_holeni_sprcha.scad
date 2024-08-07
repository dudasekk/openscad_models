// Drzak holitek na sprchovou tyc
// navleka se na dolni konzoli
// tloustka steny
wall = 2.5;
// prumer konsole
konsd1 = 42;
// prumer tycky
tycd1 = 27;
// hloubka uchyceni
uchyth = 19;
// sirka drzaku
drzaks = 32;
drzakob = 12;
drzakmez = 22;
pdrz = 4;

module uchyceni() {
//  sirkapasu na drzaky pdrz*(drzaks+2*wall)+(konsd+2*wall)
  sirkapasu = pdrz*(drzaks+2*wall)+(konsd1+2*wall); 
  difference() {
    union() {
      cylinder(h=uchyth+tycd1, d=konsd1+2*wall);
      translate([-(sirkapasu/2),-(konsd1/4),0]) cube([sirkapasu,konsd1/2,wall]);
      translate([-(sirkapasu/2),0,0]) cylinder(h=wall,d=konsd1/2);
      translate([sirkapasu/2,0,0]) cylinder(h=wall,d=konsd1/2);  
    }    
    union() {
      cylinder(h=uchyth+tycd1, d=konsd1);  
      translate([0,(konsd1 + 2*wall)/2,uchyth]) 
        rotate([90,0,0]) 
          cylinder(h = konsd1+2*wall, d = tycd1);  
    }  
   }
}

module drzak() {
  translate([-drzaks/2,0,drzakob/2+wall])
    rotate([0,90,0])
    union() {
    translate([-(drzakob/2+wall), 0 ,0]) cube([wall,3*wall,(drzaks - drzakmez)/2]); 
    translate([-(drzakob/2+wall), 0 ,drzaks-(drzaks - drzakmez)/2]) cube([wall,3*wall,(drzaks - drzakmez)/2]); 
    difference() { 
        union() {
            cylinder(h=drzaks, d=drzakob+2*wall);
            translate([drzakob/2, 0 ,0]) cube([wall,drzaks,drzaks]); 
        } 
        union() { // odcitana cast
           cylinder(h=drzaks,d=drzakob); 
           translate([-(drzakob/2+2*wall), 0 ,0]) cube([drzakob+2*wall,drzakob,drzaks]);
           translate([-(drzakob/2+wall), -drzakob,drzaks/2]) rotate([-90,0,0]) cylinder(h=drzaks, d=drzakmez); 
       }
   }
  }
}



uchyceni();
translate([-(drzaks/2 + konsd1/2 + 2*wall),-(1.5*drzaks)/2,0]) drzak();
translate([-(drzaks + drzaks/2 + konsd1/2 + 4*wall),-(1.5*drzaks)/2,0]) drzak();
translate([(drzaks/2 + konsd1/2 + 2*wall),-(1.5*drzaks)/2,0]) drzak();
translate([(drzaks + drzaks/2 + konsd1/2 + 4*wall),-(1.5*drzaks)/2,0]) drzak();

