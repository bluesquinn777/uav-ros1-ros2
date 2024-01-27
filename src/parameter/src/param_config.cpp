#include <string>     // 为了在成程序中识别string型的成员变量.
#include <ros/ros.h>  // 与ROS相关的操作, 比如对param的操作.

int main(int argc, char** argv)
{
    // 申明3个int型变量, 来存放参数里面的具体值.
    int red, green, blue;
    // ROS节点初始化, 实质上是向节点管理器注册一个名为"param_config"的节点.
    ros::init(argc, argv, "param_config");
    // 创建节点句柄.
    ros::NodeHandle nh;

    /* 读取背景颜色参数. ROS提供两种API来访问参数值: ros::param 和 ros::NodeHandle */
    // 使用 ros::param 访问参数, 将访问获得的 /turtlesim/background_r 参数值写入到 red
    // 这一int型变量中, 该函数如果执行成功会返回1, 并将其赋值给bool型变量 ifget1 来判断是
    // 成功读取到参数值.
    bool ifget1 = ros::param::get("/turtlesim/background_r", red);
    // 用 ros::NodeHandle 来访问系统的参数, 与上一语句相同, 通过句柄 nh 获得参数值
    // 并赋值给变量, 判断是否执行成功.
    bool ifget2 = nh.getParam("/turtlesim/background_g", green);
    // 同样使用 ros::NodeHandle 来访问系统的参数, 但不同的是, 如果该语句没有找到对应的
    // 参数, 会将一个提前确定的默认值写入变量, 本语句的默认值为100. 所以如果系统没有找到
    // 对应参数时, 会将 100 赋值给 blue.
    bool ifget3 = nh.param("/turtlesim/background_b", blue, 100);

    // 判断3个参数是否都访问成功, 只有3个bool型变量都为1时if语句才会成立, 系统会在终端输出
    // 访问到的参数值, 而只要有一个bool型变量为0时, 系统会在终端发出警告.
    if(ifget1 && ifget2 && ifget3) {
        ROS_INFO("Get background color [%d %d %d]", red, green, blue);
    }
    else { ROS_WARN("Didn't retrieve all param successfully"); }

    // 手动设置RGB的值到255.
    ros::param::set("/turtlesim/background_r", 255);
    ros::param::set("/turtlesim/background_g", 255);
    nh.setParam("/turtlesim/background_b", 255);
    ROS_INFO("Set background color [255 255 255]");

    // 读取之前设置的参数值, 并将其输出至终端.
    if(ros::param::get("/turtlesim/background_r", red)) {
        ROS_INFO("background_r = %d", red);
    }
    else { ROS_WARN("Didn't get param successfully"); }
    if(ros::param::get("/turtlesim/background_g", green)) {
        ROS_INFO("background_g = %d", green);
    }
    else { ROS_WARN("Didn't get param successfully"); }
    if(ros::param::get("/turtlesim/background_b", blue)) {
        ROS_INFO("background_b = %d", blue);
    }
    else { ROS_WARN("Didn't get param successfully"); }

    /* 删除系统中的参数, 并判断是否删除成功. */
    // 用 ros::NodeHandle 访问参数, 以删除指定的参数. 当该函数执行成功时会反馈数值1,
    // 并将其赋值给bool型变量 ifdeleted1, 用于判断是否删除成功.
    bool ifdeleted1 = nh.deleteParam("/turtlesim/background_r");
    // 用 ros::param 访问参数, 与上一语句作用相同.
    bool ifdeleted2 = ros::param::del("/turtlesim/background_b");
    if(ifdeleted1) { ROS_INFO("/turtlesim/background_r deleted"); }
    else { ROS_INFO("/turtlesim/background_r not deleted"); }
    if(ifdeleted2) { ROS_INFO("/turtlesim/background_b deleted"); }
    else { ROS_INFO("/turtlesim/background_b not deleted"); }

    /* 用于判断指定参数是否存在并在终端中输出结果 */
    // 用 ros::NodeHandle 访问参数, 来核查指定的参数, 当该语句执行成功后会反馈数值1并将
    // 其赋值到变量 ifparam1, 用于之后在终端中输出结果.
    bool ifparam1 = nh.hasParam("/turtlesim/background_r");
    // 用 ros::parma 访问参数, 与上一语句作用相同.
    bool ifparam2 = ros::param::has("/turtlesim/background_b");
    if(ifparam1) { ROS_INFO("/turtlesim/background_r exists"); }
    else { ROS_INFO("/turtlesim/background_r doesn't exist"); }
    if(ifparam2) { ROS_INFO("/turtlesim/background_b exists"); }
    else { ROS_INFO("/turtlesim/background_b doesn't exists"); }

    sleep(1);
    return 0;
}