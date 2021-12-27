// Drzak teplomeru do plastoveho okna 
// Thermometer holder to plastic window
// need two same parts - top and bootom holder is identical
// vyska drzaku
hh1=15;
// vnitrni prumer drzaku teplomeru
dht = 37;
// sirka steny
hwidth = 5;
pwidth = 2;
// delka drzaku
lhold = 100;
// odsun kolecka od konce zakladu drzaku
lh2 = 20;
// posun operky od konce zakladu drzaku
lpos = 15;
// odsun diry pro sroubek - musi byt vic nez lh2
lh1 = 50;
// prumer diry pro sroubek
dsr = 5;
// zdvih druheho dilu
lh3 = 7;

translate([lhold+hwidth/2,lh2+dht/2,0])
   difference()
   {
    cylinder(h=hh1, r=(dht/2+hwidth));
    cylinder(h=hh1, r=dht/2);   
   }
difference()
  { 
   cube([lhold,hwidth,hh1]);
   union()
   {
    translate([lhold-lpos,0,hh1/2-hh1/6]) cube([hwidth*1.1,hwidth*1.1,(hh1/3)*1.1]);
    translate([lhold-lh1,hwidth,hh1/2]) rotate([90,0,0]) cylinder(h=hwidth,d=dsr);
   }   
  }
translate([lhold,0,0]) cube([hwidth,lh2,hh1]);  
  
// druhy dil
translate([0, -10, 0])
rotate([90,0,0]) {
 translate([20,0,0]) difference() {   
    cube([lhold-lpos-20,pwidth,hh1]);
    translate([lhold-lh1-20,pwidth,hh1/2]) rotate([90,0,0]) cylinder(h=pwidth,d=dsr);
    } 
 translate([20,0,0]) cube([pwidth,lh3,hh1]);     
 translate([lhold-lpos,0,0]) cube([hwidth,20,hh1]); 
 // zobacek pro zasazeni    
 translate([lhold-lpos,20,hh1/2-hh1/6]) cube([hwidth,hwidth,hh1/3]);   
}  