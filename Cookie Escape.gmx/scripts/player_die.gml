///player_die()

with(obj_controller) {
    //Time respawn
    alarm[1]=16;
    pspawn_x=obj_player.xstart;
    pspawn_y=obj_player.ystart;
}

with (obj_hooktip) instance_destroy();
with (obj_camera) instance_destroy();
with (obj_player) {
    effect_crumble(x,y+sprite_yoffset-8);
    instance_destroy();
}
//Reset tutorialsz
with (obj_boosttutorial) {
    cantrigger=true;
}
