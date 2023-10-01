// https://github.com/jon-gilbert/openscad_attachable_text3d/wiki/Installation
use <fontmetrics.scad>;

//font = "Liberation Sans Narrow:style=Bold";
font = "Arial:style=Bold";
font_size = 5;
h = ascender(font)-descender(font);

thickness = 4; // was 3, 3.5 which were too thin and then 4 seems closest - may have to increase to 4.5
base = 1.0;
width = 28.5;
height = 19;
hole_width = 11.0;
hole_height = 10.0;
hole_NE_x = 6.5;
hole_NE_y = 2;

pin_x = 12;
pin_y = 6.5;
pin_width = 1.0;
pin_bredth = 1.0;
pin_depth = 0.5;

cut_out_N_x_offset=0;
cut_out_N_y_offset=height-5;
cut_out_S_x_offset=0;
cut_out_S_y_offset=height;
cut_out_E_x_offset=7;
cut_out_E_y_offset=height;

wire_notch_upper_N_y_offset=5.125;
wire_notch_lower_N_y_offset=8.125;
wire_notch_length=6.5;
wire_notch_base_length=2;


cross_hair_90_degree_length=7;
cross_hair_thickness = 0.5;

cross_hair_north_south_x_offset=pin_x+pin_width/4.0;

cross_hair_north_south_y_offset=pin_y+pin_bredth/2.0-cross_hair_90_degree_length/2.0;

cross_hair_east_west_x_offset=cross_hair_north_south_x_offset-cross_hair_90_degree_length/2.0;

cross_hair_east_west_y_offset=cross_hair_north_south_y_offset-pin_bredth/4.0+cross_hair_90_degree_length/2.0;

translate([0,0,1])

    difference()
    {
        cube([width,height,thickness-base]);
        
        translate ([hole_NE_x,hole_NE_y,0])
            cube([hole_width,hole_height,thickness-base]);

        linear_extrude(height = thickness, center = false)
            translate([0,0,thickness])
                polygon(points=[[cut_out_N_x_offset,cut_out_N_y_offset],[cut_out_S_x_offset,cut_out_S_y_offset],[cut_out_E_x_offset,cut_out_E_y_offset]]);

        translate ([0,wire_notch_upper_N_y_offset,0])
            cube([wire_notch_length,1,thickness]);

        translate ([0,wire_notch_lower_N_y_offset,0])
            cube([wire_notch_length,1,thickness]);

        rotate([180,180,0])
            translate([-25,-18,thickness-1.5])
                    linear_extrude(height=0.5) union() {  
                        translate([0,0]) drawText("SIDE", font=font, size=font_size);
                }
    }

    difference()
    {
        cube([width,height,base]);

        translate ([pin_x,pin_y,base-pin_depth])
            cube([pin_width,pin_bredth,pin_depth]);
        
        translate ([cross_hair_north_south_x_offset,cross_hair_north_south_y_offset,base-pin_depth])
            cube([cross_hair_thickness,cross_hair_90_degree_length,thickness-base]);

        translate ([cross_hair_east_west_x_offset,cross_hair_east_west_y_offset,base-pin_depth])
            cube([cross_hair_90_degree_length,cross_hair_thickness, thickness-base]);

        linear_extrude(height = thickness, center = false)
            translate([0,0,thickness])
                polygon(points=[[cut_out_N_x_offset,cut_out_N_y_offset],[cut_out_S_x_offset,cut_out_S_y_offset],[cut_out_E_x_offset,cut_out_E_y_offset]]);


        translate ([0,wire_notch_upper_N_y_offset,0])
            cube([wire_notch_base_length,1,thickness]);

        translate ([0,wire_notch_lower_N_y_offset,0])
            cube([wire_notch_base_length,1,thickness]);
    }
