///do_swipe(direction)

var swipedir=argument0;

//Rush
with (obj_player) {
    if (canrush) {
        direction=swipedir;
        speed=24;
        canrush=false;
        rushin=true;
        alarm[10]=4;
    }
}
