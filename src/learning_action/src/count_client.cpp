#include "ros/ros.h"
#include "actionlib/client/simple_action_client.h"
// 自定义的.action文件的编译文件的include, 注意, 与之前自定话题和自定义服务不同,
// 编译后会自动在动作文件名称加上Action后缀以示区别.
#include "learning_action/CountAction.h"

// 为方便, 将其预先定义成Client.
typedef actionlib::SimpleActionClient<learning_action::CountAction> Client;

class CountActionClient
{
private:
    Client client; // 生成动作客户端实例.

    /**
     * @brief 在goal执行结束时输出服务端的最终状态和其执行结果.
     *
     * @param state 常指针, 包含了动作服务端目前的状态消息.
     * @param result 常指针, 在动作服务端中被赋值了目前计数的数量.
     */
    void doneCallback(const actionlib::SimpleClientGoalState &state,
                      const learning_action::CountResultConstPtr &result)
    {
        ROS_INFO("Finished in state %s", state.toString().c_str());
        ROS_INFO("Total counted number: %d", result->finish);
        ros::shutdown();
    }

    /**
     * @brief 当goal在动作服务端被接收成功之后, 在动作客户端显示出目前动作服务端的状态.
     *
     */
    void activeCallback()
    {
        ROS_INFO("Goal has been active");
    }

    /**
     * @brief 当动作服务端在执行对应任务时, 可以及时得到当前任务的执行进度.
     *
     * @param feedback 常指针.
     */
    void feedbackCallback(const learning_action::CountFeedbackConstPtr &feedback)
    {
        ROS_INFO("The progress is: %0.2f%s", feedback->percent_complete, "%");
    }

public:
    // 构造一个CountActionClient实例, 并定义其传入参数为client_name和flag. 其中, client_name是动作名称,
    // 需要与服务端的动作名称一致, 否则无法正常运行, flag是多线程的标志位, 当其为true时, 系统会自动调用一个
    // 线程来服务该动作的订阅者, 否则, 用户需要通过调用ros::spin()去启用, 该值默认为true.
    CountActionClient(const std::string client_name, bool flag = true) : client(client_name, flag) {}
    ~CountActionClient() {}

    /**
     * @brief 客户端的主要执行函数.
     *
     */
    void start()
    {
        client.waitForServer(); // 等待服务端, 为之后的动作通信做准备.

        // goal中内容的初始化, 先构造了learning_action::CountGoal类型的goal,
        // 并对其内部的goal_num赋值1, 用于表示执行goal的ID.
        learning_action::CountGoal goal;
        goal.goal_num = 1;

        // 向动作服务端发送goal, 同时注册回调函数. 注意, 如果在执行该语句时, 之前的goal已被启用, 该语句会使得
        // 动作客户端暂时搁置上一个goal, 而执行这一次的goal. 其中对应的回调函数只有动作服务端转变成对应的状态时
        // 才会进行一次回调, 例如, 当动作服务端状态转变成done时, 会回调一次doneCallback()函数, 但注意,
        // feedback 中的消息每刷新一次, 回调函数feedbackCallback()都会被调用一次.
        client.sendGoal(goal,
                        boost::bind(&CountActionClient::doneCallback, this, _1, _2),
                        boost::bind(&CountActionClient::activeCallback, this),
                        boost::bind(&CountActionClient::feedbackCallback, this, _1));
        client.waitForResult(ros::Duration(30.0)); // 等待服务端执行结束, 这里等待30秒.

        // 显示动作客户端执行之后的结果, 如果动作客户端执行成功, 即动作客户端的状态转变成SUCCEEDED,
        // 动作客户端会显示计数完成的消息, 反之则会发出取消请求, 并在动作客户端显示.
        if (client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
        {
            ROS_INFO("The number are counted");
        }
        else
        {
            ROS_INFO("Cancel the goal");
            client.cancelAllGoals();
        }
        ROS_INFO("Current State: %s\n", client.getState().toString().c_str());
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "count_client");
    ros::NodeHandle nh;
    // 构造该class的对象, 并传入所需参数, 其中动作名为count, 传入true表示调用多线程订阅.
    CountActionClient client("count", true);
    client.start();
    ros::spin();
    return 0;
}
