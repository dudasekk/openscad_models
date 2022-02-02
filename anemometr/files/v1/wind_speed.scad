// Mereni rychlosti vetru
// snad odolna zamrznuti
// vnejsi prumer misky
dmiska = 30;
// tlouska steny misky
stena = 3;
// delka uchytu
luchyt = 3*dmiska;
// vnejsi prumer nosice
dnosic = 70;
// prumer nosne stredni tycky
dtycka = 8;
// vyska tycky
vtycka=20;
// vyska nosice
vnosic = 70;


module miska () {
 difference() {
    sphere(d=dmiska);
    union () {
     translate([0,0,-dmiska/2]) cube(size=dmiska, center=true);
     translate([0,0,-2*stena]) sphere(d=dmiska);
    }
 }
// uchyt
 uchyt_misky();
}

miska();
// translate([0,100,0]) miska();
// translate([1.5*dmiska,100,0]) miska();
// translate([3*dmiska,100,0]) miska();

module uchyt_misky() {
   translate([-stena,dmiska/2-stena/2,0]) cube([2*stena,luchyt,2*stena]);
   translate([-4*stena,dmiska/2+luchyt-stena,0]) cube([8*stena,2*stena,2*stena]);
}


// Nosna cast vnejsi

module venkovninosic() {
    difference() {
      union() {  
         cylinder(h=vnosic+8*stena,d=dnosic);
         // stredni tycka
         translate([0,0,vnosic-vtycka]) cylinder(h=2*vtycka,d=dtycka);
//         translate([0,0,vnosic]) sphere(d=dnosic); 
        }
      union() {
         translate([0,0,-stena]) cylinder(h=vnosic,d=dnosic-2*stena); 
         translate([-4*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) uchyt_misky(); 
         rotate([0,0,120]) translate([-4*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) uchyt_misky(); 
         rotate([0,0,240]) translate([-4*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) uchyt_misky(); 
         // otvor pro vrut/sroub
         translate([0,-(dnosic/2-4*stena),vnosic-2*stena]) cylinder(d=2.5, h=12*stena); 
         rotate([0,0,120]) translate([0,-(dnosic/2-4*stena),vnosic-2*stena]) cylinder(d=2.5, h=12*stena); 
         rotate([0,0,240]) translate([0,-(dnosic/2-4*stena),vnosic-2*stena]) cylinder(d=2.5, h=12*stena); 
        }   
      }  
     // stredni tycka
     translate([0,0,vnosic-vtycka]) cylinder(h=2*vtycka,d=dtycka);
}

// venkovninosic();

module vickonosice() {
    difference() {
      union() {  
         translate([0,0,vnosic+8*stena]) sphere(d=dnosic); 
        }
      union() {
         cylinder(h=vnosic+8*stena,d=dnosic);
         translate([-4*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) uchyt_misky(); 
         rotate([0,0,120]) translate([-4*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) uchyt_misky(); 
         rotate([0,0,240]) translate([-4*stena,-(dmiska/2+luchyt-stena),vnosic+7*stena]) rotate([0,90,0]) uchyt_misky(); 
         // otvor pro vrut/sroub
         translate([0,-(dnosic/2-4*stena),vnosic-stena]) cylinder(d=2.5, h=20*stena); 
         rotate([0,0,120]) translate([0,-(dnosic/2-4*stena),vnosic-stena]) cylinder(d=2.5, h=20*stena); 
         rotate([0,0,240]) translate([0,-(dnosic/2-4*stena),vnosic-stena]) cylinder(d=2.5, h=20*stena); 
         // otvor pro hlavu
         translate([0,-(dnosic/2-4*stena),vnosic+12*stena]) cylinder(d=6, h=12*stena); 
         rotate([0,0,120]) translate([0,-(dnosic/2-4*stena),vnosic+12*stena]) cylinder(d=6, h=12*stena); 
         rotate([0,0,240]) translate([0,-(dnosic/2-4*stena),vnosic+12*stena]) cylinder(d=6, h=12*stena); 
        }   
      }  
}

// vickonosice();
