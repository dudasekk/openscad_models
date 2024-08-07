//
// mensi cast 18x18mm
cp1 = 30.5;
roh1 = 18;
vroh1 = 11.6;
oble = 40;
delkavnej = 38;
$fn=120;

module tesneni(delka) {
    // profil pro tesneni cast1 (sirka 2.5 vyska 4.8 offset_x 25 )
    translate([1.3,0,0]) cube([2.5,delka,4.8]);
    // profil pro tesneni cast2 (sirka 5.6 vyska 1.6 offset_x 23.7 offset_z 1.2)  
    translate([0,0,1.2]) cube([5.6,delka,1.6]);
}

module centralpart () {
 difference() {
  union() {  
  cube([roh1,roh1,vroh1]);
  intersection(){
       translate([roh1,0,0]) cube([cp1-roh1,cp1,vroh1]);
       translate([roh1,0,vroh1-oble/2]) rotate([270,0,0]) cylinder(d=oble,h=roh1);
      }
  intersection(){
       translate([0,roh1,0]) cube([cp1,cp1-roh1,vroh1]);
       translate([0,roh1,vroh1-oble/2]) rotate([180,270,0]) cylinder(d=oble,h=roh1);
      }
  intersection(){
       translate([roh1,roh1,0]) cube([cp1-roh1,cp1-roh1,vroh1]);
       translate([roh1,roh1,vroh1-oble/2]) rotate([180,270,0]) cylinder(d=oble,h=roh1);
       translate([roh1,roh1,vroh1-oble/2]) rotate([270,0,0]) cylinder(d=oble,h=roh1);
      }
  } // plna cast
  union() { 
    // zahnuty profil vnitrni d=4 vnejsi d=10 stred je roh ctverce
    rotate_extrude(angle = 90) translate([4,0]) square(size = [7, 7.6], center = [10,0,0]);
    // tesneni jednim smerem
    translate([23.7,0,0]) tesneni(cp1-7.5);  
    // tesneni druhym smerem
    rotate([0,0,90]) translate([23.7,-22.7,0]) tesneni(cp1-7.5);  
    // vkladaci otvor
    translate([22.7,22.7,0]) cube([7,7,2.8]);  
  } // vyrezy    
 } // difference
}  

module vnejsiprofil() {
  offset=1.2;  
  translate([offset,0,offset]) 
   difference() {
    union() { 
    cube([roh1-2*offset,delkavnej,vroh1-2*offset]);  
    intersection(){
      translate([roh1-2*offset,0,0]) cube([cp1-roh1,delkavnej,vroh1]);
      translate([roh1-2*offset,0,vroh1-oble/2-2*offset]) rotate([270,0,0]) cylinder(d=oble,h=delkavnej);
     }
    } // hlavni cast   
    union() {
      // velky vyrez
      translate([2.3,0,0]) cube([7.6,delkavnej,6.2]);  
      // drazka pro uchycovaci pasek  
      translate([11.5,0,vroh1-3*offset]) cube([4.8,delkavnej,1.3]);  
      // drazky v prostoru tesneni
      translate([22.8,0,0]) cube([7.0,delkavnej,2.3]);  
      translate([23.6,0,0]) cube([2.6,delkavnej,3.8]);  
    } // odebirane casti
  } // difference 
}

module vnitrniprofil() {
    offset=2.4;
    translate([offset,0,offset]) 
    difference() {
    union() { cube([roh1-2*offset,delkavnej,vroh1-2*offset]);  
              intersection(){
                 translate([roh1-2*offset,0,0]) cube([cp1-roh1,delkavnej,vroh1]);
                 translate([roh1-2*offset,0,vroh1-oble/2-2*offset]) rotate([270,0,0]) cylinder(d=oble,h=delkavnej);
                }
            }
    union() {
      // velky vyrez
      translate([0,0,-1]) cube([8.0,delkavnej,6]);  
      translate([-1,0,-1]) cube([7.6,delkavnej,6]);  
      translate([3.8,0,3.8]) rotate([270,0,0]) cylinder(d=7.6,h=delkavnej);  
      // drazka pro uchycovaci pasek  
      translate([11.5,0,vroh1-2*offset-1.3]) cube([4.8,delkavnej,1.3]);  
      // vybrani u spicky dva valce d=5 a mezi stredy vzdalenost 2.5 fce hull
      translate([cp1-9,0,0]) rotate([270,0,0]) hull() { 
         cylinder(d=5, h=delkavnej);
         translate([2.5,0,0]) cylinder(d=5, h=delkavnej);
        }  
    } // odebirane casti
  } // difference          
}

centralpart();
translate([0,-delkavnej,0]) vnitrniprofil();
translate([0,0,0]) rotate([0,0,90]) vnejsiprofil();
// tesneni(delkavnej);
//vnitrniprofil();