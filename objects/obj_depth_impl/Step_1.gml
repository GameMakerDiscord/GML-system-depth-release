/// @description        demo
/// @author             Army Armbuster

x += 1 * (keyboard_check(vk_right)   - keyboard_check(vk_left));
y += 1 * (keyboard_check(vk_down)    - keyboard_check(vk_up));
z += 1 * (keyboard_check(vk_control) - keyboard_check(vk_shift));