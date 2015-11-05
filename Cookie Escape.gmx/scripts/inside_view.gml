///inside_view(obj,tolerance)

var tolerance=argument1;
with (argument0) {
return (    (bbox_right+tolerance > view_xview[0]) &&
            (bbox_bottom+tolerance > view_yview[0]) &&
            (bbox_left-tolerance < view_xview[0]+view_wview[0]) &&
            (bbox_top-tolerance < view_yview[0]+view_hview[0]));

}
