#include <ros/ros.h>
#include <learning_service/Add.h>

/**
 * @brief 服务端连接的回调函数
 *
 * @param req learning_service::Add::Request类型的常指针输入, 对应.srv文件的request.
 * @param res earning_service::Add::Response类型的常指针输出, 对应.srv文件的response.
 * @return true 表示回调函数执行成功.
 * @return false
 */
bool addCallback(learning_service::Add::Request &req, learning_service::Add::Response &res)
{
    res.sum = req.a + req.b;
    ROS_INFO("request: x=%0.2f, y=%0.2f", req.a, req.b);
    ROS_INFO("The result is: %0.2f", res.sum);
    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "add_server");
    ros::NodeHandle nh;
    ros::ServiceServer add_service = nh.advertiseService("add_service", addCallback);
    ROS_INFO("Ready to add two number.");
    ros::spin();
    return 0;
}