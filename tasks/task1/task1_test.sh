declare -a arr=( "la_muse" "starry_night" "composition-vii-1913" "femme_nue_assise" "udnie" )

for style in "${arr[@]}"
do
	echo ""
	echo "Style training: $style"  
  /usr/bin/time -v th fast_neural_style.lua \
    -model tasks/models_1and2/ .t7 \
    -input_image images/content/chicago.jpg \
    -output_image training/12_09_11_01_2017/testout.png \
    -gpu 1 \
    -cudnn_benchmark 1 \
    -timing 1 \

done
