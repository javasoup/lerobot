#!/bin/bash

# Script to run the lerobot control script with a pretrained policy for evaluation

# --- Configuration ---
ROBOT_TYPE="koch"
CONTROL_TYPE="record"
POLICY_TYPE="act"                           # <<< ADDED: Specify the type of the policy being loaded (e.g., "act", "diffusion")
POLICY_PATH="outputs/train/act_koch_test_2025_2/pretrained_model" # Path to the local pretrained model
TASK_DESCRIPTION="Pick up keyboard key"
FPS=30
EVAL_REPO_ID="javasoup/eval_act_koch_test_2" # Optional: Repo to save evaluation results
NUM_EPISODES=10                             # Optional: Number of evaluation runs
EPISODE_TIME_S=30                           # Optional: Max time per run in seconds
# PUSH_TO_HUB=true                          # Optional: Uncomment to push evaluation data to Hub

# --- Execute the Command ---
echo "Running lerobot control script..."

python lerobot/scripts/control_robot.py \
    --robot.type="$ROBOT_TYPE" \
    --control.type="$CONTROL_TYPE" \
    --control.policy.path="$POLICY_PATH" \
    --control.single_task="$TASK_DESCRIPTION" \
    --control.fps="$FPS" \
    --control.repo_id="$EVAL_REPO_ID" \
    --control.num_episodes="$NUM_EPISODES" \
    --control.episode_time_s="$EPISODE_TIME_S" \
    # Add other arguments as needed below, uncommenting if necessary
    # --control.push_to_hub="$PUSH_TO_HUB" \

echo "Script finished."


