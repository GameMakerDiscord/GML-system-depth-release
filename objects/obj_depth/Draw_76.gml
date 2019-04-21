/// @description        obj_depth
/// @author             Army Armbuster

depth = - sys_depth_layer_buffer * (bbox_bottom div sys_depth_layer_tile_h) * 2
        - sys_depth_layer_buffer - (bbox_bottom mod sys_depth_layer_tile_h)
        - sys_depth_layer_buffer * (sys_depth_layer_buffer_index);