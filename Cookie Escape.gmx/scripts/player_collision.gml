///player_collision(col)

var col = argument0;

if (instance_exists(col)) {
    closest_block_side(col);
    if (_xf != 0) {
        hspeed = 0.9 * abs(hspeed)*_xf;
        var hsw = col.sprite_width*0.5; //half-sprite width
        var c = col.x+hsw; //Center of collision
        x = c + _xf*(sprite_xoffset+hsw);
    }
    if (_yf != 0) {
        vspeed = 0.9 *abs(vspeed)*_yf;
        var hsh = col.sprite_height*0.5; //half-sprite width
        var c = col.y+hsh; //Center of collision
        y = c + _yf*(sprite_xoffset+hsh);
    }
}
