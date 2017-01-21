/usr/bin/time -v th fast_neural_style.lua \
  -model training/12_09_11_01_2017/checkpoints/checkpoint.t7 \
  -input_image images/content/chicago.jpg \
  -output_image training/12_09_11_01_2017/testout.png \
  -gpu 1 \
  -cudnn_benchmark 1 \
  -timing 1 \
