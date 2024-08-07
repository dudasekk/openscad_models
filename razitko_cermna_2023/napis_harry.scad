// Napis Harry Potter
// Using free font Harry_P
use <HARRYP__.TTF>

relh = 2;

module razitko() {
  
     difference() {
      linear_extrude(2*relh) {
        offset(r = 2.6*relh) text("Harry Potter", font = "Harry P");
      }
      translate([0,0,relh]) linear_extrude(relh) {
        offset(r = 2.2*relh) text("Harry Potter", font = "Harry P");
      }
    }  
  translate([0,0,relh]) linear_extrude(relh) {
     text("Harry Potter", font = "Harry P");
  }

}
 
razitko(); 