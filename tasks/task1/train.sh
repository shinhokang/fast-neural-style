#!/bin/bash
# declare an array called array and define 3 vales
style_array=("candy")
#"la_muse")
# "candy" "starry_night" "feathers")
#export CUDA_VISIBLE_DEVICES=0
for stylename in "${style_array[@]}"
do
	echo "Start with style:" $stylename
	echo "--"
	th train.lua \
		-h5_file tasks/mscoco.h5 \
		-style_image images/styles/$stylename.jpg \
		-content_weights 1.0 \
		-style_weights 5.0 \
		-gpu 2


		#-style_image_size 384 \
		#-content_weights 1.0 \
		#-style_weights 5.0 \
		#-checkpoint_name tasks/task1/checkpoints/$stylename \
		#-gpu 2 \
		#-use_cudnn 1 \
		#-checkpoint_every 500 \
		#-num_iterations 1000 \

done


