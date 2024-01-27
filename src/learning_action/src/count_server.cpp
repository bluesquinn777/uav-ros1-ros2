#include "ros/ros.h"
#include "actionlib/server/simple_action_server.h"
#include "learning_action/CountAction.h"

typedef actionlib::SimpleActionServer<learning_action::CountAction> Server;

class CountActionServer
{
private:
    learning_action::CountFeedback feedback; // 记录和发送任务执行进度.
    learning_action::CountResult result;     // 记录和发送任务最新结果.
    Server server;                           // 生成动作服务端实例.

    /**
     * @brief 执行函数, 封装该动作服务段需要执行的任务.
     *
     * @param goal 常指针.
     */
    void executeCallback(const learning_action::CountGoalConstPtr &goal)
    {
        // 设置了技术时间并在动作服务端中显示接收到goal中的值.
        ros::Rate rate(1);
        ROS_INFO("Get the goal, the goal value is: %d", goal->goal_num);

        // 用于计数值和计数终值的初始化.
        int count_num = 0;
        int finish_num = 10;

        // 实现计数器, 其在动作服务端中主要实现以下功能: 实时显示当前的计数值, 计算出任务进度并发布到
        // feedback中, 并将最终的计数结果传递给finish.
        for (; count_num < finish_num; count_num++)
        {
            ROS_INFO("Counting the number: %d", count_num);
            // 计算当前计数进度, 因为percent_complete为浮点型, 所以需要对结果强制类型转换,
            // 转换结束后, 将得到的进度值发布到feedback话题中.
            feedback.percent_complete = (float)count_num / finish_num * 100;
            server.publishFeedback(feedback);
            rate.sleep();
            result.finish = count_num;
        }

        // 将当前动作服务端的状态转变为成功, 并传给参数result, 用于动作客户端的实时监控.
        if (server.isActive())
        {
            server.setSucceeded(result);
        }
    }

    /**
     * @brief 取消回调函数, 将当前动作服务端的状态转变为被抢占.
     *
     */
    void preemptCallback()
    {
        if (server.isActive())
        {
            server.setPreempted();
        }
    }

public:
    /**
     * @brief 构造函数, 初始化动作服务端实例server, 其中"count"为动作名, 与动作客户端通信;
     * executeCallback为服务的回调函数, 当动作服务端接收到一个新的goal之后, 会在一个独立的线程中
     * 调用该回调函数, 该回调函数为阻塞型, 注意, 如果这里添加了回调函数, 那么goalCallback()函数会变得不可用.
     *
     * @param nh 创建的句柄, 用于调用各类接口
     */
    CountActionServer(ros::NodeHandle nh) : server(nh,
                                                   "count",
                                                   boost::bind(&CountActionServer::executeCallback, this, _1),
                                                   false)
    {
        server.registerPreemptCallback(boost::bind(&CountActionServer::preemptCallback, this));
    }
    ~CountActionServer() {}

    /**
     * @brief 开始函数, 用于启动服务端, 执行该代码后会自动跳转到executeCallback()函数中.
     */
    void start() { server.start(); }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "count_server");
    ros::NodeHandle nh;
    CountActionServer countserver(nh);
    countserver.start();
    ros::spin();
    return 0;
}