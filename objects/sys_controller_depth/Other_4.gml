/// @description        sys_controller_depth
/// @author             Army Armbuster

#region TEMPORARY - STACK

var _ds_stack           = ds_stack_create();

#endregion
#region TEMPORARY - ARRAY

var _array              = layer_get_all();

var _ii = 0; repeat (array_length_1d(_array)) {

    ds_stack_push(_ds_stack, _array[_ii]);

    _ii++;
}

#endregion
#region TEMPORARY - LAYER

var _layer_tiles_x      = sys_depth_layer_w div sys_depth_layer_tile_w;
var _layer_tiles_y      = sys_depth_layer_h div sys_depth_layer_tile_h;
var _layer_tiles_z      = ds_stack_size(_ds_stack);

var _layer_id           = undefined;
var _layer_id_tilemap   = undefined;

#endregion

var _ii = 0; repeat (_layer_tiles_z) {

    #region TEMPORARY - LAYER

    _layer_id           = ds_stack_pop(_ds_stack);
    _layer_id_tilemap   = layer_tilemap_get_id(_layer_id);

    #endregion

    if (- 1 != _layer_id_tilemap) {

        var _jj = 0; repeat (_layer_tiles_y) {

            var _layer_id_tilemap_temp = layer_tilemap_create(layer_create(- _ii * sys_depth_layer_buffer - _jj * sys_depth_layer_buffer * 2), 0, _jj * sys_depth_layer_tile_h, tilemap_get_tileset(_layer_id_tilemap), sys_depth_layer_w, sys_depth_layer_tile_h);

            var _kk = 0; repeat (_layer_tiles_x) {

                tilemap_set(_layer_id_tilemap_temp, tilemap_get(_layer_id_tilemap, _kk, _jj), _kk, 0);

                _kk++;
            }

            _jj++;
        }

        layer_destroy(_layer_id);

    } else {

        layer_depth(_layer_id, - _ii * sys_depth_layer_buffer);
    }

    _ii++;
}

#region TEMPORARY - STACK

ds_stack_destroy(_ds_stack);

#endregion