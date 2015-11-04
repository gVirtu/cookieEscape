///player_collision()

var col = instance_place(x,y,obj_block);

if (instance_exists(col)) {
    closest_block_side(col);
    if (_xf != 0)
        hspeed = abs(hspeed)*_xf;
    if (_yf != 0)
        vspeed = abs(vspeed)*_yf;
}
