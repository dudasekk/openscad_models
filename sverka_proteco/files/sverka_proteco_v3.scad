// packa proteco
// ph1 ... vyska packy
// dira pro rotaci
// zap ... hloubka zapusteni
// dd1 ... prumer diry
// dd2 ... prumer zapusteni
$fn=30;

ph1 = 17;
zap = 3;
dd1 = 5.5;
dd2 = 10;

module dira_pro_cep() {
  union () {
    cylinder(d=dd1, h=ph1);
    cylinder(d=dd2, h=zap);
    translate([0,0,ph1-zap]) { cylinder(d=dd2, h=zap); }; 
   };
}

module packa() {
  difference () {
    union() {  
    hull() {
      translate([2,2,0]) cylinder(r=2,h=ph1);  
      translate([26,17,0]) cylinder(r=2,h=ph1);  
      translate([56,8,0]) cylinder(r=2,h=ph1);  
      translate([36,20,0]) cylinder(r=6,h=ph1);  
    };
    hull() {
      translate([36,20,0]) cylinder(r=6,h=ph1);  
      translate([26,10,0]) cylinder(r=2,h=ph1);  
      translate([104,-20,0]) cylinder(r=6,h=ph1);  
      translate([106,-18,0]) cylinder(r=6,h=ph1);  
    //  translate([96,-16,0]) cylinder(r=6,h=ph1);  
    };
   };
    translate([35,15,0]) { dira_pro_cep(); }; 
};
}

// packa 
   packa();


//difference () {
//  linear_extrude(height = ph1, center = false) { 
//      union() {
//        polygon([[0,0],[40,0],[40,22]], paths=[[0,1,2]]);
//        difference() {
//          translate([70,-80,0]) difference() {
//             polygon([
//             circle(r=65);
//            };
//      union() {
//         polygon([[-30,0],[190,0],[190,-190],[-30,-190]], paths=[[0,1,2,3]]);
//         // zkraceni packy
//         difference() {
//           polygon([[120,60],[190,60],[190,-190],[75,-190]], paths=[[0,1,2,3]]);
//           translate([100,15,0]) circle(d=25);
//          };
//        };
//      };
//    };
//   }; 
//   union () {
//     translate([35,15,0]) { cylinder(d=dd1, h=ph1); };
//     translate([35,15,0]) { cylinder(d=dd2, h=zap); };
//     translate([35,15,ph1-zap]) { cylinder(d=dd2, h=zap); }; 
//    };
//   }; 

