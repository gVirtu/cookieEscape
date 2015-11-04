///player_step()
//Handles player physics

if (vspeed>maxvsp) vspeed=maxvsp;
if (speed != 0) {
    player_collision();
}

//Falling, but on ground -> Reset gravity
if (gravity > 0 && 
    vspeed>=0 && vspeed<=gravity &&
    place_meeting(x,y+1,obj_block)) {
    gravity=0;
    vspeed=0;
    y-=1;
}
