#!/bin/bash

set -vx

CUDA="0"
NUM_GPUS=1
TASK_NAME='laap'
MODEL_NAME='LAAPModel'

RUN_MODE='dueefin_wo_tgg'
TEMPLATE='dueefin_wo_tgg'
INFERENCE_DUMPPATH='laap_duee_fin_wo_trigger.json'

{
    #  CUDA_LAUNCH_BLOCKING=1 CUDA_VISIBLE_DEVICES=${CUDA} python run_dee_task.py \
    CUDA_VISIBLE_DEVICES=${CUDA} bash scripts/train_multi.sh ${NUM_GPUS} \
        --data_dir='Data/DuEEData' \
        --bert_model='./plm' \
        --task_name=${TASK_NAME} \
        --model_type=${MODEL_NAME} \
        --cpt_file_name=${MODEL_NAME} \
        --add_greedy_dec=False \
        --use_bert=False \
        --skip_train=False \
        --run_mode="${RUN_MODE}" \
        --event_type_template="${TEMPLATE}" \
        --resume_latest_cpt=False \
        --laap_train_nopair_sets=True  \
        --num_train_epochs=100 \
        --train_batch_size=32 \
        --gradient_accumulation_steps=8 \
        --learning_rate=0.0002 \
        --laap_decoder_lr=0.0001 \
        --num_ner_tf_layers=8 \
        --load_inference=False \
        --inference_epoch=-1 \
        --run_inference=False \
        --filtered_data_types='o2o,o2m,m2m,unk' \
        --inference_dump_filepath="${INFERENCE_DUMPPATH}" \
        --laap_train_on_multi_events=True \
        --laap_train_on_single_event=True
}
