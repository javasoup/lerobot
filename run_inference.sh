#!/bin/bash

# Script to run the lerobot control script with a pretrained policy for evaluation

# --- Configuration ---
ROBOT_TYPE="koch"
#POLICY_PATH="javasoup/act_koch_binky_1"
MODEL="pi0fast_koch_binky_1"
HF_ID="javasoup"
POLICY_PATH="${HF_ID}/${MODEL}"
TASK_DESCRIPTION="Give binky to baby doll"
#TASK_DESCRIPTION="Put pacifier in baby doll\'s mouth"
FPS=30
EVAL_DATASET_REPO_ID="${HF_ID}/eval_${MODEL}_run_$(date +%Y%m%d%H%M%S)"

NUM_EPISODES=10
EPISODE_TIME_S=40
WARMUP_TIME_S=5
RESET_TIME_S=10
PUSH_TO_HUB=true
NUM_IMAGE_WRITER_PROCESSES=1
NUM_IMAGE_WRITER_THREADS_PER_CAMERA=4
DISPLAY_DATA=true
RESUME_EVAL_RECORDING=false

# --- Execute the Command ---
echo "Running lerobot control script with trained policy from Hub: ${POLICY_PATH}"
echo "Evaluation data will be saved to dataset repo: ${EVAL_DATASET_REPO_ID}"

COMMAND="python lerobot/scripts/control_robot.py \
  --robot.type=${ROBOT_TYPE} \
  --control.type=record \
  --control.fps=${FPS} \
  --control.single_task=\"${TASK_DESCRIPTION}\" \
  --control.repo_id=${EVAL_DATASET_REPO_ID} \
  --control.tags='[\"evaluation\", \"act_koch_binky_1\"]' \
  --control.warmup_time_s=${WARMUP_TIME_S} \
  --control.episode_time_s=${EPISODE_TIME_S} \
  --control.reset_time_s=${RESET_TIME_S} \
  --control.num_episodes=${NUM_EPISODES} \
  --control.push_to_hub=${PUSH_TO_HUB} \
  --control.policy.path=${POLICY_PATH} \
  --control.display_data=${DISPLAY_DATA} \
  --control.num_image_writer_processes=${NUM_IMAGE_WRITER_PROCESSES} \
  --control.num_image_writer_threads_per_camera=${NUM_IMAGE_WRITER_THREADS_PER_CAMERA}"

if [ "$RESUME_EVAL_RECORDING" = true ]; then
  COMMAND="$COMMAND --control.resume=true"
else
  COMMAND="$COMMAND --control.resume=false"
fi

# Execute the command
eval $COMMAND

echo "Script finished."
