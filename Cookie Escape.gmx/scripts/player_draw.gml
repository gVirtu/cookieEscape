///player_draw()

draw_self();
draw_sprite_ext(spr_face,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//DEBUG
draw_set_color(c_white);
draw_text(view_xview[0],view_yview[0],string(fps));
