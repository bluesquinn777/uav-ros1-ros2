#include <iostream>
#include <ros/ros.h>
#include "std_msgs/Header.h"
#include "learning_synchronizer/Person.h"

using namespace std;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "publisher1");
    ros::NodeHandle nh;
    ros::Publisher pub1 = nh.advertise<learning_synchronizer::Person>("chatter1", 10);
    ros::Rate loop_rate(10);
    while (ros::ok())
    {
        learning_synchronizer::Person p;

        p.header.stamp = ros::Time::now();
        p.height = 0.2;
        p.age = 10;
        p.name = "Tom";

        pub1.publish(p);
        cout << "pub1's timestamp: " << p.header.stamp << endl;
        ROS_INFO("Publish message is [%0.2f, %d, %s]", p.height, p.age, p.name.c_str());
        loop_rate.sleep();
    }
    return 0;
}