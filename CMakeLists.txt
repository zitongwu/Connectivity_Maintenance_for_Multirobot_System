## For full information http://wiki.ros.org/catkin/CMakeLists.txt 

#############################################################################
## Set minimum required version of cmake, project name and compile options ##
#############################################################################
cmake_minimum_required(VERSION 2.8.3)
project(connectivity)

###########################################################################
## Find catkin packages and libraries for catkin and system dependencies ##
###########################################################################
find_package(catkin REQUIRED COMPONENTS
  rospy
  geometry_msgs
  nav_msgs
  std_msgs
  tf
  actionlib
)

##########################################
## Setup for python modules and scripts ##
##########################################

################################################
## Declare ROS messages, services and actions ##
################################################
# No new message declared.
add_action_files(
  DIRECTORY action
  FILES
  Task.action
)

add_service_files(
  DIRECTORY srv
  FILES
  Registration.srv
)


generate_messages(
  DEPENDENCIES 
  nav_msgs
  actionlib_msgs
)


################################################
## Declare ROS dynamic reconfigure parameters ##
################################################
# No new parameters declared.

###################################
## catkin specific configuration ##
###################################
catkin_package(
  CATKIN_DEPENDS
  rospy
  geometry_msgs
  nav_msgs
  std_msgs
  tf
  actionlib_msgs
)

###########
## Build ##
###########
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

catkin_install_python(PROGRAMS 
  nodes/follower
  nodes/leader
  nodes/broadcaster
  nodes/random_waypoints
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch
	DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

#############
## Testing ##
#############
# No unit test performed.
