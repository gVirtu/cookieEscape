///init_particles()

global.ps = part_system_create();
global.pt_wallboost = part_type_create();
part_type_sprite(global.pt_wallboost,spr_boosteffect,0,0,0);
part_type_direction(global.pt_wallboost,0,360,0,0.5);
part_type_speed(global.pt_wallboost,4,10,-0.01,0);
part_type_alpha2(global.pt_wallboost,1,0);
part_type_orientation(global.pt_wallboost,0,360,3,0,0);
part_type_life(global.pt_wallboost,30,60);

global.pt_wallgrapple = part_type_create();
part_type_shape(global.pt_wallgrapple,pt_shape_star);
part_type_size(global.pt_wallgrapple,1,1,-0.02,0);
part_type_color1(global.pt_wallgrapple,c_white);
//Dynamic direction
//part_type_direction(global.pt_wallgrapple,0,360,0,0.5);
part_type_speed(global.pt_wallgrapple,7,7,-0.02,0);
part_type_alpha2(global.pt_wallgrapple,1,0);
part_type_orientation(global.pt_wallgrapple,0,360,2,0,0);
part_type_life(global.pt_wallgrapple,16,16);
