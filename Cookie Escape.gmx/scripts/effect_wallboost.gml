///effect_wallboost(x,y)
var xx=argument0;
var yy=argument1;
effect_create_below(ef_ring,xx,yy,1,c_white);
part_particles_create(global.ps,xx,yy,global.pt_wallboost,6);
effect_ripple(20);