#usage: control_robot.py [-h] [--config_path str] [--robot str]
#                        [--robot.type {aloha,koch,koch_bimanual,moss,so101,so100,stretch,lekiwi}]
#                       [--robot.gripper_open_degree [float]]
#                        [--robot.max_relative_target [int]] [--robot.ip str]
#                        [--robot.port int] [--robot.video_port int]
#                        [--robot.cameras Dict] [--robot.calibration_dir str]
#                        [--robot.leader_arms Dict]
#                        [--robot.follower_arms Dict]
#                        [--robot.teleop_keys Dict] [--robot.mock bool]
#                        [--control str]
#                        [--control.type {calibrate,teleoperate,record,replay,remote_robot}]
#                        [--control.arms [List]]
#                        [--control.teleop_time_s [float]]
#                        [--control.single_task str] [--policy str]
#                        [--control.policy.type {act,diffusion,pi0,tdmpc,vqbet,pi0fast}]
#                        [--control.policy.replace_final_stride_with_dilation int]
#                        [--control.policy.pre_norm bool]
#                        [--control.policy.dim_model int]
#                        [--control.policy.n_heads int]
#                        [--control.policy.dim_feedforward int]
#                        [--control.policy.feedforward_activation str]
#                        [--control.policy.n_encoder_layers int]
#                        [--control.policy.n_decoder_layers int]
#                        [--control.policy.use_vae bool]
#                        [--control.policy.n_vae_encoder_layers int]
#                        [--control.policy.temporal_ensemble_coeff [float]]
#                        [--control.policy.kl_weight float]
#                        [--control.policy.optimizer_lr_backbone float]
#                        [--control.policy.drop_n_last_frames int]
#                        [--control.policy.use_separate_rgb_encoder_per_camera bool]
#                        [--control.policy.down_dims int [int, ...]]
#                        [--control.policy.kernel_size int]
#                        [--control.policy.n_groups int]
#                        [--control.policy.diffusion_step_embed_dim int]
#                        [--control.policy.use_film_scale_modulation bool]
#                        [--control.policy.noise_scheduler_type str]
#                        [--control.policy.num_train_timesteps int]
#                        [--control.policy.beta_schedule str]
#                        [--control.policy.beta_start float]
#                        [--control.policy.beta_end float]
#                        [--control.policy.prediction_type str]
#                        [--control.policy.clip_sample bool]
#                        [--control.policy.clip_sample_range float]
#                        [--control.policy.num_inference_steps [int]]
#                        [--control.policy.do_mask_loss_for_padding bool]
#                        [--control.policy.scheduler_name str]
#                        [--control.policy.num_steps int]
#                        [--control.policy.attention_implementation str]
#                        [--control.policy.train_expert_only bool]
#                        [--control.policy.train_state_proj bool]
#                        [--control.policy.n_action_repeats int]
#                        [--control.policy.horizon int]
#                        [--control.policy.image_encoder_hidden_dim int]
#                        [--control.policy.state_encoder_hidden_dim int]
#                        [--control.policy.latent_dim int]
#                        [--control.policy.q_ensemble_size int]
#                        [--control.policy.mlp_dim int]
#                        [--control.policy.discount float]
#                        [--control.policy.use_mpc bool]
#                        [--control.policy.cem_iterations int]
#                        [--control.policy.max_std float]
#                        [--control.policy.min_std float]
#                        [--control.policy.n_gaussian_samples int]
#                        [--control.policy.n_pi_samples int]
#                        [--control.policy.uncertainty_regularizer_coeff float]
#                        [--control.policy.n_elites int]
#                        [--control.policy.elite_weighting_temperature float]
#                        [--control.policy.gaussian_mean_momentum float]
#                        [--control.policy.max_random_shift_ratio float]
#                        [--control.policy.reward_coeff float]
#                        [--control.policy.expectile_weight float]
#                        [--control.policy.value_coeff float]
#                        [--control.policy.consistency_coeff float]
#                        [--control.policy.advantage_scaling float]
#                        [--control.policy.pi_coeff float]
#                        [--control.policy.temporal_decay_coeff float]
#                        [--control.policy.target_model_momentum float]
#                        [--control.policy.n_action_pred_token int]
#                        [--control.policy.action_chunk_size int]
#                        [--control.policy.vision_backbone str]
#                        [--control.policy.crop_shape [int int]]
#                        [--control.policy.crop_is_random bool]
#                        [--control.policy.pretrained_backbone_weights [str]]
#                        [--control.policy.use_group_norm bool]
#                        [--control.policy.spatial_softmax_num_keypoints int]
#                        [--control.policy.n_vqvae_training_steps int]
#                        [--control.policy.vqvae_n_embed int]
#                        [--control.policy.vqvae_embedding_dim int]
#                        [--control.policy.vqvae_enc_hidden_dim int]
#                        [--control.policy.gpt_block_size int]
#                        [--control.policy.gpt_input_dim int]
#                        [--control.policy.gpt_output_dim int]
#                        [--control.policy.gpt_n_layer int]
#                        [--control.policy.gpt_n_head int]
#                        [--control.policy.gpt_hidden_dim int]
#                        [--control.policy.dropout float]
#                        [--control.policy.mlp_hidden_dim int]
#                        [--control.policy.offset_loss_weight float]
#                        [--control.policy.primary_code_loss_weight float]
#                        [--control.policy.secondary_code_loss_weight float]
#                        [--control.policy.bet_softmax_temperature float]
#                        [--control.policy.sequentially_select bool]
#                        [--control.policy.optimizer_vqvae_lr float]
#                        [--control.policy.optimizer_vqvae_weight_decay float]
#                        [--control.policy.n_obs_steps int]
#                        [--control.policy.normalization_mapping Dict]
#                        [--control.policy.input_features Dict]
#                        [--control.policy.output_features Dict]
#                        [--control.policy.device [str]]
#                        [--control.policy.use_amp bool]
#                        [--control.policy.chunk_size int]
#                        [--control.policy.n_action_steps int]
#                        [--control.policy.max_state_dim int]
#                        [--control.policy.max_action_dim int]
#                        [--control.policy.resize_imgs_with_padding int int]
#                        [--control.policy.interpolate_like_pi bool]
#                        [--control.policy.empty_cameras int]
#                        [--control.policy.adapt_to_pi_aloha bool]
#                        [--control.policy.use_delta_joint_actions_aloha bool]
#                        [--control.policy.tokenizer_max_length int]
#                        [--control.policy.proj_width int]
#                        [--control.policy.max_decoding_steps int]
#                        [--control.policy.fast_skip_tokens int]
#                        [--control.policy.max_input_seq_len int]
#                        [--control.policy.use_cache bool]
#                        [--control.policy.freeze_vision_encoder bool]
#                        [--control.policy.freeze_lm_head bool]
#                        [--control.policy.optimizer_lr float]
#                        [--control.policy.optimizer_betas float float]
#                        [--control.policy.optimizer_eps float]
#                        [--control.policy.optimizer_weight_decay float]
#                        [--control.policy.scheduler_warmup_steps int]
#                        [--control.policy.scheduler_decay_steps int]
#                        [--control.policy.scheduler_decay_lr float]
#                        [--control.policy.checkpoint_path str]
#                        [--control.policy.padding_side str]
#                        [--control.policy.precision str]
#                        [--control.policy.grad_clip_norm float]
#                        [--control.policy.relaxed_action_decoding bool]
#                        [--control.warmup_time_s int|float]
#                        [--control.episode_time_s int|float]
#                        [--control.reset_time_s int|float]
#                        [--control.num_episodes int] [--control.video bool]
#                        [--control.push_to_hub bool] [--control.private bool]
#                        [--control.tags [List]]
#                        [--control.num_image_writer_processes int]
#                        [--control.num_image_writer_threads_per_camera int]
#                        [--control.resume bool] [--control.repo_id str]
#                        [--control.episode int] [--control.root [str|Path]]
#                        [--control.fps [int]] [--control.play_sounds bool]
#                        [--control.log_interval int]
#                        [--control.display_data bool]
#                        [--control.viewer_ip [str]]
#                        [--control.viewer_port [str]]
#
#options:
#  -h, --help            show this help message and exit
#  --config_path str     Path for a config file to parse with draccus (default:
#                        None)
#  --robot str           Config file for robot (default: None)
#  --control str         Config file for control (default: None)
#  --policy str          Config file for policy (default: None)
#
#ControlPipelineConfig:
#
#RobotConfig ['robot']:
#
#  --robot.type {aloha,koch,koch_bimanual,moss,so101,so100,stretch,lekiwi}
#                        Which type of RobotConfig ['robot'] to use (default:
#                        None)
#
#AlohaRobotConfig ['robot']:
#
#  --robot.leader_arms Dict
#  --robot.follower_arms Dict
#  --robot.cameras Dict  Troubleshooting: If one of your IntelRealSense cameras
#                        freeze during data recording due to bandwidth limit,
#                        you might need to plug the camera on another USB hub
                        #or PCIe card. (default: {'cam_high':
                        #IntelRealSenseCameraConfig(name=None,
                        #serial_number=128422271347, fps=30, width=640,
                        #height=480, color_mode='rgb', channels=3,
                        #use_depth=False, force_hardware_reset=True,
                        #rotation=None, mock=False), 'cam_low':
                        #IntelRealSenseCameraConfig(name=None,
                        #serial_number=130322270656, fps=30, width=640,
                        #height=480, color_mode='rgb', channels=3,
                        #use_depth=False, force_hardware_reset=True,
                        #rotation=None, mock=False), 'cam_left_wrist':
                        #IntelRealSenseCameraConfig(name=None,
                        #serial_number=218622272670, fps=30, width=640,
                        #height=480, color_mode='rgb', channels=3,
                        #use_depth=False, force_hardware_reset=True,
                        #rotation=None, mock=False), 'cam_right_wrist':
                        #IntelRealSenseCameraConfig(name=None,
                        #serial_number=130322272300, fps=30, width=640,
                        #height=480, color_mode='rgb', channels=3,
                        #use_depth=False, force_hardware_reset=True,
                        #rotation=None, mock=False)})
  #--robot.max_relative_target [int]
                        #/!\ FOR SAFETY, READ THIS /!\ `max_relative_target`
                        #limits the magnitude of the relative positional target
                        #vector for safety purposes. Set this to a positive
                        #scalar to have the same value for all motors, or a
                        #list that is the same length as the number of motors
                        #in your follower arms. For Aloha, for every goal
                        #position request, motor rotations are capped at 5
                        #degrees by default. When you feel more confident with
                        #teleoperation or running the policy, you can extend
                        #this safety limit and even removing it by setting it
                        #to `null`. Also, everything is expected to work safely
                        #out-of-the-box, but we highly advise to first try to
                        #teleoperate the grippers only (by commenting out the
                        #rest of the motors in this yaml), then to gradually
                        #add more motors (by uncommenting), until you can
                        #teleoperate both arms fully (default: 5)
  #--robot.gripper_open_degree [float]
                        #Optionally set the leader arm in torque mode with the
                        #gripper motor set to this angle. This makes it
                        #possible to squeeze the gripper and have it spring
                        #back to an open position on its own. If None, the
                        #gripper is not put in torque mode. (default: None)
  #--robot.mock bool     
  #--robot.calibration_dir str
                        #Specific to Aloha, LeRobot comes with default
                        #calibration files. Assuming the motors have been
                        #properly assembled, no manual calibration step is
                        #expected. If you need to run manual calibration,
                        #simply update this path to ".cache/calibration/aloha"
                        #(default: .cache/calibration/aloha_default)
#
#KochRobotConfig ['robot']:
#
  #--robot.leader_arms Dict
  #--robot.follower_arms Dict
  #--robot.cameras Dict  
  #--robot.max_relative_target [int]
                        #`max_relative_target` limits the magnitude of the
                        #relative positional target vector for safety purposes.
                        #Set this to a positive scalar to have the same value
                        #for all motors, or a list that is the same length as
                        #the number of motors in your follower arms. (default:
                        #None)
  #--robot.gripper_open_degree float
                        #~ Koch specific settings ~ Sets the leader arm in
                        #torque mode with the gripper motor set to this angle.
                        #This makes it possible to squeeze the gripper and have
                        #it spring back to an open position on its own.
                        #(default: 35.156)
  #--robot.mock bool     
  #--robot.calibration_dir str
