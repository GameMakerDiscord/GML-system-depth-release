/// @description        demo
/// @author             Army Armbuster

var _text = @'

    Army Armbuster
    
    Controls:
    arrow key   up     - up
    arrow key   down   - down
    arrow key   left   - left
    arrow key   right  - right
    shift key   z-axis - up
    control key z-axis - down

';

draw_set_alpha(0.5);
draw_rectangle_color(16, 16, 140, 110, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1.0);

draw_set_font(font_demo);
draw_text_transformed_color(0, 0, _text, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1.0);