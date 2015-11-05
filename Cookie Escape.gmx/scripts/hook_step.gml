///hook_step()
var dir, dist, threshold;

if (goback) {
    speed=0;
    threshold=20;
    dist = point_distance(x,y,obj_player.x+xo,obj_player.y+yo);
    dir = point_direction(x,y,obj_player.x+xo,obj_player.y+yo);
    //Go back to player
    x += lengthdir_x(max(obj_player.speed+4,dist*backprop),dir);
    y += lengthdir_y(max(obj_player.speed+4,dist*backprop),dir);
    //Retreated yet?
    if (dist<threshold) {
        instance_destroy();
    }
} else { //Going back takes priority over pulling player
    
    if (!grappled) {
        if (place_meeting(x,y,obj_block)) {
            grappled=true;
            attachedblock = instance_place(x,y,obj_block);
            //Make sure hook is at most inmax pixels in the block
            var dir = point_direction(x,y,obj_player.x+xo,obj_player.y+yo);
            var inmax = 10;
            while(place_meeting(x+lengthdir_x(inmax,dir),y+lengthdir_y(inmax,dir),attachedblock)) {
                x += lengthdir_x(2,dir);
                y += lengthdir_y(2,dir);
            }
            //Fix hook angle
            image_angle=point_direction(obj_player.x,obj_player.y,x,y);
            fixedangle=true;
            speed=0;
            with (obj_player) {
                beingpulled=true;
                invincible=false;
                gravity=0;
                
                //Also make sure player is not inside any block
                var col = instance_place(x,y,obj_block);
                player_collision(col);
            }
            
            if (allowboosts) {
                effect_grapple(x,y,image_angle+180);
            }
        }
    } else {
    //Grappled! Pull player
        dist = point_distance(obj_player.x,obj_player.y,x,y);
        dir = point_direction(obj_player.x,obj_player.y,x,y);
        threshold=obj_player.sprite_width*0.5+14; //Minimum distance from player's center
        
        if (dist<threshold) {
            //Pulled, now hold
            with (obj_player) {
                speed=0;
                player_collision(other.attachedblock);
            }
        } else {
            //Try pulling horizontally and vertically
            with (obj_player) {
                if (!place_meeting(x+lengthdir_x(other.pullspd,dir),y,obj_block)) {
                    hspeed=lengthdir_x(other.pullspd,dir);
                } else {
                    hspeed=0;
                }
                
                if (!place_meeting(x,y+lengthdir_y(other.pullspd,dir),obj_block)) {
                    vspeed=lengthdir_y(other.pullspd,dir);
                } else {
                    vspeed=0;
                }
            }
        }
    }
}
