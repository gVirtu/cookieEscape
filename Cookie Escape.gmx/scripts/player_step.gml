///player_step()
//Handles player physics

if (vspeed>maxvsp) vspeed=maxvsp;
if (speed != 0) {
    var col = instance_place(x,y,obj_block);
    player_collision(col);
}

//Falling, but on ground -> Reset gravity
if (gravity > 0 && 
    vspeed>=0 && vspeed<=gravity &&
    place_meeting(x,y+1,obj_block)) {
    gravity=0;
    vspeed=0;
    y-=1;
}

//Fired hook?

if (device_mouse_check_button_pressed(0,mb_left) && !instance_exists(obj_hooktip)) {
    var mx = device_mouse_x(0);
    var my = device_mouse_y(0);
    var gdir = -1; //Grapple direction
    
    if (mx > room_width*0.5) {
        gdir = 1;    
    }
    
    player_grapple(gdir);
}

if (device_mouse_check_button_released(0,mb_left)) {
    beingpulled=false;
    gravity=grav;
    with (obj_hooktip) {
        goback=true;
        grappled=false;
    }
}

//Being pulled?

if (beingpulled && abs(speed)<0.1) {
    if (face==0) {
        face=1;
        speed=0;
    }
}
