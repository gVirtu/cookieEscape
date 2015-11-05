///player_release()
//Not being grappled anymore

with (obj_player) {
    beingpulled=false;
    gravity=grav;
    face=0;
    shaky=0;
    wb_tolerance=false;
    alarm[9]=-1;
    with (obj_hooktip) {
        goback=true;
        grappled=false;
    }
}
