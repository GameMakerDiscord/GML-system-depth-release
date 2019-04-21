/// @description        demo
/// @author             Army Armbuster

/// 'shadow'

draw_set_alpha(0.5);
draw_set_color(c_black);

draw_rectangle(bbox_left, y, bbox_right, y, false);

draw_set_alpha(1.0);
draw_set_color(c_white);

/// 'sprite'

draw_sprite_ext(sprite_index, image_index, x, y + z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);