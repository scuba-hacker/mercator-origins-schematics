thickness = 4.0;
base = 1.0;
width = 30.0;       // increased from 28 to 30
height = 19.5;      // reduced from 20.5 to 19.5
hole_width = 10.0;      // reduced by 1mm
hole_height = 10.0;     // reduced by 1mm

pin_x = 18.0;       // translated 2mm towards flat edge
pin_y = 6.5;
pin_width = 1.0;
pin_bredth = 1.0;
pin_depth = 0.5;

cut_out_y_length=7.5;
cut_out_x_length=9.5;
cut_out_NE_x_offset=0;
cut_out_NE_y_offset=height-cut_out_y_length;
cut_out_SW_x_offset=cut_out_x_length;
cut_out_SW_y_offset=height;
cut_out_SE_x_offset=0;
cut_out_SE_y_offset=height;

cross_hair_90_degree_length=9;      // increased by 2mm
cross_hair_thickness = 0.5;

cross_hair_north_south_x_offset=pin_x+pin_width/4.0;

cross_hair_north_south_y_offset=pin_y+pin_bredth/2.0-cross_hair_90_degree_length/2.0;

cross_hair_east_west_x_offset=cross_hair_north_south_x_offset-cross_hair_90_degree_length/2.0;

cross_hair_east_west_y_offset=cross_hair_north_south_y_offset-pin_bredth/4.0+cross_hair_90_degree_length/2.0;

translate([0,0,1])

    difference()
    {
        cube([width,height,thickness-base]);
        translate ([13,2,0])        // translated hole extra 2mm towards flat edge
        cube([hole_width,hole_height,thickness-base]);

        linear_extrude(height = thickness, center = false)
        
        translate([0,0,thickness])
        
            polygon(points=[[cut_out_NE_x_offset,cut_out_NE_y_offset],[cut_out_SW_x_offset,cut_out_SW_y_offset],[cut_out_SE_x_offset,cut_out_SE_y_offset]]);
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
        
            polygon(points=[[cut_out_NE_x_offset,cut_out_NE_y_offset],[cut_out_SW_x_offset,cut_out_SW_y_offset],[cut_out_SE_x_offset,cut_out_SE_y_offset]]);
    }
    



