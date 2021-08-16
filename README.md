#### Author: Zitong Wu
#### Date: May 1, 2021

<br >

# Connectivity Maintenance for Multirobot Systems
This package computes intermediate locations necessary for maintaining connectivity for a given set of target locations and moves robots to those intermediate locations.

For the demonstration purpose, 1 leader and 7 followers are deployed. The robot with the lowest ID is the leader; the other 7 are followers. They coordinate in a leader-follower fashion. The leader does the computing and sends waypoints to the followers. All robots, including the leader, can be assigned waypoints. 

<br >

# License

<br >

# Nodes
* `leader`: 
   * initiates coordination
   * waits for terminal messages
   * computes all waypoints that require robots in place to ensure connectivity
   * assigns each waypoint to the closest robot so that the total distance traveled by all robots is minimized 
   * sends goals to corresponding robots
* `follower`: receives waypoints from the leader and moves to the waypoints
* `broadcaster`: sets a common reference frame for all robots. A static tf broadcaster that broadcasts the coordinate frame of each robot according to their initial poses. 
* `terminal`: generates random target locations and publishes them as a terminal messages. For the demonstration purpose, the number of random terminal
locations is set to 4.

<br >

# Instructions for running simulation in stageros (with Docker)
1. In the first terminal: 
   * run `docker-compose up --build`
2. In the second terminal:
   * run `docker-compose exec ros bash`, this will bring you to `catkin_ws`
   * run `catkin_make` to generate message files for ROS services and actions
   * run `roscore`
3. In the third terminal: 
   * run `docker-compose exec ros bash`, this will bring you to `catkin_ws` 
   * copy`emtpy.world` and `emptyfloor.bmp` from `connectivity/world` to `stage_ros/world`
   * run `rosrun stage_ros stageros connectivity/world/empty.world` to start a empty world and spawn the robots
4. In the fourth terminal: navigate to the `vnc-ros` directory,
   * run `docker-compose exec ros bash`, this will bring you to `catkin_ws` 
   * run `roslaunch connectivity connectivity.launch`
5. In the fourth terminal: navigate to the `vnc-ros` directory,
   * run `docker-compose exec ros bash`, this will bring you to `catkin_ws`
   * after the 4th terminal shows statements indicating that the leader and followers are initiated and are "waiting for terminals", run `./inputs.sh` to publish initial poses for all robots and publish 4 random terminals
   * after the 4th terminal shows "waiting for new terminals" again, run `rosrun connectivty terminals` to give new random terminals to the leader. 

<br >

# Demo
See `simulation_demo.mov` (An update about running the world file is included in step 3 of the Instructions Section)