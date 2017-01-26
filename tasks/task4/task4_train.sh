#!/bin/bash

#Task 4 train models of starry_night style
# a. Train a model using only the style loss
# b. Train models with different weights of the content and style losses
declare style="starry_night"
declare -a arr_content_weight=("0.0" "3.0" "6.0")
declare -a arr_style_weight=("1.0" "3.0" "6.0" "7.0")

echo ""
echo "Style training: $style"

for content_weight in "${arr_content_weight[@]}"
do
	for style_weight in "${arr_style_weight[@]}"
	do
		th train.lua \
			-h5_file tasks/mscoco.h5 \
			-style_image images/styles/$style.jpg \
			-content_weights $content_weight \
			-style_weights $style_weight \
			-gpu 2 \
			-style_image_size 384 \
			-checkpoint_name tasks/task4/models/${style}_${content_weight}_${style_weight} \
			-use_cudnn 1 \
			-use_instance_norm 1 \
			> tasks/task4/${style}_${content_weight}_${style_weight}.log 
done
