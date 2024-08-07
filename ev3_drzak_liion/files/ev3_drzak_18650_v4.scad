// ramecek
fullx = 64;
fully = 86;
fullz = 8;
// klec na 2x LiIon 18650
bkx = 41;
bky = 76;
bkz = 23;
// obrysovy ramecek
orstena = 1.5;
orz = 3;

// kontakt baterie na strane pevnych uchytu
batxminus = 8;
batxplus = 5.8;
batx = 2.8;
baty = 7;
batyminus = 7.8;
batyplus = 80;
batz = 13;
batzzero = 7.8;

// ohyby pro pant 
pantypos1 = 24;
pantypos2 = 64;
panty = 12;
pantd = 1.6;
panto = 1.5;
pantz = fullz+orz+pantd;

// spony: obracene U vyska 9mm, sirka 12mm hloubka 5mm
sponax = 4.5;
sponay = 11;
sponaz = 9;
sponad = 1.7;


posxvypl = (fullx - bkx)/2;
posyvypl = (fully - bky)/2;
poszvypl = 0;

module zaklblok() {
   cube([fullx,fully,fullz]);
   translate([0,0,fullz]) { cube([fullx,orstena,orz]);}
   translate([0,0,fullz]) { cube([orstena,fully,orz]);}
   translate([fullx-orstena,0,fullz]) { cube([orstena,fully,orz]);}
   translate([0,fully-orstena,fullz]) { cube([fullx,orstena,orz]);}
}

module batconn() {
   translate([batxminus,batyminus - baty/2,batzzero]) cube([batx,baty,batz]);
   translate([batxplus,(batyplus-baty/2),batzzero]) cube([batx,baty,batz]);
}

module pant() {
  difference() {
    union() {
      cube([pantd,panty,pantz]);
      translate([-2*pantd,0,pantz]) cube([3*pantd,panty,pantd]); 
    }
    union() {
    translate([-pantd*0.1,0,pantz+2.7*pantd]) rotate([0,135,0]) cube([pantd,panty,pantd*2.7]);
    }
  }  
}
  
module panty() {
   translate([0,pantypos1 - panty/2,0]) pant();
   translate([0,pantypos2 - panty/2,0]) pant();
}

module spony() {
 translate([fullx-pantd,pantypos1 - sponay/2,0]) spona();
 translate([fullx-pantd,pantypos2 - sponay/2,0]) spona();   
}
module spona() {
    difference() {
      union() {  // plna cast
        cube([sponax,sponay,fullz+orz+sponaz-sponax/2]);
        translate([sponax/2,0,fullz+orz+sponaz-sponax/2])
          rotate([270,0,0])
            cylinder(h=sponay,d=sponax,$fn=120);
        translate([sponax-0.3,sponay/2-2,fullz+orz+0.7])
          rotate([0,-10,0])
            cube([1,4,4]);
      }
      union() {  // odebrana cast
        translate([sponax/2-sponad/2,0,0]) {
          cube([sponax-2*sponad,sponay,fullz+orz+sponaz-sponax/2]);
          translate([sponax/2-sponad,0,fullz+orz+sponaz-sponax/2])
            rotate([270,0,0])
              cylinder(h=sponay,d=sponax-2*sponad,$fn=120);  
        }
       }              
      }
}

module drzak() { 
difference() {
  union(){  
    zaklblok();
    batconn();  
    panty();
    spony();  
   }  
  union() {
    translate([posxvypl,posyvypl,poszvypl])
      cube([fullx-2*posxvypl,fully-2*posyvypl,fullz]);
      }
  }
}
  
drzak();
//pant();
//spona();