#
#KochBimanualRobotConfig ['robot']:
#
  #--robot.leader_arms Dict
  #--robot.follower_arms Dict
  #--robot.cameras Dict  
  #--robot.max_relative_target [int]
                        #`max_relative_target` limits the magnitude of the
                        #relative positional target vector for safety purposes.
                        #Set this to a positive scalar to have the same value
                        #for all motors, or a list that is the same length as
                        #the number of motors in your follower arms. (default:
                        #None)
  #--robot.gripper_open_degree float
                        #~ Koch specific settings ~ Sets the leader arm in
                        #torque mode with the gripper motor set to this angle.
                        #This makes it possible to squeeze the gripper and have
                        #it spring back to an open position on its own.
                        #(default: 35.156)
  #--robot.mock bool     
  #--robot.calibration_dir str
#
#MossRobotConfig ['robot']:
#
  #--robot.leader_arms Dict
  #--robot.follower_arms Dict
  #--robot.cameras Dict  
  #--robot.max_relative_target [int]
                        #`max_relative_target` limits the magnitude of the
                        #relative positional target vector for safety purposes.
                        #Set this to a positive scalar to have the same value
                        #for all motors, or a list that is the same length as
                        #the number of motors in your follower arms. (default:
                        #None)
  #--robot.gripper_open_degree [float]
                        #Optionally set the leader arm in torque mode with the
                        #gripper motor set to this angle. This makes it
                        #possible to squeeze the gripper and have it spring
                        #back to an open position on its own. If None, the
                        #gripper is not put in torque mode. (default: None)
  #--robot.mock bool     
  #--robot.calibration_dir str
#
#So101RobotConfig ['robot']:
#
  #--robot.leader_arms Dict
  #--robot.follower_arms Dict
  #--robot.cameras Dict  
  #--robot.max_relative_target [int]
                        #`max_relative_target` limits the magnitude of the
                        #relative positional target vector for safety purposes.
                        #Set this to a positive scalar to have the same value
                        #for all motors, or a list that is the same length as
                        #the number of motors in your follower arms. (default:
                        #None)
  #--robot.gripper_open_degree [float]
                        #Optionally set the leader arm in torque mode with the
                        #gripper motor set to this angle. This makes it
                        #possible to squeeze the gripper and have it spring
                        #back to an open position on its own. If None, the
                        #gripper is not put in torque mode. (default: None)
  #--robot.mock bool     
  #--robot.calibration_dir str
#
#So100RobotConfig ['robot']:
#
  #--robot.leader_arms Dict
  #--robot.follower_arms Dict
  #--robot.cameras Dict  
  #--robot.max_relative_target [int]
                        #`max_relative_target` limits the magnitude of the
                        #relative positional target vector for safety purposes.
                        #Set this to a positive scalar to have the same value
                        #for all motors, or a list that is the same length as
                        #the number of motors in your follower arms. (default:
                        #None)
  #--robot.gripper_open_degree [float]
                        #Optionally set the leader arm in torque mode with the
                        #gripper motor set to this angle. This makes it
                        #possible to squeeze the gripper and have it spring
                        #back to an open position on its own. If None, the
                        #gripper is not put in torque mode. (default: None)
  #--robot.mock bool     
  #--robot.calibration_dir str
#
#StretchRobotConfig ['robot']:
#
  #--robot.max_relative_target [int]
                        #`max_relative_target` limits the magnitude of the
                        #relative positional target vector for safety purposes.
                        #Set this to a positive scalar to have the same value
                        #for all motors, or a list that is the same length as
                        #the number of motors in your follower arms. (default:
                        #None)
  #--robot.cameras Dict  
  #--robot.mock bool     
#
#LeKiwiRobotConfig ['robot']:
#
  #--robot.max_relative_target [int]
                        #`max_relative_target` limits the magnitude of the
                        #relative positional target vector for safety purposes.
                        #Set this to a positive scalar to have the same value
                        #for all motors, or a list that is the same length as
                        #the number of motors in your follower arms. (default:
                        #None)
  #--robot.ip str        Network Configuration (default: 192.168.0.193)
  #--robot.port int      
  #--robot.video_port int
  #--robot.cameras Dict  
  #--robot.calibration_dir str
  #--robot.leader_arms Dict
  #--robot.follower_arms Dict
  #--robot.teleop_keys Dict
  #--robot.mock bool     
#
#ControlConfig ['control']:
#
  #--control.type {calibrate,teleoperate,record,replay,remote_robot}
                        #Which type of ControlConfig ['control'] to use
                        #(default: None)
#
#CalibrateControlConfig ['control']:
#
  #--control.arms [List]
                        #List of arms to calibrate (e.g.
                        #`--arms='["left_follower","right_follower"]'
                        #left_leader`) (default: None)
#
#TeleoperateControlConfig ['control']:
#
  #--control.fps [int]   Limit the maximum frames per second. By default, no
                        #limit. (default: None)
  #--control.teleop_time_s [float]
  #--control.display_data bool
                        #Display all cameras on screen (default: False)
#
#RecordControlConfig ['control']:
#
  #--control.repo_id str
                        #Dataset identifier. By convention it should match
                        #'{hf_username}/{dataset_name}' (e.g. `lerobot/test`).
                        #(default: None)
  #--control.single_task str
                        #A short but accurate description of the task performed
                        #during the recording (e.g. "Pick the Lego block and
                        #drop it in the box on the right.") (default: None)
  #--control.root [str|Path]
                        #Root directory where the dataset will be stored (e.g.
                        #'dataset/path'). (default: None)
  #--control.fps [int]   Limit the frames per second. By default, uses the
                        #policy fps. (default: None)
  #--control.warmup_time_s int|float
                        #Number of seconds before starting data collection. It
                        #allows the robot devices to warmup and synchronize.
                        #(default: 10)
  #--control.episode_time_s int|float
                        #Number of seconds for data recording for each episode.
                        #(default: 60)
  #--control.reset_time_s int|float
                        #Number of seconds for resetting the environment after
                        #each episode. (default: 60)
  #--control.num_episodes int
                        #Number of episodes to record. (default: 50)
  #--control.video bool  Encode frames in the dataset into video (default:
                        #True)
  #--control.push_to_hub bool
                        #Upload dataset to Hugging Face hub. (default: True)
  #--control.private bool
                        #Upload on private repository on the Hugging Face hub.
                        #(default: False)
  #--control.tags [List]
                        #Add tags to your dataset on the hub. (default: None)
  #--control.num_image_writer_processes int
                        #Number of subprocesses handling the saving of frames
                        #as PNG. Set to 0 to use threads only; set to ≥1 to use
                        #subprocesses, each using threads to write images. The
                        #best number of processes and threads depends on your
                        #system. We recommend 4 threads per camera with 0
                        #processes. If fps is unstable, adjust the thread
                        #count. If still unstable, try using 1 or more
                        #subprocesses. (default: 0)
  #--control.num_image_writer_threads_per_camera int
                        #Number of threads writing the frames as png images on
                        #disk, per camera. Too many threads might cause
                        #unstable teleoperation fps due to main thread being
                        #blocked. Not enough threads might cause low camera
                        #fps. (default: 4)
  #--control.display_data bool
                        #Display all cameras on screen (default: False)
  #--control.play_sounds bool
                        #Use vocal synthesis to read events. (default: True)
  #--control.resume bool
                        #Resume recording on an existing dataset. (default:
                        #False)
