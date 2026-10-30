// 4.6 mm x 4.6mm x 10mm high

include <BOSL2/std.scad>

// ---------------------------------------------------------------------------
// Top level - render (CGAL) by default rather than preview
// ---------------------------------------------------------------------------

render() potentiometer_cover();

// ---------------------------------------------------------------------------
// Dimensions
// ---------------------------------------------------------------------------

pot_width  = 9.6;
pot_length = 9.6;
pot_height = 10.0;

cover_thickness = 0.5;
tab_length = 19.0;

screw_hole_diameter = 0.7;
screw_offset = 11;

print_offset_x = 15;
print_offset_y = 15;
print_offset_z = 0;

anc=BOTTOM;

// ---------------------------------------------------------------------------
// Both printed parts, laid out side by side for printing
// ---------------------------------------------------------------------------

module potentiometer_cover()
{
    pot_sleeve();

    translate ([print_offset_x,print_offset_y,print_offset_z])
        pot_base_plate();
}

// ---------------------------------------------------------------------------
// Sleeve that slides over the potentiometer
// ---------------------------------------------------------------------------

module pot_sleeve()
{
    difference()
    {
        cuboid([pot_width + cover_thickness * 2,pot_length + cover_thickness * 2, pot_height + cover_thickness],anchor=anc); // outer rect
        cuboid([pot_width + cover_thickness,pot_length + cover_thickness, pot_height],anchor=anc); // inner rect
    }
}

// ---------------------------------------------------------------------------
// Base plate with screw tabs and a surround that locates the sleeve
// ---------------------------------------------------------------------------

module pot_base_plate()
{
    difference()
    {
        cuboid([tab_length, pot_length+2, cover_thickness], anchor=anc);       // bottom plate.
        cuboid([pot_width + cover_thickness*2, pot_length + cover_thickness*2, cover_thickness*3], anchor=anc);                    // hole in bottom plate.

        translate ([tab_length - screw_offset,0,-cover_thickness])                  // left screw hole
            cylinder(h=cover_thickness*2,r=screw_hole_diameter,anchor=anc);

        translate ([-tab_length + screw_offset,0,-cover_thickness])
            cylinder(h=cover_thickness*2,r=screw_hole_diameter,anchor=anc);         // right screw hole
    }

    difference()
    {
        cuboid([pot_width+cover_thickness*2 + 2, pot_length+cover_thickness*2 + 1, cover_thickness*3+2], anchor=anc);  // surround plate
        cuboid([pot_width+cover_thickness*2, pot_length+cover_thickness*2, cover_thickness*3+2], anchor=anc);      // hole in surround plate
    }
}
