#!/bin/bash

declare -a style_arr=("starry_night_4" "starry_night_9" "starry_night_23" "starry_night_stylelayer_4_9_16" "starry_night_stylelayer_4_9" "starry_night_stylelayer_4")

for style in "${style_arr[@]}"
do
    /usr/bin/time -v th fast_neural_style.lua \
        -model tasks/task5/models/$style.t7 \
        -input_dir images/content/ \
        -output_dir tasks/task5/output/${style}/ \
        -gpu 3 \
        -cudnn_benchmark 1 \
        -timing 1
done
