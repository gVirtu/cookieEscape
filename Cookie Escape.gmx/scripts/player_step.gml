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

var i;
for(i=0;i<global.devicenum;++i) {
    if (device_mouse_check_button_pressed(i,mb_left)) {
        var mx = device_mouse_x(i)-view_xview[0];
        var my = device_mouse_y(i)-view_yview[0];
        var gdir = -1; //Grapple direction
        
        if (mx > display_get_gui_width()*0.5) {
            gdir = 1;    
        }
        
        //show_message("MX = "+string(mx)+" and GUIW = "+string(display_get_gui_width()));
        //Create a swipe controller for each touch
        with (instance_create(x,y,obj_swiper)) {
            did=i;
            lastx = mx; lasty = my;
            ds_queue_enqueue(swx,0);
            ds_queue_enqueue(swy,0);
        }
        
        if (!instance_exists(obj_hooktip)) {
            player_grapple(gdir);
            devicefired=i;
            break;
        }
    }
}

//Alternative keyboard grapple controls
if (!instance_exists(obj_hooktip)) {
    if (keyboard_check_pressed(vk_left)) {
        devicefired=0;
        var gdir = -1; //Grapple direction
        player_grapple(gdir);
    }
    
    if (keyboard_check_pressed(vk_right)) {
        devicefired=0;
        var gdir = 1; //Grapple direction
        player_grapple(gdir);
    }
}

if (instance_exists(obj_hooktip)) {
    //Alternative swipes (hooktip exists) 
    if (keyboard_check_pressed(ord('A'))) {
        do_swipe(180); player_release();
    }
    if (keyboard_check_pressed(ord('D'))) {
        do_swipe(0); player_release();
    }    
    if (keyboard_check_pressed(ord('W'))) {
        do_swipe(90); player_release();
    }    
    if (keyboard_check_pressed(ord('S'))) {
        do_swipe(270); player_release();
    }        
}

for(i=0;i<global.devicenum;++i) {
    if (device_mouse_check_button_released(i,mb_left) || (i==0 && (keyboard_check_released(vk_left) || keyboard_check_released(vk_right)))) {
        if (devicefired==i) { //Was the hook fired from this touch?
            if (instance_exists(obj_hooktip)) {
                if (instance_exists(obj_hooktip.attachedblock)) {
                    //wb_tolerance -> A little after (bigger time window)
                    //Shaky==0 and distance -> A little before
                    if (wb_tolerance || (shaky==0 && point_distance(x,y,obj_hooktip.x,obj_hooktip.y) < wb_maxdist)) {
                        player_wallboost(obj_hooktip.attachedblock, obj_hooktip.boostdir, obj_hooktip.allowboosts);
                    }
                }
            }
            player_release();
        }
        with (obj_swiper) {
            if (did==i) {
                instance_destroy();
            }
        }
        
        break;
    }
}

//Being pulled?

if (beingpulled && abs(speed)<0.1) {
    if (face!=1) {
        face=1;
        if (instance_exists(obj_hooktip)) { //it SHOULD always exist if we got this far... but just in case
            if (point_distance(x,y,obj_hooktip.x,obj_hooktip.y) < wb_maxdist) {
                wb_tolerance=true; //Only allow wallboost if we are close enough to the hook (didn't get stuck somewhere else)
            }
        }
        alarm[9]=room_speed*0.2;
        speed=0;
    }
}

//Rushing?

if (rushin) {
    image_angle += 8;
    if (speed<2) rushin=false;
} else {
    var targetdir=0;
    var angspd=6;
    var angdiff = angle_difference(image_angle,targetdir);
    if (abs(angdiff)<angspd) image_angle=targetdir;
    else image_angle-=sign(angdiff)*angspd;
}
