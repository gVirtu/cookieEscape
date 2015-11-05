///effect_ripple(duration)

with (obj_controller) {
    ripple_time = shader_get_uniform(sh_ripple,"time");
    ripple_time_var = 0;
    
    ripple_pos = shader_get_uniform(sh_ripple,"r_pos");
    ripple_pos_x = view_wview[0]*0.5;
    ripple_pos_y = view_hview[0]*0.5;
    
    ripple_wave_amount = shader_get_uniform(sh_ripple,"wave_amount");
    ripple_wave_amount_var = 16; //higher = more waves
    
    ripple_wave_distortion = shader_get_uniform(sh_ripple,"wave_distortion");
    ripple_wave_distortion_var = 30; //higher = less distortion
    ripple_wave_distortion_delta = 80/argument0; //Variation
    
    ripple_wave_speed = shader_get_uniform(sh_ripple,"wave_speed");
    ripple_wave_speed_var = 6.0; //higher = faster
    
    ripple_enabled = true;
    alarm[3]=argument0;
}
