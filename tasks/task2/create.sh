#!/bin/bash
training_folder="08_52_18_01_2017"

echo ${training_folder}

ln -s /home/Data/MSCoco/train2014 training/${training_folder}/trainImages
ln -s /home/Data/MSCoco/val2014 training/${training_folder}/valImages

ln -s training/out.h5 training/${training_folder}/out.h5

mkdir training/${training_folder}/checkpoints

#python scripts/make_style_dataset.py \
#  --train_dir training/$FOLDER_NAME/trainImages \
#  --val_dir training/$FOLDER_NAME/valImages \
#  --output_file training/$FOLDER_NAME/out.h5
