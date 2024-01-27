#include <cstddef>
#include <ros/ros.h>
#include <geometry_msgs/Twist.h> // 包含向话题发布的速度消息的头文件

int main(int argc, char **argv)
{
    // ROS 从编程角度来理解是一个包含了 class 的命名空间, ros::init 为节点初始化,
    // 该过程包含了输出的参数和一些节点的名字, 但要注意 ROS 中 的节点名不可以重复定义.
    ros::init(argc, argv, "turtle1_vel_publisher");
    // 创造句柄, 用于管理各种 API 资源, 比如后面的 nh.advertise 函数就是通过此处创造
    // 的句柄来调用实现的.
    ros::NodeHandle nh;

    // ros::Publisher 用于创造一个发布者实例, nh.advertise 则于对该发布者进行初始化,
    // 其中包括了其要发送话题的对象, 消息结构和队列长度等, 即该发布者向 /turtle1/cmd_vel
    // 话题发布消息, 话题消息必须和订阅者订阅的话题一致, 否则该消息会发送错误, 或者发送到
    // 其他订阅者中. 发布的消息结构为 geometry_msgs::Twist, 设置队列长度为 1000,
    // 用于存放尚未发出去的消息, 当堆积的消息个数大于设置的队列长度时, 系统会自动剔除旧的数据,
    // 存入新的数据. 当发布消息的速度大于底层传输消息的速度和订阅者接受的速度时, 系统会自动
    // 产生消息的堆积, 队列长度的设置与发布的频率和底层传输速率有关.
    ros::Publisher turtle1_vel_pub = nh.advertise<geometry_msgs::Twist>(
        "/turtle1/cmd_vel", 1000);
    // ros::Rate 设置循环的频率, 这里是 10 Hz 的频率.
    ros::Rate loop_rate(10);

    // 设置一个计数器和 while 循环, 其中计数器用于计数发布了多少次消息, 而 while 循环
    // 则用于实现持续发布消息, 其中的 ros::ok() 判断操作者是否手动终止了该进程.
    int count = 0;
    while (ros::ok())
    {
        // 初始化发送到节点的消息, 这里我们创建了一个名为"vel_msg"的消息, 将x方向的线速度
        // 和z方向的角速度设为1, 从而实现海龟的绕圈运动.
        geometry_msgs::Twist vel_msg;
        vel_msg.linear.x = 1.0;
        vel_msg.angular.z = 1.0;

        // 向指定话题发送我们定义好的消息, 在终端输出我们向话题发布的消息以及发布的次数,
        // 并延迟之前设定的时间.
        turtle1_vel_pub.publish(vel_msg);
        ROS_INFO("Publish turtle1 velocity message is: [%0.2f m/s, %0.2f rad/s]",
                 vel_msg.linear.x, vel_msg.angular.z);
        ROS_INFO("Publish times are: [%d]", ++count);
        loop_rate.sleep(); // 系统延迟对应时间以实现设定的发送频率.
    }
    return 0;
}