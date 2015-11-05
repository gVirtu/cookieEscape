///hook_draw()

var xx=x, yy=y;
var _xo = obj_player.x+xo;
var _yo = obj_player.y+yo;
var ang = point_direction(_xo,_yo,x,y);
var w = sprite_get_width(spr_hooksegment);
//Trace segments all the way back to origin point
while (point_distance(_xo,_yo,xx,yy) >= w) {
    xx -= lengthdir_x(w, ang);
    yy -= lengthdir_y(w, ang);
    draw_sprite_ext(spr_hooksegment,image_index,xx,yy,image_xscale,image_yscale,ang,image_blend,image_alpha);
}

//Draw tip
if (fixedangle)
    draw_self();
else
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,ang,image_blend,image_alpha);
