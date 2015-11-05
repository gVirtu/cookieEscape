///player_draw()

draw_sprite_ext(sprite_index,image_index,x+irandom_range(-shaky,shaky),y+irandom_range(-shaky,shaky),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
draw_sprite_ext(spr_face,face,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//DEBUG
draw_set_color(c_white);
draw_text(view_xview[0],view_yview[0],string(fps));