#
#Optional ['control.policy']:
#
#PreTrainedConfig ['control.policy']:
  #
      #Base configuration class for policy models.
  #
      #Args:
          #n_obs_steps: Number of environment steps worth of observations to pass to the policy (takes the
              #current step and additional steps going back).
          #input_shapes: A dictionary defining the shapes of the input data for the policy.
          #output_shapes: A dictionary defining the shapes of the output data for the policy.
          #input_normalization_modes: A dictionary with key representing the modality and the value specifies the
              #normalization mode to apply.
          #output_normalization_modes: Similar dictionary as `input_normalization_modes`, but to unnormalize to
              #the original scale.
      #
#
  #--control.policy.type {act,diffusion,pi0,tdmpc,vqbet,pi0fast}
                        #Which type of PreTrainedConfig ['control.policy'] to
                        #use (default: None)
#
#ACTConfig ['control.policy']:
  #Configuration class for the Action Chunking Transformers policy.
  #
      #Defaults are configured for training on bimanual Aloha tasks like "insertion" or "transfer".
  #
      #The parameters you will most likely need to change are the ones which depend on the environment / sensors.
      #Those are: `input_shapes` and 'output_shapes`.
  #
      #Notes on the inputs and outputs:
          #- Either:
              #- At least one key starting with "observation.image is required as an input.
                #AND/OR
              #- The key "observation.environment_state" is required as input.
          #- If there are multiple keys beginning with "observation.images." they are treated as multiple camera
            #views. Right now we only support all images having the same shape.
          #- May optionally work without an "observation.state" key for the proprioceptive robot state.
          #- "action" is required as an output key.
  #
      #Args:
          #n_obs_steps: Number of environment steps worth of observations to pass to the policy (takes the
              #current step and additional steps going back).
          #chunk_size: The size of the action prediction "chunks" in units of environment steps.
          #n_action_steps: The number of action steps to run in the environment for one invocation of the policy.
              #This should be no greater than the chunk size. For example, if the chunk size size 100, you may
              #set this to 50. This would mean that the model predicts 100 steps worth of actions, runs 50 in the
              #environment, and throws the other 50 out.
          #input_shapes: A dictionary defining the shapes of the input data for the policy. The key represents
              #the input data name, and the value is a list indicating the dimensions of the corresponding data.
              #For example, "observation.image" refers to an input from a camera with dimensions [3, 96, 96],
              #indicating it has three color channels and 96x96 resolution. Importantly, `input_shapes` doesn't
              #include batch dimension or temporal dimension.
          #output_shapes: A dictionary defining the shapes of the output data for the policy. The key represents
              #the output data name, and the value is a list indicating the dimensions of the corresponding data.
              #For example, "action" refers to an output shape of [14], indicating 14-dimensional actions.
              #Importantly, `output_shapes` doesn't include batch dimension or temporal dimension.
          #input_normalization_modes: A dictionary with key representing the modality (e.g. "observation.state"),
              #and the value specifies the normalization mode to apply. The two available modes are "mean_std"
              #which subtracts the mean and divides by the standard deviation and "min_max" which rescale in a
              #[-1, 1] range.
          #output_normalization_modes: Similar dictionary as `normalize_input_modes`, but to unnormalize to the
              #original scale. Note that this is also used for normalizing the training targets.
          #vision_backbone: Name of the torchvision resnet backbone to use for encoding images.
          #pretrained_backbone_weights: Pretrained weights from torchvision to initialize the backbone.
              #`None` means no pretrained weights.
          #replace_final_stride_with_dilation: Whether to replace the ResNet's final 2x2 stride with a dilated
              #convolution.
          #pre_norm: Whether to use "pre-norm" in the transformer blocks.
          #dim_model: The transformer blocks' main hidden dimension.
          #n_heads: The number of heads to use in the transformer blocks' multi-head attention.
          #dim_feedforward: The dimension to expand the transformer's hidden dimension to in the feed-forward
              #layers.
          #feedforward_activation: The activation to use in the transformer block's feed-forward layers.
          #n_encoder_layers: The number of transformer layers to use for the transformer encoder.
          #n_decoder_layers: The number of transformer layers to use for the transformer decoder.
          #use_vae: Whether to use a variational objective during training. This introduces another transformer
              #which is used as the VAE's encoder (not to be confused with the transformer encoder - see
              #documentation in the policy class).
          #latent_dim: The VAE's latent dimension.
          #n_vae_encoder_layers: The number of transformer layers to use for the VAE's encoder.
          #temporal_ensemble_coeff: Coefficient for the exponential weighting scheme to apply for temporal
              #ensembling. Defaults to None which means temporal ensembling is not used. `n_action_steps` must be
              #1 when using this feature, as inference needs to happen at every step to form an ensemble. For
              #more information on how ensembling works, please see `ACTTemporalEnsembler`.
          #dropout: Dropout to use in the transformer layers (see code for details).
          #kl_weight: The weight to use for the KL-divergence component of the loss if the variational objective
              #is enabled. Loss is then calculated as: `reconstruction_loss + kl_weight * kld_loss`.
      #
#
  #--control.policy.n_obs_steps int
  #--control.policy.normalization_mapping Dict
  #--control.policy.input_features Dict
  #--control.policy.output_features Dict
  #--control.policy.device [str]
                        #cuda | cpu | mp (default: None)
  #--control.policy.use_amp bool
                        #`use_amp` determines whether to use Automatic Mixed
                        #Precision (AMP) for training and evaluation. With AMP,
                        #automatic gradient scaling is used. (default: False)
  #--control.policy.chunk_size int
  #--control.policy.n_action_steps int
  #--control.policy.vision_backbone str
  #--control.policy.pretrained_backbone_weights [str]
  #--control.policy.replace_final_stride_with_dilation int
  #--control.policy.pre_norm bool
  #--control.policy.dim_model int
  #--control.policy.n_heads int
  #--control.policy.dim_feedforward int
  #--control.policy.feedforward_activation str
  #--control.policy.n_encoder_layers int
  #--control.policy.n_decoder_layers int
  #--control.policy.use_vae bool
  #--control.policy.latent_dim int
  #--control.policy.n_vae_encoder_layers int
  #--control.policy.temporal_ensemble_coeff [float]
  #--control.policy.dropout float
  #--control.policy.kl_weight float
  #--control.policy.optimizer_lr float
                        #Training preset (default: 1e-05)
  #--control.policy.optimizer_weight_decay float
  #--control.policy.optimizer_lr_backbone float
