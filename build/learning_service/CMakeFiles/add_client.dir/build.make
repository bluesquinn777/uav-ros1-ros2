# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/qq219/uav-ros1-ros2/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/qq219/uav-ros1-ros2/build

# Include any dependencies generated for this target.
include learning_service/CMakeFiles/add_client.dir/depend.make

# Include the progress variables for this target.
include learning_service/CMakeFiles/add_client.dir/progress.make

# Include the compile flags for this target's objects.
include learning_service/CMakeFiles/add_client.dir/flags.make

learning_service/CMakeFiles/add_client.dir/src/add_client.cpp.o: learning_service/CMakeFiles/add_client.dir/flags.make
learning_service/CMakeFiles/add_client.dir/src/add_client.cpp.o: /home/qq219/uav-ros1-ros2/src/learning_service/src/add_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qq219/uav-ros1-ros2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object learning_service/CMakeFiles/add_client.dir/src/add_client.cpp.o"
	cd /home/qq219/uav-ros1-ros2/build/learning_service && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/add_client.dir/src/add_client.cpp.o -c /home/qq219/uav-ros1-ros2/src/learning_service/src/add_client.cpp

learning_service/CMakeFiles/add_client.dir/src/add_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/add_client.dir/src/add_client.cpp.i"
	cd /home/qq219/uav-ros1-ros2/build/learning_service && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qq219/uav-ros1-ros2/src/learning_service/src/add_client.cpp > CMakeFiles/add_client.dir/src/add_client.cpp.i

learning_service/CMakeFiles/add_client.dir/src/add_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/add_client.dir/src/add_client.cpp.s"
	cd /home/qq219/uav-ros1-ros2/build/learning_service && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qq219/uav-ros1-ros2/src/learning_service/src/add_client.cpp -o CMakeFiles/add_client.dir/src/add_client.cpp.s

# Object files for target add_client
add_client_OBJECTS = \
"CMakeFiles/add_client.dir/src/add_client.cpp.o"

# External object files for target add_client
add_client_EXTERNAL_OBJECTS =

/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: learning_service/CMakeFiles/add_client.dir/src/add_client.cpp.o
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: learning_service/CMakeFiles/add_client.dir/build.make
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/libroscpp.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/librosconsole.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/librostime.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /opt/ros/noetic/lib/libcpp_common.so
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client: learning_service/CMakeFiles/add_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qq219/uav-ros1-ros2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client"
	cd /home/qq219/uav-ros1-ros2/build/learning_service && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/add_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
learning_service/CMakeFiles/add_client.dir/build: /home/qq219/uav-ros1-ros2/devel/lib/learning_service/add_client

.PHONY : learning_service/CMakeFiles/add_client.dir/build

learning_service/CMakeFiles/add_client.dir/clean:
	cd /home/qq219/uav-ros1-ros2/build/learning_service && $(CMAKE_COMMAND) -P CMakeFiles/add_client.dir/cmake_clean.cmake
.PHONY : learning_service/CMakeFiles/add_client.dir/clean

learning_service/CMakeFiles/add_client.dir/depend:
	cd /home/qq219/uav-ros1-ros2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qq219/uav-ros1-ros2/src /home/qq219/uav-ros1-ros2/src/learning_service /home/qq219/uav-ros1-ros2/build /home/qq219/uav-ros1-ros2/build/learning_service /home/qq219/uav-ros1-ros2/build/learning_service/CMakeFiles/add_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : learning_service/CMakeFiles/add_client.dir/depend

