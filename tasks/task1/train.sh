#!/bin/bash
declare -a arr=( "mosaic" "the_scream" )

for style in "${arr[@]}"
do
        echo ""
        echo "Style training: $style"
	th train.lua \
		-h5_file tasks/mscoco.h5 \
		-style_image images/styles/$style.jpg \
		-content_weights 1.0 \
		-style_weights 5.0 \
		-gpu 0 \
		-style_image_size 384 \
		-checkpoint_name "tasks/task1/models/$style" \
		-use_cudnn 1 \
		-arch c9s1-32,d64,d128,R128,R128,R128,R128,R128,u64,u32,c9s1-3 \
		-use_instance_norm 0 \
		#-batch_size 4 \
		#-num_iterations 2 \
		#-checkpoint_every 1 \

done


