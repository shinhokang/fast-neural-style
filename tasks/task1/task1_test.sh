#!/bin/bash

declare -a style_arr=("la_muse" "starry_night")
declare -a image_arr=("peak_obama_from_wash-mon" "peak-trump-from-wash-mon" "Pulp-Fiction-005" "Pulp-Fiction-467" "The-Grand-Budapest-Hotel-058")

for style in "${style_arr[@]}"
do
  for image in "${image_arr[@]}"
  do
    /usr/bin/time -v th fast_neural_style.lua \
        -model tasks/task1/$style.t7 \
        -input_image images/content/$image.jpg \
        -output_image training/${style}_${image}.png \
        -gpu 2 \
        -cudnn_benchmark 1 \
        -timing 1 \
  done
done