#include <ros/ros.h>
#include "learning_topic/Student.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "student_publisher");
    ros::NodeHandle nh;

    // 创建发布者和设置发送频率, 通过 nh 句柄将其指定到 /student_info 话题, 定义队列长度为1000, 消息格式为自定
    // 的 learning_topic::Student, 如果执行该进程之前不存在 /student_info 话题, 则系统会自动生成该话题.
    ros::Publisher student_info_pub = nh.advertise<learning_topic::Student>("/student_info", 1000);
    ros::Rate loop_rate(1);
    int count = 0;
    while (ros::ok())
    {
        // 生成消息实体并对该消息实体中的内容进行初始化. 定义了名为 student_msg 的消息实体.
        learning_topic::Student student_msg;
        student_msg.name = "Xiaoming";
        student_msg.age = 18;
        student_msg.sex = learning_topic::Student::male;
        student_msg.height = 178;
        student_msg.weight = 135;
        // 将初始化完的消息发送到指定话题中.
        student_info_pub.publish(student_msg);

        ROS_INFO("Publish Student info: name: %s, age: %d, sex: %d, height: %d, weight: %d",
                 student_msg.name.c_str(), student_msg.age, student_msg.sex,
                 student_msg.height, student_msg.weight);
        ROS_INFO("Publish times are: [%d]", ++count);
        loop_rate.sleep();
    }

    return 0;
}