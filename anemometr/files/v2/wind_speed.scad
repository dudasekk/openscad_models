// Mereni rychlosti vetru
// snad odolna zamrznuti
// vnejsi prumer misky
dmiska = 50;
// tlouska steny misky
stena = 2;
// delka uchytu
luchyt = 75;
// vnejsi prumer nosice
dnosic = 50;
// prumer nosne stredni tycky
dtycka = 8;
// vyska tycky
vtycka=20;
// vyska nosice
vnosic = 50;


module miska () {
 difference() {
    sphere(d=dmiska);
    union () {
     translate([0,0,-dmiska/2-0.01]) cube(size=dmiska, center=true);
     translate([0,0,-4*stena]) sphere(d=dmiska);
    }
 }
// uchyt
 uchyt_misky();
}


module uchyt_misky() {
   translate([-stena,dmiska/2-stena/2,0]) cube([2*stena,luchyt,2*stena]);
   translate([-4*stena,dmiska/2+luchyt-stena,0]) cube([8*stena,2*stena,2*stena]);
}


// Nosna cast vnejsi

module venkovninosic() {
    difference() {
      union() {  
         cylinder(h=vnosic+8*stena,d=dnosic);
        }
      union() {
         translate([0,0,-stena]) cylinder(h=vnosic,d=dnosic-2*stena); 
         translate([-5*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) scale([1.05,1.05,1.05])uchyt_misky(); 
         rotate([0,0,120]) translate([-5*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) scale([1.05,1.05,1.05])uchyt_misky(); 
         rotate([0,0,240]) translate([-5*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) scale([1.05,1.05,1.05]) uchyt_misky(); 
         // otvor pro vrut/sroub
         translate([0,-(dnosic/2-4*stena),vnosic-2*stena]) cylinder(d=3, h=12*stena,$fn=120); 
         rotate([0,0,120]) translate([0,-(dnosic/2-4*stena),vnosic-2*stena]) cylinder(d=3, h=12*stena,$fn=120); 
         rotate([0,0,240]) translate([0,-(dnosic/2-4*stena),vnosic-2*stena]) cylinder(d=3, h=12*stena,$fn=120); 
        }   
      }  
     // stredni tycka
     translate([0,0,vnosic-vtycka]) cylinder(h=vtycka,d=dtycka,$fn=120);
}

// Vnitrni cast budou dva dute valce horni s uchycenim pro lozisko vnejsi casti
// Dolni pak bude drzaky sensoru s vnejsi drazkou pro vytapeni
// Po nasunuti do sebe se budou zajistovat tremi srouby v dolni casti
module vnitrninosic1() {
difference() {
  cylinder(h=vnosic,d=dnosic-3*stena);
  union() {
    translate([0,0,2*stena]) cylinder(h=vnosic,d=dnosic-5*stena);
    translate([(dnosic-5*stena)/4,0,0]) cylinder(h=2*stena, d=4);
    rotate([0,0,120]) translate([(dnosic-5*stena)/4,0,0]) cylinder(h=2*stena, d=4);
    rotate([0,0,240])translate([(dnosic-5*stena)/4,0,0]) cylinder(h=2*stena, d=4);
      }
  }
}

module vickonosice() {
    difference() {
      union() {  
         translate([0,0,vnosic+8*stena]) sphere(d=dnosic); 
        }
      union() {
         cylinder(h=vnosic+8*stena,d=dnosic);
         translate([-5*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) scale([1.05,1.05,1.05]) uchyt_misky(); 
         rotate([0,0,120]) translate([-5*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) scale([1.05,1.05,1.05]) uchyt_misky(); 
         rotate([0,0,240]) translate([-5*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) scale([1.05,1.05,1.05]) uchyt_misky(); 
         // otvor pro vrut/sroub
         translate([0,-(dnosic/2-4*stena),vnosic-stena]) cylinder(d=3, h=20*stena,$fn=120); 
         rotate([0,0,120]) translate([0,-(dnosic/2-4*stena),vnosic-stena]) cylinder(d=3, h=20*stena,$fn=120); 
         rotate([0,0,240]) translate([0,-(dnosic/2-4*stena),vnosic-stena]) cylinder(d=3, h=20*stena,$fn=120); 
         // otvor pro hlavu
         translate([0,-(dnosic/2-4*stena),vnosic+12*stena]) cylinder(d=6, h=12*stena,$fn=120); 
         rotate([0,0,120]) translate([0,-(dnosic/2-4*stena),vnosic+12*stena]) cylinder(d=6, h=12*stena,$fn=120); 
         rotate([0,0,240]) translate([0,-(dnosic/2-4*stena),vnosic+12*stena]) cylinder(d=6, h=12*stena,$fn=120); 
        }   
      }  
}

$fn=120; 
// miska();
// translate([0,100,0]) miska();
// translate([1.5*dmiska,100,0]) miska();
// translate([3*dmiska,100,0]) miska();
// venkovninosic();
// vickonosice();
vnitrninosic1();
