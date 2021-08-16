# !/bin/bash

rostopic pub -1 /robot_0/initialpose geometry_msgs/Pose2D  -- 0.0 0.0 0.0 
rostopic pub -1 /robot_1/initialpose geometry_msgs/Pose2D  -- -6.0 6.0 0.0
rostopic pub -1 /robot_2/initialpose geometry_msgs/Pose2D  -- 4.0 0.0 0.0
rostopic pub -1 /robot_3/initialpose geometry_msgs/Pose2D  -- 6.0 6.0 0.0
rostopic pub -1 /robot_4/initialpose geometry_msgs/Pose2D  -- -6.0 -2.0 0.0
rostopic pub -1 /robot_5/initialpose geometry_msgs/Pose2D  -- 0.0 -6.0 0.0
rostopic pub -1 /robot_6/initialpose geometry_msgs/Pose2D  -- 6.0 -4.0 0.0
rostopic pub -1 /robot_7/initialpose geometry_msgs/Pose2D  -- 0.0 8.0 0.0
rosrun connectivity terminals
