#include <ros/ros.h>
#include <geometry_msgs/Twist.h> // 用于Publisher的构造与速度消息的发送.
#include <std_srvs/Trigger.h>    // 用于服务中回调函数的参数输出, 用于显示服务状态.

// 该变量为决定海龟速度消息发布与否的flag, 当其为true时,
// Publisher才会向仿真器发布海龟的速度消息, 反之则停止向仿真器发布消息.
bool pubflag = false;

/**
 * @brief 定义回调函数, 该函数存在输出和输入两个端口.
 *
 * @param req 输入参数为std_srvs::Trigger::Request型的常指针, 但我们在之前定义该.srv文件时发现该服务
 * 并不存在request, 所以该输入参数为空.
 * @param res 输出参数为std_srvs::Trigger::Response型的常指针, 该.srv文件中response存在两个量, 分别
 * 是表示调用成功的bool变量success和反馈信息的string型变量message, 因此应该在回调函数中对这两个变量进行
 * 相应的赋值和操作.
 * @return true 修改pubflag成功.
 * @return false
 */
bool commandCallback(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res)
{
    pubflag = !pubflag; // 对flag取反, 每次调用都会取反, 从而控制Publisher的发布与否.
    ROS_INFO("Publish turtle velocity command: %s", pubflag == true ? "Yes" : "No");
    // 对.srv文件中的response的内容赋值.
    res.success = true;
    res.message = "Change turtle pubflag value successfully";
    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "turtle_vel_cmd");
    ros::NodeHandle nh;

    // 生成一个名为"cmd_srv"的服务端实例, 并通过句柄nh将其连接到回调函数commandCallback,
    // 并生成一个名为"/turtle_cmd"的服务用于访问回调函数.
    ros::ServiceServer cmd_srv = nh.advertiseService("/turtle_cmd", commandCallback);
    ros::Publisher turtle_vel_pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000);
    ROS_INFO("Ready to receive turtle velocity command.");

    // 初始化Publisher将要发布的消息.
    geometry_msgs::Twist vel_msg;
    vel_msg.linear.x = 1.0;
    vel_msg.angular.z = 1.0;

    ros::Rate loop_rate(10);
    while (ros::ok()) // 循环查询与发布者功能的执行
    {
        // 非阻塞型的查询, 即该语句只会查询一次服务中是否需要执行回调函数, 而不会循环查询, 进而使得程序阻塞在这里.
        ros::spinOnce();
        // 让Publisher向指定话题发布自定义的消息, 其中是否发布消息取决于pubflag, 服务每调用一次,
        // 在回调函数中该bool型变量就会在0和1之间翻转.
        if (pubflag)
        {
            turtle_vel_pub.publish(vel_msg);
        }
        loop_rate.sleep();
    }
    return 0;
}