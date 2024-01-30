#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/CameraInfo.h>

using namespace sensor_msgs;
using namespace message_filters;

/**
 * @brief 多消息回调函数, 可以在回调函数内写入需要执行的回调操作.
 *
 * @param image
 * @param cam_info
 */
void callback(const ImageConstPtr &image, const CameraInfoConstPtr &cam_info)
{
    // 根据需要去添加Subscriber并充实多消息回调函数中的内容.
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "vision_node");
    ros::NodeHandle nh;

    // 用message_filters::Subscriber来订阅所需的话题消息, 与Subscriber的使用类似, 其中< >中定义了
    // 订阅话题的消息结构, 订阅的话题名为image和camera_info, 设置队列长度为1.
    message_filters::Subscriber<Image> image_sub(nh, "image", 1);
    message_filters::Subscriber<CameraInfo> cam_sub(nh, "camera_info", 10);

    // 定义一个时间同步器, 将之前创建的Subscriber进行同步.
    TimeSynchronizer<Image, CameraInfo> sync(image_sub, cam_sub, 10);
    // 之前同步器注册的多消息回调函数.
    sync.registerCallback(boost::bind(&callback, _1, _2));
    ros::spin();
    return 0;
}