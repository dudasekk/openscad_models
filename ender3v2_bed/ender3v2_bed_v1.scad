xsize = 230;
ysize = 230;
txt1 = "CREALITY";
txt1size = 30;
txt2 = "Ender 3 V2";
txt2size = 20;

module deska() {
  difference() {
    square([xsize,ysize],center=true);
    union() {
        text(txt1, size = txt1size, halign= "center", valign = "baseline");
        translate([0,-(ysize/2)+txt2size,0])
           text(txt2, size = txt2size, halign= "center", valign = "baseline");
    } // union text
  }  // difference
} // module deska

linear_extrude(height = 2) {
  deska();
} // linear extrude  
   
