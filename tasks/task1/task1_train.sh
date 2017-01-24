#!/bin/bash

#Task 1, 2 - train medels
 # task1: same styles as the paper : "la_muse" "starry_night"
 # task2: 3 different styles : "composition-vii-1913" "femme_nue_assise" "udnie"
 # using same architecture and using batch normalization

declare -a arr=( "la_muse" "starry_night" )

for style in "${arr[@]}"
do
	echo ""
	echo "Style training: $style"
	th train.lua \
		-h5_file tasks/mscoco.h5 \
		-style_image images/styles/$style.jpg \
		-content_weights 1.0 \
		-style_weights 5.0 \
		-gpu 2 \
		-style_image_size 384 \
		-checkpoint_name "tasks/task1/models/$style" \
		-use_cudnn 1 \
		-arch c9s1-32,d64,d128,R128,R128,R128,R128,R128,u64,u32,c9s1-3 \
		-use_instance_norm 0 \
		> tasks/task1/$style.log &
		#-batch_size 4 \
		#-num_iterations 2 \
		#-checkpoint_every 1 \

done
