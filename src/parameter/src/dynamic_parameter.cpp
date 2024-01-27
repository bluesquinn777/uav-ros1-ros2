#include "ros/ros.h"

// server.h 由调用的 dynamic_reconfigure 功能包生成.
#include <dynamic_reconfigure/server.h>
// TutorialsConfig.h 由之前 .cfg 文件生成.
#include <parameter/TutorialsConfig.h>

// 回调函数输入的参数有两个, 其中, config 为新的参数配置, level 为修改参数的掩码.
// 在回调函数中将新配置的参数在终端输出
void Callback(parameter::TutorialsConfig &config, uint32_t level)
{
    ROS_INFO("Reconfigure request: %d %f %s %s %d",
             config.int_param,
             config.double_param,
             config.str_param.c_str(),
             config.bool_param ? "True" : "False",
             config.size);
}

int main(int argc, char **argv)
{
    // 初始化一个名为"dynamic_parameter"的节点, 并创建一个参数动态配置的服务端,
    // 参数配置的类型为之前配置文件中定义的类型. 该服务端会实时监听客户端的参数配置请求.
    ros::init(argc, argv, "dynamic_parameter");
    dynamic_reconfigure::Server<parameter::TutorialsConfig> server;

    // 定义一个回调函数 f, 将回调函数与服务端相绑定, 当客户端请求修改参数时,
    // 服务端将自动跳到回调函数中并进行处理.
    dynamic_reconfigure::Server<parameter::TutorialsConfig>::CallbackType f;
    f = boost::bind(&Callback, _1, _2);
    server.setCallback(f);

    ROS_INFO("Spinning node");
    ros::spin();
    return 0;
}