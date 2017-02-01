#!/bin/bash

#Task 5 train models of starry_night style
# varying style layers

declare style="starry_night"

echo ""
echo "Style training: ${style}_stylelayer_4_9_16"

th train.lua \
    -h5_file tasks/mscoco.h5 \
    -style_image images/styles/$style.jpg \
    -content_weights 1.0 \
    -style_weights 5.0 \
    -style_layers 4,9,16 \
    -gpu 0 \
    -style_image_size 384 \
    -checkpoint_name tasks/task5/models/${style}_stylelayer_4_9_16 \
    -use_cudnn 1 \
    -use_instance_norm 1 \
    > tasks/task5/${style}_${content_weight}__stylelayer_4_9_16.log 

echo ""
echo "Style training: ${style}_stylelayer_4_9"

th train.lua \
    -h5_file tasks/mscoco.h5 \
    -style_image images/styles/$style.jpg \
    -content_weights 1.0 \
    -style_weights 5.0 \
    -style_layers 4,9 \
    -gpu 0 \
    -style_image_size 384 \
    -checkpoint_name tasks/task5/models/${style}_stylelayer_4_9 \
    -use_cudnn 1 \
    -use_instance_norm 1 \
    > tasks/task5/${style}_${content_weight}__stylelayer_4_9.log 

echo ""
echo "Style training: ${style}_stylelayer_4"

th train.lua \
    -h5_file tasks/mscoco.h5 \
    -style_image images/styles/$style.jpg \
    -content_weights 1.0 \
    -style_weights 5.0 \
    -style_layers 4 \
    -gpu 0 \
    -style_image_size 384 \
    -checkpoint_name tasks/task5/models/${style}_stylelayer_4 \
    -use_cudnn 1 \
    -use_instance_norm 1 \
    > tasks/task5/${style}_${content_weight}__stylelayer_4.log 
