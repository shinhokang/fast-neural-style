#!/bin/bash
# declare an array called array and define 3 vales
training_folder=$(basename $(dirname $0))
style_array=("Femme_nue_assise" "composition-vii" "august_macke_kinder_im_garten")

for stylename in "${style_array[@]}"
do
	echo "Start with style:" $stylename
	echo "--"
	th train.lua \
		-h5_file training/out.h5 \
		-style_image training/$training_folder/$stylename.jpg \
		-style_image_size 384 \
		-content_weights 1.0 \
		-style_weights 5.0 \
		-checkpoint_name training/${training_folder}/checkpoints/$stylename \
		-gpu 1 \
		-use_instance_norm 0
		#-checkpoint_every 500 \
		#-num_iterations 1000 \

done


