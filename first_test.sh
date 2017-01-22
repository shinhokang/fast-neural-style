/usr/bin/time -v th fast_neural_style.lua \
  -model models/instance_norm/la_muse.t7 \
  -input_dir images/content \
  -output_dir out \
  -gpu 0 \
  -cudnn_benchmark 1 \
  -timing 1 \
