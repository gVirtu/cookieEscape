///player_maketrail()

with (obj_player) {
    with (instance_create(x,y,obj_playertrail)) {
        sprite_index=other.sprite_index;
        image_index=other.image_index;
        image_angle=other.image_angle;
        image_xscale=other.image_xscale;
        image_yscale=other.image_yscale;
        image_blend=other.image_blend;
        image_alpha=0.8;
        face=other.face;
        ixs=other.ixs;
    }
}
