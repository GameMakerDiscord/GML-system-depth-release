# GML-system-depth

## Overview

This 2.5D depth system was created to allow z traversal, without the limitations as imposed by the z-tilting method. This system was inspired by the z-tilting method. Instead of 'tilting' the sprites, the layers are 'tilted'. This removes the limitations on the sprites, but introduces limitations on the layers. Unlike the z-tilting method, this system still uses a form of depth = - y.

This system is effectively only a transformation of the existing layers, the existing layers requiring a particular structure for this transformation to work. All the `tileset` layers must be grouped together with no other types of layers between them:

```
---
non-tileset layers (min depth)
---
tileset layers
---
non-tileset layers (max depth)
---
```

In the most simple terms the transformation can be described as follows:

```
-4 -4 -4 -4 -4         -8 -7 -6 -5 -4
-3 -3 -3 -3 -3         -7 -6 -5 -4 -3
-2 -2 -2 -2 -2    ->   -6 -5 -4 -3 -2
-1 -1 -1 -1 -1         -5 -4 -3 -2 -1
-0 -0 -0 -0 -0         -4 -3 -2 -1 -0
```

The original layers are transformed to form diagonal transformed layers, each original layer being broken up along the y-axis, to form a stairway of sorts, as shown above.

## scripts

A brief explanation on the configuration constants.

```
sys_constants_depth_macros()
```

The `sys_constants_depth_macros` script file contains the configuration constants for this system, as follows:

```
#macro sys_depth_layer_buffer_index             is simply the starting index of the tileset layers, where the layer of the highest depth is at index 0
#macro sys_depth_layer_buffer                   is simply the maximum sprite height

#macro sys_depth_layer_w                        is the room width, but this could be camera width in the future
#macro sys_depth_layer_h                        is the room height, but this could be the camera height in the future

#macro sys_depth_layer_tile_w                   is the tile width
#macro sys_depth_layer_tile_h                   is the tile height
```

## objects

A brief explanation on the objects.

```
sys_controller_depth                            a persistent controller object which applies the layer transformation at every room_start event
sys_controller_depth_impl                       a demo object

obj_depth                                       a parent object to extend from which sets the depth at every pre-draw event
obj_depth_impl                                  a demo object
```

In the `sys_controller_depth` `create_event` the `layer_force_draw_depth()` is only required should the transformed depth values range outside from `-16000` to `+16000`.

## Additional

Although the current demo project is restricted to room bounds, the method itself may be applied to camera bounds.

Although the current demo project is transforming existing room layers, the method itself may be applied to generate transformed layers from data structures.