#
#DiffusionConfig ['control.policy']:
  #Configuration class for DiffusionPolicy.
  #
      #Defaults are configured for training with PushT providing proprioceptive and single camera observations.
  #
      #The parameters you will most likely need to change are the ones which depend on the environment / sensors.
      #Those are: `input_shapes` and `output_shapes`.
  #
      #Notes on the inputs and outputs:
          #- "observation.state" is required as an input key.
          #- Either:
              #- At least one key starting with "observation.image is required as an input.
                #AND/OR
              #- The key "observation.environment_state" is required as input.
          #- If there are multiple keys beginning with "observation.image" they are treated as multiple camera
            #views. Right now we only support all images having the same shape.
          #- "action" is required as an output key.
  #
      #Args:
          #n_obs_steps: Number of environment steps worth of observations to pass to the policy (takes the
              #current step and additional steps going back).
          #horizon: Diffusion model action prediction size as detailed in `DiffusionPolicy.select_action`.
          #n_action_steps: The number of action steps to run in the environment for one invocation of the policy.
              #See `DiffusionPolicy.select_action` for more details.
          #input_shapes: A dictionary defining the shapes of the input data for the policy. The key represents
              #the input data name, and the value is a list indicating the dimensions of the corresponding data.
              #For example, "observation.image" refers to an input from a camera with dimensions [3, 96, 96],
              #indicating it has three color channels and 96x96 resolution. Importantly, `input_shapes` doesn't
              #include batch dimension or temporal dimension.
          #output_shapes: A dictionary defining the shapes of the output data for the policy. The key represents
              #the output data name, and the value is a list indicating the dimensions of the corresponding data.
              #For example, "action" refers to an output shape of [14], indicating 14-dimensional actions.
              #Importantly, `output_shapes` doesn't include batch dimension or temporal dimension.
          #input_normalization_modes: A dictionary with key representing the modality (e.g. "observation.state"),
              #and the value specifies the normalization mode to apply. The two available modes are "mean_std"
              #which subtracts the mean and divides by the standard deviation and "min_max" which rescale in a
              #[-1, 1] range.
          #output_normalization_modes: Similar dictionary as `normalize_input_modes`, but to unnormalize to the
              #original scale. Note that this is also used for normalizing the training targets.
          #vision_backbone: Name of the torchvision resnet backbone to use for encoding images.
          #crop_shape: (H, W) shape to crop images to as a preprocessing step for the vision backbone. Must fit
              #within the image size. If None, no cropping is done.
          #crop_is_random: Whether the crop should be random at training time (it's always a center crop in eval
              #mode).
          #pretrained_backbone_weights: Pretrained weights from torchvision to initialize the backbone.
              #`None` means no pretrained weights.
          #use_group_norm: Whether to replace batch normalization with group normalization in the backbone.
              #The group sizes are set to be about 16 (to be precise, feature_dim // 16).
          #spatial_softmax_num_keypoints: Number of keypoints for SpatialSoftmax.
          #use_separate_rgb_encoders_per_camera: Whether to use a separate RGB encoder for each camera view.
          #down_dims: Feature dimension for each stage of temporal downsampling in the diffusion modeling Unet.
              #You may provide a variable number of dimensions, therefore also controlling the degree of
              #downsampling.
          #kernel_size: The convolutional kernel size of the diffusion modeling Unet.
          #n_groups: Number of groups used in the group norm of the Unet's convolutional blocks.
          #diffusion_step_embed_dim: The Unet is conditioned on the diffusion timestep via a small non-linear
              #network. This is the output dimension of that network, i.e., the embedding dimension.
          #use_film_scale_modulation: FiLM (https://arxiv.org/abs/1709.07871) is used for the Unet conditioning.
              #Bias modulation is used be default, while this parameter indicates whether to also use scale
              #modulation.
          #noise_scheduler_type: Name of the noise scheduler to use. Supported options: ["DDPM", "DDIM"].
          #num_train_timesteps: Number of diffusion steps for the forward diffusion schedule.
          #beta_schedule: Name of the diffusion beta schedule as per DDPMScheduler from Hugging Face diffusers.
          #beta_start: Beta value for the first forward-diffusion step.
          #beta_end: Beta value for the last forward-diffusion step.
          #prediction_type: The type of prediction that the diffusion modeling Unet makes. Choose from "epsilon"
              #or "sample". These have equivalent outcomes from a latent variable modeling perspective, but
              #"epsilon" has been shown to work better in many deep neural network settings.
          #clip_sample: Whether to clip the sample to [-`clip_sample_range`, +`clip_sample_range`] for each
              #denoising step at inference time. WARNING: you will need to make sure your action-space is
              #normalized to fit within this range.
          #clip_sample_range: The magnitude of the clipping range as described above.
          #num_inference_steps: Number of reverse diffusion steps to use at inference time (steps are evenly
              #spaced). If not provided, this defaults to be the same as `num_train_timesteps`.
          #do_mask_loss_for_padding: Whether to mask the loss when there are copy-padded actions. See
              #`LeRobotDataset` and `load_previous_and_future_frames` for more information. Note, this defaults
              #to False as the original Diffusion Policy implementation does the same.
      #
#
  #--control.policy.n_obs_steps int
  #--control.policy.normalization_mapping Dict
  #--control.policy.input_features Dict
  #--control.policy.output_features Dict
  #--control.policy.device [str]
                        #cuda | cpu | mp (default: None)
  #--control.policy.use_amp bool
                        #`use_amp` determines whether to use Automatic Mixed
                        #Precision (AMP) for training and evaluation. With AMP,
                        #automatic gradient scaling is used. (default: False)
  #--control.policy.horizon int
  #--control.policy.n_action_steps int
  #--control.policy.drop_n_last_frames int
                        #horizon - n_action_steps - n_obs_steps + 1 (default:
                        #7)
  #--control.policy.vision_backbone str
  #--control.policy.crop_shape [int int]
  #--control.policy.crop_is_random bool
  #--control.policy.pretrained_backbone_weights [str]
  #--control.policy.use_group_norm bool
  #--control.policy.spatial_softmax_num_keypoints int
  #--control.policy.use_separate_rgb_encoder_per_camera bool
  #--control.policy.down_dims int [int, ...]
  #--control.policy.kernel_size int
  #--control.policy.n_groups int
  #--control.policy.diffusion_step_embed_dim int
  #--control.policy.use_film_scale_modulation bool
  #--control.policy.noise_scheduler_type str
                        #Noise scheduler. (default: DDPM)
  #--control.policy.num_train_timesteps int
  #--control.policy.beta_schedule str
  #--control.policy.beta_start float
  #--control.policy.beta_end float
  #--control.policy.prediction_type str
  #--control.policy.clip_sample bool
  #--control.policy.clip_sample_range float
  #--control.policy.num_inference_steps [int]
  #--control.policy.do_mask_loss_for_padding bool
  #--control.policy.optimizer_lr float
                        #Training presets (default: 0.0001)
  #--control.policy.optimizer_betas Any
  #--control.policy.optimizer_eps float
  #--control.policy.optimizer_weight_decay float
  #--control.policy.scheduler_name str
  #--control.policy.scheduler_warmup_steps int
