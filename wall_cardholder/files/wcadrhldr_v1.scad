// Card holder to wall
// card size
cardWidth = 86.2;
cardLength = 54.3;
cardHight  = 1.3;
ram = 10;

wall = 3.5;

module zakladna(w,l,h)
{
    difference() {
        cube ( [w, l, h] );
        union() {
            // otvory pro vruty
            translate([2*ram, 2*ram, 0]) hlvrutu(3,wall);
            translate([w-2*ram, l-2*ram, 0]) hlvrutu(3,wall);
            // otvor pro kartu
            translate([ram/2, ram/2, wall]) cube([cardWidth,cardLength+ram,cardHight]);
            // okenko
            translate([ram/2+cardHight, ram/2+cardHight, wall+cardHight]) cube([cardWidth-2*cardHight,cardLength+ram,cardHight]);
        } // union odectene casti
    } // diff  
}

module hlvrutu(otvor,vyska) {
   cylinder(d=otvor,h=vyska/3,$fn=60);
   translate([0,0,vyska/3]) cylinder(d1=otvor,d2=2.8*otvor,h=2*vyska/3,$fn=60); 
}

zakladna(cardWidth+ram,cardLength+ram,wall+2*cardHight);
// hlvrutu(3,wall);

