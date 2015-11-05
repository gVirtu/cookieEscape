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
    var mx = device_mouse_x_to_gui(0)
    var my = device_mouse_y_to_gui(0);
    var gdir = -1; //Grapple direction
    
    if (mx > view_wview[0]*0.5) {
        gdir = 1;    
    }
    
    player_grapple(gdir);
}

if (device_mouse_check_button_released(0,mb_left)) {
    if (instance_exists(obj_hooktip)) {
        if (obj_hooktip.allowboosts) //Close ranged grapples don't count
        if (instance_exists(obj_hooktip.attachedblock)) {
            //wb_tolerance -> A little after (bigger time window)
            //Face==0 and distance -> A little before
            if (wb_tolerance || (face==0 && point_distance(x,y,obj_hooktip.x,obj_hooktip.y) < wb_maxdist)) {
                player_wallboost(obj_hooktip.attachedblock, obj_hooktip.boostdir);
            }
        }
    }
    player_release();
}

//Being pulled?

if (beingpulled && abs(speed)<0.1) {
    if (face==0) {
        face=1;
        if (instance_exists(obj_hooktip)) { //it SHOULD always exist if we got this far... but just in case
            if (point_distance(x,y,obj_hooktip.x,obj_hooktip.y) < wb_maxdist)
                wb_tolerance=true; //Only allow wallboost if we are close enough to the hook (didn't get stuck somewhere else)
        }
        alarm[9]=room_speed*0.2;
        speed=0;
    }
}
