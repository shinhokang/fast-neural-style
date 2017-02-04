#!/bin/bash

declare -a style_arr=("composition-vii-1913" "femme_nue_assise" "udnie")
# declare -a image_arr=("peak_obama_from_wash-mon" "peak-trump-from-wash-mon" "Pulp-Fiction-005" "Pulp-Fiction-467" "The-Grand-Budapest-Hotel-058")

for style in "${style_arr[@]}"
do
  # for image in "${image_arr[@]}"
  # do
    /usr/bin/time -v th fast_neural_style.lua \
        -model tasks/task3/models/$style.t7 \
        -input_dir images/content/ \
        -output_dir tasks/task3/output/${style}/ \
        -gpu 3 \
        -cudnn_benchmark 1 \
        -timing 1
  # done
done
