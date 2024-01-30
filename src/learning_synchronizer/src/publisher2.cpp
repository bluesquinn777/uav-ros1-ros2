#include <iostream>
#include <ros/ros.h>
#include "std_msgs/Header.h"
#include "learning_synchronizer/Person.h"

using namespace std;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "publisher2");
    ros::NodeHandle nh;
    ros::Publisher pub2 = nh.advertise<learning_synchronizer::Person>("chatter2", 10);
    ros::Rate loop_rate(20);
    while (ros::ok())
    {
        learning_synchronizer::Person p;

        p.header.stamp = ros::Time::now();
        p.height = 0.2;
        p.age = 10;
        p.name = "Tom";

        pub2.publish(p);

        cout << "pub2's timestamp: " << p.header.stamp << endl;
        ROS_INFO("Publish message is [%0.2f, %d, %s]", p.height, p.age, p.name.c_str());
        loop_rate.sleep();
    }
    return 0;
}