#
#PI0Config ['control.policy']:
#
  #--control.policy.n_obs_steps int
                        #Input / output structure. (default: 1)
  #--control.policy.normalization_mapping Dict
  #--control.policy.input_features Dict
  #--control.policy.output_features Dict
  #--control.policy.device [str]
                        #cuda | cpu | mp (default: None)
  #--control.policy.use_amp bool
                        #`use_amp` determines whether to use Automatic Mixed
                        #Precision (AMP) for training and evaluation. With AMP,
                        #automatic gradient scaling is used. (default: False)
  #--control.policy.chunk_size int
  #--control.policy.n_action_steps int
  #--control.policy.max_state_dim int
                        #Shorter state and action vectors will be padded
                        #(default: 32)
  #--control.policy.max_action_dim int
  #--control.policy.resize_imgs_with_padding int int
                        #Image preprocessing (default: (224, 224))
  #--control.policy.empty_cameras int
                        #Add empty images. Used by pi0_aloha_sim which adds the
                        #empty left and right wrist cameras in addition to the
                        #top camera. (default: 0)
  #--control.policy.adapt_to_pi_aloha bool
                        #Converts the joint and gripper values from the
                        #standard Aloha space to the space used by the pi
                        #internal runtime which was used to train the base
                        #model. (default: False)
  #--control.policy.use_delta_joint_actions_aloha bool
                        #Converts joint dimensions to deltas with respect to
                        #the current state before passing to the model. Gripper
                        #dimensions will remain in absolute values. (default:
                        #False)
  #--control.policy.tokenizer_max_length int
                        #Tokenizer (default: 48)
  #--control.policy.proj_width int
                        #Projector (default: 1024)
  #--control.policy.num_steps int
                        #Decoding (default: 10)
  #--control.policy.use_cache bool
                        #Attention utils (default: True)
  #--control.policy.attention_implementation str
                        #or fa2, flex (default: eager)
  #--control.policy.freeze_vision_encoder bool
                        #Finetuning settings (default: True)
  #--control.policy.train_expert_only bool
  #--control.policy.train_state_proj bool
  #--control.policy.optimizer_lr float
                        #Training presets (default: 2.5e-05)
  #--control.policy.optimizer_betas float float
  #--control.policy.optimizer_eps float
  #--control.policy.optimizer_weight_decay float
  #--control.policy.scheduler_warmup_steps int
  #--control.policy.scheduler_decay_steps int
  #--control.policy.scheduler_decay_lr float
#
#TDMPCConfig ['control.policy']:
  #Configuration class for TDMPCPolicy.
  #
      #Defaults are configured for training with xarm_lift_medium_replay providing proprioceptive and single
      #camera observations.
  #
      #The parameters you will most likely need to change are the ones which depend on the environment / sensors.
      #Those are: `input_shapes`, `output_shapes`, and perhaps `max_random_shift_ratio`.
  #
      #Args:
          #n_action_repeats: The number of times to repeat the action returned by the planning. (hint: Google
              #action repeats in Q-learning or ask your favorite chatbot)
          #horizon: Horizon for model predictive control.
          #n_action_steps: Number of action steps to take from the plan given by model predictive control. This
              #is an alternative to using action repeats. If this is set to more than 1, then we require
              #`n_action_repeats == 1`, `use_mpc == True` and `n_action_steps <= horizon`. Note that this
              #approach of using multiple steps from the plan is not in the original implementation.
          #input_shapes: A dictionary defining the shapes of the input data for the policy. The key represents
              #the input data name, and the value is a list indicating the dimensions of the corresponding data.
              #For example, "observation.image" refers to an input from a camera with dimensions [3, 96, 96],
              #indicating it has three color channels and 96x96 resolution. Importantly, `input_shapes` doesn't
              #include batch dimension or temporal dimension.
          #output_shapes: A dictionary defining the shapes of the output data for the policy. The key represents
              #the output data name, and the value is a list indicating the dimensions of the corresponding data.
              #For example, "action" refers to an output shape of [14], indicating 14-dimensional actions.
              #Importantly, `output_shapes` doesn't include batch dimension or temporal dimension.
          #input_normalization_modes: A dictionary with key representing the modality (e.g. "observation.state"),
              #and the value specifies the normalization mode to apply. The two available modes are "mean_std"
              #which subtracts the mean and divides by the standard deviation and "min_max" which rescale in a
              #[-1, 1] range. Note that here this defaults to None meaning inputs are not normalized. This is to
              #match the original implementation.
          #output_normalization_modes: Similar dictionary as `normalize_input_modes`, but to unnormalize to the
              #original scale. Note that this is also used for normalizing the training targets. NOTE: Clipping
              #to [-1, +1] is used during MPPI/CEM. Therefore, it is recommended that you stick with "min_max"
              #normalization mode here.
          #image_encoder_hidden_dim: Number of channels for the convolutional layers used for image encoding.
          #state_encoder_hidden_dim: Hidden dimension for MLP used for state vector encoding.
          #latent_dim: Observation's latent embedding dimension.
          #q_ensemble_size: Number of Q function estimators to use in an ensemble for uncertainty estimation.
          #mlp_dim: Hidden dimension of MLPs used for modelling the dynamics encoder, reward function, policy
              #(π), Q ensemble, and V.
          #discount: Discount factor (γ) to use for the reinforcement learning formalism.
          #use_mpc: Whether to use model predictive control. The alternative is to just sample the policy model
              #(π) for each step.
          #cem_iterations: Number of iterations for the MPPI/CEM loop in MPC.
          #max_std: Maximum standard deviation for actions sampled from the gaussian PDF in CEM.
          #min_std: Minimum standard deviation for noise applied to actions sampled from the policy model (π).
              #Doubles up as the minimum standard deviation for actions sampled from the gaussian PDF in CEM.
          #n_gaussian_samples: Number of samples to draw from the gaussian distribution every CEM iteration. Must
              #be non-zero.
          #n_pi_samples: Number of samples to draw from the policy / world model rollout every CEM iteration. Can
              #be zero.
          #uncertainty_regularizer_coeff: Coefficient for the uncertainty regularization used when estimating
              #trajectory values (this is the λ coefficient in eqn 4 of FOWM).
          #n_elites: The number of elite samples to use for updating the gaussian parameters every CEM iteration.
          #elite_weighting_temperature: The temperature to use for softmax weighting (by trajectory value) of the
              #elites, when updating the gaussian parameters for CEM.
          #gaussian_mean_momentum: Momentum (α) used for EMA updates of the mean parameter μ of the gaussian
              #parameters optimized in CEM. Updates are calculated as μ⁻ ← αμ⁻ + (1-α)μ.
          #max_random_shift_ratio: Maximum random shift (as a proportion of the image size) to apply to the
              #image(s) (in units of pixels) for training-time augmentation. If set to 0, no such augmentation
              #is applied. Note that the input images are assumed to be square for this augmentation.
          #reward_coeff: Loss weighting coefficient for the reward regression loss.
          #expectile_weight: Weighting (τ) used in expectile regression for the state value function (V).
              #v_pred < v_target is weighted by τ and v_pred >= v_target is weighted by (1-τ). τ is expected to
              #be in [0, 1]. Setting τ closer to 1 results in a more "optimistic" V. This is sensible to do
              #because v_target is obtained by evaluating the learned state-action value functions (Q) with
              #in-sample actions that may not be always optimal.
          #value_coeff: Loss weighting coefficient for both the state-action value (Q) TD loss, and the state
              #value (V) expectile regression loss.
          #consistency_coeff: Loss weighting coefficient for the consistency loss.
          #advantage_scaling: A factor by which the advantages are scaled prior to exponentiation for advantage
              #weighted regression of the policy (π) estimator parameters. Note that the exponentiated advantages
              #are clamped at 100.0.
          #pi_coeff: Loss weighting coefficient for the action regression loss.
          #temporal_decay_coeff: Exponential decay coefficient for decaying the loss coefficient for future time-
              #steps. Hint: each loss computation involves `horizon` steps worth of actions starting from the
              #current time step.
          #target_model_momentum: Momentum (α) used for EMA updates of the target models. Updates are calculated
              #as ϕ ← αϕ + (1-α)θ where ϕ are the parameters of the target model and θ are the parameters of the
              #model being trained.
      #
