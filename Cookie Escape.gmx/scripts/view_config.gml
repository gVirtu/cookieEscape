///view_config()

with (obj_camera) {
    view_visible[0]=true;
    view_wview[0]=960;
    view_hview[0]=1280;
    view_wport[0]=view_wview[0];
    view_hport[0]=view_hview[0];
    view_hspeed[0]=-1;
    view_vspeed[0]=20; //Will be free in alarm[0]
    view_object[0]=obj_camera;
    view_hborder[0]=view_wview[0]/2 -obj_camera.sprite_width;
    view_vborder[0]=ceil(view_hview[0]*0.75);
    alarm[0]=5;
}
