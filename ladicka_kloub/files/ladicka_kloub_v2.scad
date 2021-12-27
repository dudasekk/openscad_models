// Kloub ladicky na kytaru
// Chceme kruznice 
$fn=120;

// dolni cast je valec vnejsi prumer 9,7mm, vyska 8mm
// ve spodni casti zuzeny na vnejsi prumer 8.7 vyska 1.6mm
// vybrani v horni casti prumer 6.6 hloubka 5.8
// vybrani dole ma prumer 7.5 a hloubku 0.8
// uprostred vede dira pro sroubek prumer 4.8

module otocna() {
  difference() {
    union () { cylinder(d=8.7, h=1.6);
      translate([0,0,1.6]) { cylinder(d=9.7, h=(8-1.6)); };
    }  
    union() {
        translate([0,0,-0.1]) {
            union () {
              cylinder(h=0.9,d=7.5); // dolni vybrani
              cylinder(h=8.2,d=4.8); // stredni dira
              translate([0,0,(8-5.8)]) cylinder(h=6,d=6.6); // horni vybrani
             }   
        }    
    }
  }  
}

// ousko je dvakrat nalepeno na dolni casti nastojato
// v horni casti ma diru pro sroubek a vybrani pro hlavu/maticku
// je to oval sire 8.4 a delky 12mm; tloustka je 2.8mm
// dira pro sroubek je prumeru 2mm
// vybrani je do hloubky 1.9mm prumer 3.6mm
// maticka je do hloubky 1.9mm prumer 5mm $fn=6
module ousko () {
    mpr = 9.6;
    posun = 12 - mpr;
    difference() {
      hull() {
         cylinder(h=3,d=mpr);
         translate([posun,0,0]) cylinder(h=3,d=mpr);
       }; // end of hull  
       translate ([0,0,-0.1]) {
         union () { 
           cylinder(d=2,h=3);
           translate ([0,0,(3 - 2) ]) cylinder(d=3.6,h=2.2); 
          } // union dira a sroubek
       } // translate kvuli otvoru
     } //    
}
module ouskomatka () {
    mpr = 9.6;
    posun = 12 - mpr;
    difference() {
      hull() {
         cylinder(h=3,d=mpr);
         translate([posun,0,0]) cylinder(h=3,d=mpr);
       }; // end of hull  
       translate ([0,0,-0.1]) {
         union () { 
           cylinder(d=2,h=3);
           translate ([0,0,(3 - 2) ]) cylinder(d=4.6,h=2.2,$fn=6); 
          } // union dira a sroubek
       } // translate kvuli otvoru
     } //    
}

color("yellow") otocna();
color("blue") translate([-3.05,0,12]) rotate([0,90,180]) ousko();
color("red") translate([3.05,0,12]) rotate([0,90,0]) ouskomatka();
