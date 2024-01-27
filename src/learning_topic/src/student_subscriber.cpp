#include <ros/ros.h>
#include "learning_topic/Student.h"

int count = 0;

/**
 * @brief 定义回调函数, 当订阅者接收到话题中更新的消息后, 系统会自动地以中断的形式跳转到该函数中.
 *
 * @param msg 指向消息的常指针, 用于消息内容的输出.
 */
void studentInfoCallback(const learning_topic::Student::ConstPtr &msg)
{
    ROS_INFO("Subscribe Student info: name: %s, age: %d, sex: %d, height: %d, weight: %d",
             msg->name.c_str(), msg->age, msg->sex, msg->height, msg->weight);
    ROS_INFO("Publish times are: [%d]", ++count);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "student_subscriber");
    ros::NodeHandle nh;

    // 创建订阅者, 并通过 nh 句柄 将其指定到 /student_info 话题和回调函数 studentInfoCallback, 定义队列
    // 长度为1000, 消息格式为自定义的 learning_topic::Student, 只有当订阅者和发布者指定的话题一致时, 节点
    // 之间才可以达成通信.
    ros::Subscriber student_info_sub = nh.subscribe("/student_info", 1000, studentInfoCallback);
    ros::spin();
    return 0;
}