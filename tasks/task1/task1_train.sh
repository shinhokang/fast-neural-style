#!/bin/bash

#Task 1 - train models
 # same styles as the paper : "la_muse" "starry_night"
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
		-checkpoint_name "tasks/task1/models/${style}" \
		-use_cudnn 1 \
		-use_instance_norm 1 \
		-checkpoint_every 100 \
		> tasks/task1/${style}_instance_norm.log
		#-batch_size 4 \
		#-num_iterations 2 \
done

declare -a style_arr=("la_muse" "starry_night")

for style in "${style_arr[@]}"
do
  /usr/bin/time -v th fast_neural_style.lua \
      -model tasks/task1/models/$style.t7 \
      -input_dir images/content/ \
      -output_dir tasks/task1/output/${style}/ \
      -gpu 2 \
      -cudnn_benchmark 1 \
      -timing 1
done

