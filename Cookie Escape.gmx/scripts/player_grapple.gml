///player_grapple(dir)
//Launches hook diagonally

var dir = argument0;
with (obj_hooktip) instance_destroy();
with (obj_player) {
    beingpulled=false;
    gravity=grav;
}

with (instance_create(x+sprite_xoffset*dir,y,obj_hooktip)) {
    vspeed=-24;
    hspeed=24*dir;
    boostdir=-sign(hspeed);
}
