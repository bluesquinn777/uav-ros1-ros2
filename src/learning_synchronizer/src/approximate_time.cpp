#include <iostream>
#include <ros/ros.h>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/sync_policies/exact_time.h>
#include "learning_synchronizer/Person.h"

using namespace std;
using namespace message_filters;

learning_synchronizer::Person syn_pub1;
learning_synchronizer::Person syn_pub2;

void synCallback(const learning_synchronizer::PersonConstPtr &pub1,
                 const learning_synchronizer::PersonConstPtr &pub2)
{
    ROS_INFO("\033[1;32M Syn! \033[0m");
    syn_pub1 = *pub1;
    syn_pub2 = *pub2;
    cout << "pub1's timestamp: " << syn_pub1.header.stamp << endl;
    cout << "pub2's timestamp: " << syn_pub2.header.stamp << endl;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "approximate_time");
    ros::NodeHandle nh;
    ROS_INFO("\033[1;31m hw! \033[0m");
    // 建立需要订阅的消息对应的Subscriber
    message_filters::Subscriber<learning_synchronizer::Person> pub1_sub(nh, "chatter1", 1);
    message_filters::Subscriber<learning_synchronizer::Person> pub2_sub(nh, "chatter2", 1);
    typedef sync_policies::ApproximateTime<learning_synchronizer::Person, learning_synchronizer::Person> MySyncPolicy;
    Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), pub1_sub, pub2_sub); // queue size = 10
    sync.registerCallback(boost::bind(&synCallback, _1, _2));
    ros::spin();
    return 0;
}