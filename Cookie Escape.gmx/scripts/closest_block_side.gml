///closest_block_side(obj)
//No return value, but sets _xf and _yf to use in collision bounces

var obj = argument0;

var td, bd, ld, rd, dmin;
var sz = obj.sprite_width;
var c = sz>>1; //Center pos
_xf = 0; _yf = 0;

td = point_distance(x,y,obj.x+c,obj.y);
bd = point_distance(x,y,obj.x+c,obj.y+sz);
ld = point_distance(x,y,obj.x,obj.y+c);
rd = point_distance(x,y,obj.x+sz,obj.y+c);

dmin = min(td,bd,ld,rd);

if (dmin==ld) { //Closest to left border
    _xf = -1;
} else if (dmin==rd) { //Closest to right border
    _xf = 1;
}
if (dmin==td) { //Closest to top border
    _yf = -1;
} else if (dmin==bd) { //Closest to bottom border
    _yf = 1;
}


