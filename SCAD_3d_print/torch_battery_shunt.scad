// Old batt: 2.94V - doesn't work at all in or out of the tube with wires.
// New batt: 3.53V - works out of tube with wires, not in the tube.
// test batt: 3.70V - works out of tube with wires.

// Hypothesis 16 Nov: the button isn't mating to the positive terminal of torch

// currently charge light flashes on very briefly when end cap installed - this is different to there not being any battery present, suggesting lack of connection at postive end. Same thing happens with old battery in place though.


// Newly measured old battery length inc button == 85.7mm

// New battery length inc button == 69.5mm

// New button shunt length = 18mm inc button

// Current length new batt+shunt = 87.5mm   (--> target is 85.7mm)
// take off 1.8 mm

// Original battery dimensions (26800 cell)
// Dia: 26.8 mm   Length: 85.9 mm      Length without +ve: 84.7 mm


// ACTUAL NEW BATTERY DIMENSIONS
// Dia: 26.1mm Body Length: 68mm.2, flat button length: 1.3mm



// old batt jacket protusion at +ve is 0.4mm




// Length of shunt (inc. button) needed: 85.9mm - 68.2mm - 1.3mm = 16.4 mm

// starting length of shunt: 18.4mm centre, 17.77mm edge
//      (remove 2mm from centre, and then form button)

// keep flat end for connection against new battery +ve

// old battery button dimensions:
 
        // button length: 1.3mm
        // base diameter 9.5mm
        // top diameter  7.4mm
        // indentation: 0.43mm





// Measured Torch internal diameter: 27.6mm

// Advertised New battery dimensions
// Dia: 26.5 mm (not measured) Length: 68.2mm


// Veroboard of 1.3mm at both ends

// Allow Solder on top of veroboard 1mm at both ends

// Allow 1mm end caps

// Length of shunt == 85.9 - 68.2 - 1.3x2 - 1.0x2 - 1.0x2 = 11.1 mm

// Target print outer dimensions: 27mm outer, 25mm inner. 13.1mm length

// Two pieces: Open cylinder length 

include <BOSL2/std.scad>

translate([0,0,5.55])
    tube(od=27,wall=2,l=7.1);

translate([0,0,1])
    tube (od=27,wall=10,l=2);       // LED cap 2mm


translate([30,0,0])
{
    //translate([0,0,6.55+5.55+1])
    translate([0,0,1])
        tube (od=27,wall=10,l=2);       // USB cap 2mm

    translate([0,0,2])
    {
   
        rotate(a=[0,0,0])
            difference()
            {
                pie_slice(h=2,d=24,ang=30);
                pie_slice(h=2,d=20,ang=30);
            }
            
        rotate(a=[0,0,90])
            difference()
            {
                pie_slice(h=2,d=24,ang=30);
                pie_slice(h=2,d=20,ang=30);
            }

        rotate(a=[0,0,180])
            difference()
            {
                pie_slice(h=2,d=24,ang=30);
                pie_slice(h=2,d=20,ang=30);
            }
            

        rotate(a=[0,0,270])
            difference()
            {
                pie_slice(h=2,d=24,ang=30);
                pie_slice(h=2,d=20,ang=30);
            }

    }
}
