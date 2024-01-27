#include <ros/ros.h>
#include <turtlesim/Spawn.h> // turtlesim/Spawn.h 为 Spawn.srv 编译后生成的头文件

int main(int argc, char **argv)
{
    ros::init(argc, argv, "turtle_spawn");
    ros::NodeHandle nh;

    // 搜寻和等待 /spawn 服务, 该函数只有当搜寻到了 /spawn 服务才会执行结束,
    // 如果没有搜寻到指定服务, 系统则会一直等待.
    ros::service::waitForService("/spawn");
    // 定义客户端的实例, 这里用句柄 nh 定义了一个名为 spawn_turtle 的客户端, 其服务类型为 turtlesim::Spawn,
    // 将该客户端指向 /spawn 服务.
    ros::ServiceClient spawn_turtle = nh.serviceClient<turtlesim::Spawn>("/spawn");

    // 初始化服务信息, 定义了一个名为 srv 的服务信息, 其服务类型为 turtlesim::Spawn,
    // 将其x轴和y轴坐标都赋值为1, 角度为90度.
    turtlesim::Spawn srv;
    srv.request.x = 1.0;
    srv.request.y = 1.0;
    srv.request.theta = 3.1415;

    ROS_INFO("Call service to spawn turtle [x: %0.6f, y: %0.6f, theta: %0.6f]",
             srv.request.x, srv.request.y, srv.request.theta);
    // 该代码用于客户端向 /spawn 服务中发送要求 srv, /spawn 服务接收到该要求后会按照 srv 中规定的格式去执行,
    // 本节中的服务端为海龟仿真器, 服务会在海龟仿真器中执行要求. 执行成功会反馈一个 response.
    spawn_turtle.call(srv);
    ROS_INFO("Spawn turtle successfully, new turtle name: %s", srv.response.name.c_str());

    return 0;
}