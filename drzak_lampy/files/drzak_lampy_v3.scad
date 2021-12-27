// Drzak lampy - lupy -- nabytek ma presah na konci policky
// Lamp holder -- furniture has .... 
// vyska zkoseni
vkonus=50;
// vyska dolni casti - musi byt aspon v2haku + vhaku + stena
vbottom=36;
// prumer dolni casti
dholder = 80;
// prumer diry v drzaku
dlamp = 13;
// tloustka steny 
stena = 5;
// seriznuti bloku z dholder/2 na 
seriznuti = 33;
// tloustka haku 
vhaku = 7;
// sirka haku
mhaku = 30;
// prumer sroubku v haku
dsroubek = 5;
// posuv haku proti zakladne
v2haku = 24;
// drzak sroubu pro utazeni - 10mm pod vrcholem
vuta = (vbottom + vkonus - 10);
// prumer sroubu pro utazeni
duta = 5.5;
// matice M5 ma vnejsi prumer 8.8
dmuta = 8.9;
// delka zavitu
luta = 18;
// kontrola vbottom proti posuvu haku 
vbmin = v2haku + vhaku + stena;
if ( vbmin > vbottom) { 
    echo ("vbottom ma byt vetsi nez vbmin: vbottom = ", vbottom, ";vbmin=", vbmin );
    } 
color("red") {
  difference() {  
   difference() {
     union() {
         cylinder(h=vbottom, d=dholder); // dolni valec
         translate([0,0,vbottom]) {
           cylinder(h=vkonus, d1=dholder, d2=(dlamp + 2*stena)); 
         }; // zkosena cast
         // drzak sroubu pro utazeni
         translate([dlamp/2,0,(vuta-stena)])
               rotate([0,90,0]) cylinder( h = luta, d = (duta+2*stena));
     } // zakladni blok
     translate([seriznuti,-seriznuti,-1]) 
            cube([seriznuti,2*seriznuti, (vbottom + vkonus/2)]);
   }; // zaklad se seriznutym blokem  
  union () {
    // dira pro hak
    translate([-(mhaku/2)-1,-(mhaku/2), v2haku])
      cube([seriznuti+mhaku/2+2, mhaku, vhaku]);
    // dira pro sroubek    
    translate([0,0,-1]) cylinder(h = vbottom, d = dsroubek);
    // dira pro zasazeni lampy  
    translate([0,0,vbottom-1]) cylinder(h = vkonus+2, d = dlamp);  
    // dira pro sroubek a maticku pro utazeni zasazeni  
    translate([dlamp/2-1,0,(vuta-stena)])
            rotate([0,90,0]) 
              union () {
                  cylinder(h=4, d=dmuta, $fn = 6);
                  cylinder(h=luta+2, d=duta);  
              } 
    }   
 } // vyriznuty otvor pro hak a sroubek
}
