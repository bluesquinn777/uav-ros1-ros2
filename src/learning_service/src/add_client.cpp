#include <ros/ros.h>
#include <learning_service/Add.h>
#include <cstdlib>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "add_client");

    // 判断在客户端输入的string型参数的数量是否为3个, 因为argc为封装的参数个数+1,
    // 所以为了限定输入参数为2, 我们将其限定值为3, 如果其值不为3, 系统会自动报错.
    if (argc != 3)
    {
        ROS_ERROR("usage: add two number X Y");
        return 1;
    }

    // 等待服务端创建的服务对象, 为之后的客户端发送服务请求做准备.
    // 只有寻找到对应的服务时, 客户端才会发送对应的服务请求.
    ros::service::waitForService("add_service");

    ros::NodeHandle nh;
    // 通过句柄nh, 将服务类型定义为我们自定义的learning_service::Add型, 将其连接到服务add_service.
    ros::ServiceClient add_client = nh.serviceClient<learning_service::Add>("add_service");

    // 初始化自定义服务中request内容, 其数据源于数组argv中封装的内容, 但因为初始化中的输入参数为string型变量,
    // 与我们在srv中定义的float64型的变量不一致, 所以需要先将其类型做转换后再对srv中的request变量进行赋值.
    // 其中atof()函数用于将string型变量转换为我们需要的float型变量, argv[1]中存放的输入的第一个参数,
    // argv[2]存放的是输入的第二个参数.
    learning_service::Add srv;
    srv.request.a = atof(argv[1]);
    srv.request.b = atof(argv[2]);

    // 调用与客户端相连接的服务, 并判断调用是否成功, 如果成功则在终端中显示服务调用的response, 如果调用失败同样
    // 在终端中发出调用失败的警告, 其中, add_client.call(srv)如果执行成功会返回数值1, 可以用于判断调用成功与否.
    if (add_client.call(srv))
    {
        ROS_INFO("sum is: %0.2f", srv.response.sum);
    }
    else
    {
        ROS_ERROR("Failed to call service add_service");
        return 1;
    }
    return 0;
}