#!/bin/bash

declare -a style_arr=("starry_night_0.0_1.0" "starry_night_0.0_5.0" "starry_night_0.0_10.0" "starry_night_1.0_1.0" "starry_night_1.0_10.0" "starry_night_4.0_1.0" "starry_night_4.0_5.0" "starry_night_4.0_10.0")

for style in "${style_arr[@]}"
do
    /usr/bin/time -v th fast_neural_style.lua \
        -model tasks/task4/models/$style.t7 \
        -input_dir images/content/ \
        -output_dir tasks/task4/output/${style}/ \
        -gpu 3 \
        -cudnn_benchmark 1 \
        -timing 1
done
