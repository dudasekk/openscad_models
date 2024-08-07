// case for beehive gsm and solar panel
// solar panel size: 110x69x2.8mm
solw = 69.2;
soll = 110.2;
solh = 2.9;
ram = 2;

wall = 2;

module solarholder(w,l,h)
{
  difference() {
    union() {
      cube([w,l,h]);
    }
    union() {
      translate([0,wall,wall])  cube([w-wall,l-2*wall,h-2*wall]);
      translate([-wall,2*wall,2*wall]) cube([w-2*wall,l-4*wall,h-2*wall]);
    }
  }    
}

module gsmcase() {
  
}

// solarholder(solw+2*wall,soll+2*wall,solh+2*wall);
gsmcase();

