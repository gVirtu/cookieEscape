///do_swipe(direction)

var swipedir=argument0;

//Rush
with (obj_player) {
    if (canrush) {
        player_release();
        direction=swipedir;
        speed=24;
        canrush=false;
        rushin=true;
        alarm[10]=4;
    } else {
        failedattempt=true;
        create_expression(0);
    }
}
