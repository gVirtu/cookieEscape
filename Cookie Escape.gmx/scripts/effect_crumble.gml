///effect_crumble(x,y)
var xx=argument0;
var yy=argument1;
var i;
var diff = 24;
for(i=0;i<8;++i) {
    part_particles_create(global.ps,xx+irandom_range(-diff,diff),yy+irandom_range(-diff,diff),global.pt_crumble,3);
}