#
  #--control.policy.n_obs_steps int
                        #Input / output structure. (default: 1)
  #--control.policy.normalization_mapping Dict
  #--control.policy.input_features Dict
  #--control.policy.output_features Dict
  #--control.policy.device [str]
                        #cuda | cpu | mp (default: None)
  #--control.policy.use_amp bool
                        #`use_amp` determines whether to use Automatic Mixed
                        #Precision (AMP) for training and evaluation. With AMP,
                        #automatic gradient scaling is used. (default: False)
  #--control.policy.n_action_repeats int
  #--control.policy.horizon int
  #--control.policy.n_action_steps int
  #--control.policy.image_encoder_hidden_dim int
  #--control.policy.state_encoder_hidden_dim int
  #--control.policy.latent_dim int
  #--control.policy.q_ensemble_size int
  #--control.policy.mlp_dim int
  #--control.policy.discount float
  #--control.policy.use_mpc bool
  #--control.policy.cem_iterations int
  #--control.policy.max_std float
  #--control.policy.min_std float
  #--control.policy.n_gaussian_samples int
  #--control.policy.n_pi_samples int
  #--control.policy.uncertainty_regularizer_coeff float
  #--control.policy.n_elites int
  #--control.policy.elite_weighting_temperature float
  #--control.policy.gaussian_mean_momentum float
  #--control.policy.max_random_shift_ratio float
  #--control.policy.reward_coeff float
  #--control.policy.expectile_weight float
  #--control.policy.value_coeff float
  #--control.policy.consistency_coeff float
  #--control.policy.advantage_scaling float
  #--control.policy.pi_coeff float
  #--control.policy.temporal_decay_coeff float
  #--control.policy.target_model_momentum float
  #--control.policy.optimizer_lr float
                        #Training presets (default: 0.0003)
#
#VQBeTConfig ['control.policy']:
  #Configuration class for VQ-BeT.
  #
      #Defaults are configured for training with PushT providing proprioceptive and single camera observations.
  #
      #The parameters you will most likely need to change are the ones which depend on the environment / sensors.
      #Those are: `input_shapes` and `output_shapes`.
  #
      #Notes on the inputs and outputs:
          #- "observation.state" is required as an input key.
          #- At least one key starting with "observation.image is required as an input.
          #- If there are multiple keys beginning with "observation.image" they are treated as multiple camera
            #views. Right now we only support all images having the same shape.
          #- "action" is required as an output key.
  #
      #Args:
          #n_obs_steps: Number of environment steps worth of observations to pass to the policy (takes the
              #current step and additional steps going back).
          #n_action_pred_token: Total number of current token and future tokens that VQ-BeT predicts.
          #action_chunk_size: Action chunk size of each action prediction token.
          #input_shapes: A dictionary defining the shapes of the input data for the policy.
              #The key represents the input data name, and the value is a list indicating the dimensions
              #of the corresponding data. For example, "observation.image" refers to an input from
              #a camera with dimensions [3, 96, 96], indicating it has three color channels and 96x96 resolution.
              #Importantly, shapes doesnt include batch dimension or temporal dimension.
          #output_shapes: A dictionary defining the shapes of the output data for the policy.
              #The key represents the output data name, and the value is a list indicating the dimensions
              #of the corresponding data. For example, "action" refers to an output shape of [14], indicating
              #14-dimensional actions. Importantly, shapes doesnt include batch dimension or temporal dimension.
          #input_normalization_modes: A dictionary with key representing the modality (e.g. "observation.state"),
              #and the value specifies the normalization mode to apply. The two available modes are "mean_std"
              #which subtracts the mean and divides by the standard deviation and "min_max" which rescale in a
              #[-1, 1] range.
          #output_normalization_modes: Similar dictionary as `normalize_input_modes`, but to unnormalize to the
              #original scale. Note that this is also used for normalizing the training targets.
          #vision_backbone: Name of the torchvision resnet backbone to use for encoding images.
          #crop_shape: (H, W) shape to crop images to as a preprocessing step for the vision backbone. Must fit
              #within the image size. If None, no cropping is done.
          #crop_is_random: Whether the crop should be random at training time (it's always a center crop in eval
              #mode).
          #pretrained_backbone_weights: Pretrained weights from torchvision to initialize the backbone.
              #`None` means no pretrained weights.
          #use_group_norm: Whether to replace batch normalization with group normalization in the backbone.
              #The group sizes are set to be about 16 (to be precise, feature_dim // 16).
          #spatial_softmax_num_keypoints: Number of keypoints for SpatialSoftmax.
          #n_vqvae_training_steps: Number of optimization steps for training Residual VQ.
          #vqvae_n_embed: Number of embedding vectors in the RVQ dictionary (each layer).
          #vqvae_embedding_dim: Dimension of each embedding vector in the RVQ dictionary.
          #vqvae_enc_hidden_dim: Size of hidden dimensions of Encoder / Decoder part of Residaul VQ-VAE
          #gpt_block_size: Max block size of minGPT (should be larger than the number of input tokens)
          #gpt_input_dim: Size of output input of GPT. This is also used as the dimension of observation features.
          #gpt_output_dim: Size of output dimension of GPT. This is also used as a input dimension of offset / bin prediction headers.
          #gpt_n_layer: Number of layers of GPT
          #gpt_n_head: Number of headers of GPT
          #gpt_hidden_dim: Size of hidden dimensions of GPT
          #dropout: Dropout rate for GPT
          #mlp_hidden_dim: Size of hidden dimensions of offset header / bin prediction headers parts of VQ-BeT
          #offset_loss_weight:  A constant that is multiplied to the offset loss
          #primary_code_loss_weight: A constant that is multiplied to the primary code prediction loss
          #secondary_code_loss_weight: A constant that is multiplied to the secondary code prediction loss
          #bet_softmax_temperature: Sampling temperature of code for rollout with VQ-BeT
          #sequentially_select: Whether select code of primary / secondary as sequentially (pick primary code,
              #and then select secodnary code), or at the same time.
      #
