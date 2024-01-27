#include <ros/ros.h>
#include <geometry_msgs/Twist.h>

int count = 0;

/**
 * @brief 定义回调函数, 此处回调函数名应与建立订阅者时定义的回调函数名一致.
 *
 * @param msg 常指针, 指向 geometry_msgs::Twist 信息, 该信息存在于仿真器中, 因此 msg 中的内容
 * 与仿真器的内容保持一致.
 */
void velCallback(const geometry_msgs::Twist::ConstPtr &msg)
{
    ROS_INFO("Turtle vel: linear x: %0.6f, y: %0.6f, z: %0.6f angular x: %0.6f, y: %0.6f, z: %0.6f",
             msg->linear.x, msg->linear.y, msg->linear.z,
             msg->angular.x, msg->angular.y, msg->angular.z);
    ROS_INFO("Subscriber times are: [%d]", ++::count); // ::count 是全局变量的 count.
}

int main(int argc, char **argv)
{
    // 用于相关节点的初始化和句柄的创建.
    ros::init(argc, argv, "turtle1_vel_subscriber");
    ros::NodeHandle nh;

    // 生成一个名为 "turtle1_vel_sub" 的订阅者的实例, 并通过句柄调用API, 使用
    // nh.subscribe 函数对该订阅者指定 "/turtle1/cmd_vel" 话题, 并规定队列长
    // 度为1000, 调用的回调函数为 velCallback, 当话题中出现新的消息时, 该订阅者
    // 更新接收到的消息内容, 并自动通过中断的形式跳转到回调函数中.
    ros::Subscriber turtle1_vel_sub = nh.subscribe("/turtle1/cmd_vel",
                                                   1000, velCallback);

    // 循环等待, 使 main() 函数能够一直进行下去, 从而等待话题中消息的更新, 因此本
    // 部分代码除非操作者终止该进程, 否则理论上是不会运行到 return 语句的.
    ros::spin();
    return 0;
}