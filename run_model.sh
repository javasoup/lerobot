#!/bin/bash

# Script to run the lerobot control script with a pretrained policy for evaluation

# --- Configuration ---
#ROBOT_TYPE="koch"
#CONTROL_TYPE="record"
#POLICY_TYPE="act" # Specify the type of the policy being loaded (e.g., "act", "diffusion")
#POLICY_PATH="outputs/train/act_koch_binky_1/pretrained_model" # Path to the local pretrained model or Hugging Face Hub repo ID
#TASK_DESCRIPTION="Give binky to baby"
#FPS=30
#REPO_ID="javasoup/act_koch_binky_1" # Repo to save evaluation results (convention: eval_<dataset_name>)
#NUM_EPISODES=10 # Number of evaluation runs
#EPISODE_TIME_S=30 # Max time per run in seconds
#WARMUP_TIME_S=0 # Seconds before starting data collection (default: 10)
#RESET_TIME_S=60 # Seconds for resetting env between episodes (default: 60)
#PUSH_TO_HUB=true
#NUM_IMAGE_WRITER_PROCESSES=1 # Number of subprocesses (e.g., 1 for better stability with multiple cams)
#NUM_IMAGE_WRITER_THREADS_PER_CAMERA=4 # Threads per camera (default: 4)

# --- Execute the Command ---
echo "Running lerobot control script..."

python lerobot/scripts/control_robot.py \
  --robot.type=koch \
  --control.type=record \
  --control.fps=30 \
  --control.single_task="Put binky in baby doll mouth" \
  --control.repo_id="javasoup/koch_binky_2" \
  --control.warmup_time_s=5 \
  --control.episode_time_s=45 \
  --control.reset_time_s=10 \
  --control.num_episodes=10 \
  --control.push_to_hub=true \
  --control.display_data=true

echo "Script finished."
