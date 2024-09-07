from lerobot.common.robot_devices.motors.dynamixel import DynamixelMotorsBus

leader_port = " /dev/tty.usbmodem578E0212911"
follower_port = "/dev/tty.usbmodem585A0085181"

leader_arms:
main:
    _target_: lerobot.common.robot_devices.motors.dynamixel.DynamixelMotorsBus
    port: leader_port
    motors:
    # name: (index, model)
    shoulder_pan: [1, "xl330-m077"]
    shoulder_lift: [2, "xl330-m077"]
    elbow_flex: [3, "xl330-m077"]
    wrist_flex: [4, "xl330-m077"]
    wrist_roll: [5, "xl330-m077"]
    gripper: [6, "xl330-m077"]
follower_arms:
main:
    _target_: lerobot.common.robot_devices.motors.dynamixel.DynamixelMotorsBus
    port: follower_port 
    motors:
    # name: (index, model)
    shoulder_pan: [1, "xl430-w250"]
    shoulder_lift: [2, "xl430-w250"]
    elbow_flex: [3, "xl330-m288"]
    wrist_flex: [4, "xl330-m288"]
    wrist_roll: [5, "xl330-m288"]
    gripper: [6, "xl330-m288"]