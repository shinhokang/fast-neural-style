#!/bin/bash
# declare an array called array and define 3 vales
training_folder=$(basename $(dirname $0))
style_array=("starry_night")

style_loss_weight=("1.0" "2.0" "4.0" "6.0")
content_loss_weight=("0.0" "2.0" "4.0" "6.0")

# keep one fixed and then other variable

for stylename in "${style_array[@]}"
do
	echo "Start with style:" $stylename
	echo "--"
	for style_loss in "${style_loss_weight[@]}"
	do
		echo "Use style_loss_weight:" $style_loss
		echo "--"
		for content_loss in "${content_loss_weight[@]}"
		do
			echo "Use content_loss_weight:" $content_loss
			echo "--"
			th train.lua \
				-h5_file training/out.h5 \
				-style_image training/$training_folder/$stylename.jpg \
				-style_image_size 384 \
				-content_weights 1.0 \
				-style_weights 5.0 \
				-checkpoint_name training/${training_folder}/checkpoints/${stylename}_style${style_loss}content${content_loss} \	
				-style_weights ${style_loss}\
				-content_weights ${content_loss} \
				-gpu 1
			#-checkpoint_every 500 \
			#-num_iterations 1000 \
		done
	done
done


