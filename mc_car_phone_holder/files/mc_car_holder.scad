// phone holder - part fixed in MC player
// outer part end with ball for holder part
//
$fn=120;
// MC size:
// 3.965x2.524x0.350(0.484vyska0.610)
fixwidth=63.5;
fixheight1=12;
fixwidth1=15.4;
fixheight2=8.5;
fixlength=100;
// ball prumer=17mm vzdalenost od zadladny cca 8mm
balld=17;
balllen=8+balld/2;

module kulicka() {
 translate([balllen,0,0]) { sphere(d=balld); };
 rotate([0,90,0]) cylinder(h=balllen,d=balld/2);
}

module mcinsert() {
  translate([-fixlength/2+2,-fixwidth/2,-fixheight2/2]) cube([fixlength/2,fixwidth,fixheight2]);
}


translate([0,0,fixheight2/2]) {
rotate([0,-15,0]) kulicka();
mcinsert();
}