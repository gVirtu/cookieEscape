///player_wallboost(col,dir,strong)

var col=argument0;
var dir=argument1;
var strong=argument2;

with (obj_player) {
    //Try to snap to block horizontally
    closest_block_side(col);
    if (_xf != 0) {
        var hsw = col.sprite_width*0.5; //half-sprite width
        var c = col.x+hsw; //Center of collision
        x = c + _xf*(sprite_xoffset+hsw);
    }
    
    //Wallboost
    if (!strong) { //Close ranged grapples don't count
        hspeed=5*dir;
    } else {
        vspeed=-12;
        hspeed=12*dir;
        canrush=true;
        effect_wallboost(x+sprite_xoffset*dir,y);
    }
}
