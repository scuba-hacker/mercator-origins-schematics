#include <BOSL2/std.scad>

$fs = 1;

// edge descriptors
// https://github.com/BelfrySCAD/BOSL2/wiki/attachments.scad#subsection-specifying-directions

interior_l = 73.8;
interior_w = 52.5;
interior_h = 6.2; // 6.2
interior_radius = 9;

med_l = 78.1;
med_w = 56.8;
med_h = 4.95;
med_radius = 11;

outer_l = 83.6;
outer_w = 61.6;
outer_h = 5.9;

outer_radius=13;

insert_l = interior_l + 0.5;    // made .5mm longer than aperature
insert_w = interior_w + 0.5;    // made .5mm wider than aperature
insert_h = 1.5;

screen_l = 56.2;   // measure
screen_w = 43.9;   // measure
screen_h = 1;

ridge_thickness = 1;

pcb_l = 52;
pcb_w = 39.2;
pcb_h = 1;

inner_shell_thickness = (med_l-interior_l)/2;

// insert

z_offset = 50;      // keeps the insert away from the gopro case in the view

ridge_pcb_cut_out_l = ridge_thickness*2;
ridge_pcb_cut_out_w = 22;
ridge_pcb_cut_out_h = insert_h;

ridge_pcb_cut_out_offset_w = 5.2;

ridge_usb_cut_out_l = 24;
ridge_usb_cut_out_w = ridge_thickness*2;
ridge_usb_cut_out_h = insert_h;

ridge_usb_cut_out_offset_l = 50 - ridge_usb_cut_out_l;

    
difference()
{
    difference()
    {
        // Insert to back screen, hole is sized to fit pcb attached to screen
        difference()       // (larger piece - smaller piece)
        {
            // the actual insert (square ring) that will be nanotaped down
            translate([0,0,z_offset])
                cuboid(
                    [insert_l,insert_w,insert_h], rounding=9,
                    edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
                    $fn=30,anchor=[-1,-1,-1]);
            
            // the hole in the insert
            translate([(insert_l-pcb_l-ridge_thickness)/2,(insert_w-pcb_w-ridge_thickness)/2,z_offset])
                cuboid(
                    [pcb_l+ridge_thickness,pcb_w+ridge_thickness,insert_h], rounding=0,
                    edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
                    $fn=30,anchor=[-1,-1,-1]);
                
        }
        
        // The notch added to the side of the insert hole
        // to account for the lcd pcb flex connector
        translate([(insert_l-screen_l)/2,(insert_w-screen_w)/2+ridge_pcb_cut_out_offset_w,z_offset])
            cuboid(
                [ridge_pcb_cut_out_l,ridge_pcb_cut_out_w,ridge_pcb_cut_out_h], rounding=0,
                edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
                $fn=30,anchor=[-1,-1,-1]);
    }

    // The notch added to the top of the insert hole
    // to account for the usb connector
    translate([(insert_l-screen_l)/2+ridge_usb_cut_out_offset_l,
               (insert_w-screen_w)/2,
               z_offset])
        cuboid(
            [ridge_usb_cut_out_l,ridge_usb_cut_out_w,ridge_usb_cut_out_h], rounding=0,
            edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
            $fn=30,anchor=[-1,-1,-1]);

}

// ridge to hold screen in place size of display, on back of insert
difference()       // (larger piece - smaller piece)
{
    // The outer square-cornered ridge under the insert which is hollow.
    translate([(insert_l-screen_l-ridge_thickness)/2,(insert_w-screen_w-ridge_thickness)/2,z_offset-screen_h])
        cuboid(
            [screen_l+ridge_thickness,screen_w+ridge_thickness,screen_h], rounding=0,
            edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
            $fn=30,anchor=[-1,-1,-1]);
        
    // The inner hole made in the ridge (this is exact screen dimensions)
    translate([(insert_l-screen_l)/2,(insert_w-screen_w)/2,z_offset-screen_h])
        cuboid(
            [screen_l,screen_w,screen_h], rounding=0,
            edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
            $fn=30,anchor=[-1,-1,-1]);
}

// peg for pulling the insert out of the gopro case
translate([5,38,z_offset+insert_h])
    cylinder(h=8,r=2);

      
// Go pro back

// top one, 
difference()
{
  
  translate([-inner_shell_thickness,-inner_shell_thickness,(interior_h-med_h)])
      cuboid(
        [med_l,med_w,med_h], rounding=med_radius,
        edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
        $fn=30,anchor=[-1,-1,-1]);
    
  translate([0,0,(interior_h-med_h)])
    cuboid(
        [interior_l,interior_w,med_h], rounding=interior_radius,
        edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
        $fn=30,anchor=[-1,-1,-1]);
  
}

difference()
{
    // outer part
    translate([-(outer_l-interior_l)/2,-(outer_w-interior_w)/2,-outer_h+(interior_h-med_h)])
    cuboid(
        [outer_l,outer_w,outer_h], rounding=med_radius,
        edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
        $fn=30,anchor=[-1,-1,-1]);

    // interior lower part
    translate([0,0,0])
    cuboid(
        [interior_l,interior_w,interior_h-med_h], rounding=interior_radius,
        edges=[RIGHT+BACK, RIGHT+FRONT, LEFT+BACK,LEFT+FRONT],
        $fn=30,anchor=[-1,-1,-1]);
    
}


