#!/bin/bash
training_folder="08_52_18_01_2017"
style_array=("Femme_nue_assise" "composition-vii" "august_macke_kinder_im_garten")


for stylename in "${style_array[@]}"
do
	echo "Start with style:" $stylename
	echo "--"
	th fast_neural_style.lua \
		-model training/$training_folder/checkpoints/${stylename}.t7 \
  		-input_image images/content/chicago.jpg \
  		-output_image training/$training_folder/${stylename}out.png \
		-gpu 1 \
		
		#-checkpoint_every 500 \
		#-num_iterations 1000 \

done

