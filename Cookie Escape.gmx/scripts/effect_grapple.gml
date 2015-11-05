///effect_wallboost(x,y,dir)
var xx=argument0;
var yy=argument1;
var dir=argument2;
part_type_direction(global.pt_wallgrapple,dir-50,dir+50,0,0);
part_particles_create(global.ps,xx,yy,global.pt_wallgrapple,4);