#
  #--control.policy.n_obs_steps int
  #--control.policy.normalization_mapping Dict
  #--control.policy.input_features Dict
  #--control.policy.output_features Dict
  #--control.policy.device [str]
                        #cuda | cpu | mp (default: None)
  #--control.policy.use_amp bool
                        #`use_amp` determines whether to use Automatic Mixed
                        #Precision (AMP) for training and evaluation. With AMP,
                        #automatic gradient scaling is used. (default: False)
  #--control.policy.n_action_pred_token int
  #--control.policy.action_chunk_size int
  #--control.policy.vision_backbone str
  #--control.policy.crop_shape [int int]
  #--control.policy.crop_is_random bool
  #--control.policy.pretrained_backbone_weights [str]
  #--control.policy.use_group_norm bool
  #--control.policy.spatial_softmax_num_keypoints int
  #--control.policy.n_vqvae_training_steps int
  #--control.policy.vqvae_n_embed int
  #--control.policy.vqvae_embedding_dim int
  #--control.policy.vqvae_enc_hidden_dim int
  #--control.policy.gpt_block_size int
  #--control.policy.gpt_input_dim int
  #--control.policy.gpt_output_dim int
  #--control.policy.gpt_n_layer int
  #--control.policy.gpt_n_head int
  #--control.policy.gpt_hidden_dim int
  #--control.policy.dropout float
  #--control.policy.mlp_hidden_dim int
  #--control.policy.offset_loss_weight float
  #--control.policy.primary_code_loss_weight float
  #--control.policy.secondary_code_loss_weight float
  #--control.policy.bet_softmax_temperature float
  #--control.policy.sequentially_select bool
  #--control.policy.optimizer_lr float
                        #Training presets (default: 0.0001)
  #--control.policy.optimizer_betas Any
  #--control.policy.optimizer_eps float
  #--control.policy.optimizer_weight_decay float
  #--control.policy.optimizer_vqvae_lr float
  #--control.policy.optimizer_vqvae_weight_decay float
  #--control.policy.scheduler_warmup_steps int
#
#PI0FASTConfig ['control.policy']:
#
  #--control.policy.n_obs_steps int
                        #Input / output structure. (default: 1)
  #--control.policy.normalization_mapping Dict
  #--control.policy.input_features Dict
  #--control.policy.output_features Dict
  #--control.policy.device [str]
                        #cuda | cpu | mp (default: None)
  #--control.policy.use_amp bool
                        #`use_amp` determines whether to use Automatic Mixed
                        #Precision (AMP) for training and evaluation. With AMP,
                        #automatic gradient scaling is used. (default: False)
  #--control.policy.chunk_size int
  #--control.policy.n_action_steps int
  #--control.policy.max_state_dim int
                        #32 (default: 32)
  #--control.policy.max_action_dim int
                        #32 (default: 32)
  #--control.policy.resize_imgs_with_padding int int
                        #Image preprocessing (default: (224, 224))
  #--control.policy.interpolate_like_pi bool
  #--control.policy.empty_cameras int
                        #Add empty images. Used by pi0_aloha_sim which adds the
                        #empty left and right wrist cameras in addition to the
                        #top camera. (default: 0)
  #--control.policy.adapt_to_pi_aloha bool
                        #Converts the joint and gripper values from the
                        #standard Aloha space to the space used by the pi
                        #internal runtime which was used to train the base
                        #model. (default: False)
  #--control.policy.use_delta_joint_actions_aloha bool
                        #Converts joint dimensions to deltas with respect to
                        #the current state before passing to the model. Gripper
                        #dimensions will remain in absolute values. (default:
                        #False)
  #--control.policy.tokenizer_max_length int
                        #Tokenizer (default: 48)
  #--control.policy.proj_width int
                        #Projector (default: 1024)
  #--control.policy.max_decoding_steps int
                        #Decoding (default: 256)
  #--control.policy.fast_skip_tokens int
                        #Skip last 128 tokens in PaliGemma vocab since they are
                        #special tokens (default: 128)
  #--control.policy.max_input_seq_len int
                        #512 (default: 256)
  #--control.policy.use_cache bool
                        #Utils (default: True)
  #--control.policy.freeze_vision_encoder bool
                        #Frozen parameters (default: True)
  #--control.policy.freeze_lm_head bool
  #--control.policy.optimizer_lr float
                        #Training presets (default: 0.0001)
  #--control.policy.optimizer_betas float float
  #--control.policy.optimizer_eps float
  #--control.policy.optimizer_weight_decay float
  #--control.policy.scheduler_warmup_steps int
  #--control.policy.scheduler_decay_steps int
  #--control.policy.scheduler_decay_lr float
  #--control.policy.checkpoint_path str
  #--control.policy.padding_side str
  #--control.policy.precision str
  #--control.policy.grad_clip_norm float
  #--control.policy.relaxed_action_decoding bool
                        #Allows padding/truncation of generated action tokens
                        #during detokenization to ensure decoding. In the
                        #original version, tensors of 0s were generated if
                        #shapes didn't match for stable decoding. (default:
                        #True)
#
#ReplayControlConfig ['control']:
#
  #--control.repo_id str
                        #Dataset identifier. By convention it should match
                        #'{hf_username}/{dataset_name}' (e.g. `lerobot/test`).
                        #(default: None)
  #--control.episode int
                        #Index of the episode to replay. (default: None)
  #--control.root [str|Path]
                        #Root directory where the dataset will be stored (e.g.
                        #'dataset/path'). (default: None)
  #--control.fps [int]   Limit the frames per second. By default, uses the
                        #dataset fps. (default: None)
  #--control.play_sounds bool
                        #Use vocal synthesis to read events. (default: True)
#
#RemoteRobotConfig ['control']:
#
  #--control.log_interval int
  #--control.display_data bool
                        #Display all cameras on screen (default: False)
  #--control.viewer_ip [str]
                        #Rerun configuration for remote robot (https://ref.reru
                        #n.io/docs/python/0.22.1/common/initialization_function
                        #s/#rerun.connect_tcp) (default: None)
  #--control.viewer_port [str]
