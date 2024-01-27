#include <pluginlib/class_loader.h>
#include <learning_plugin/polygon_base.h>

int main(int argc, char **argv)
{
    pluginlib::ClassLoader<polygon_base::RegularPolygon> poly_loader(
        "learning_plugin", "polygon_base::RegularPolygon");
    try
    {
        // Plugin可以在程序中动态加载, 当其加载成功之后就可以调用其plugin接口来实现响应功能.
        // 加载Triangle plugin并将其边长初始化为10.
        boost::shared_ptr<polygon_base::RegularPolygon> triangle = poly_loader.createInstance(
            "polygon_plugins::Triangle");
        triangle->initialize(10.0);
        // 加载Square plugin并将其边长初始化为10.
        boost::shared_ptr<polygon_base::RegularPolygon> square = poly_loader.createInstance(
            "polygon_plugins::Square");
        square->initialize(10.0);

        ROS_INFO("Triangle area: %.2f", triangle->area());
        ROS_INFO("Square area: %.2f", square->area());
    }
    catch (pluginlib::PluginlibException &e)
    {
        ROS_ERROR("The plugin failed to load for some reason. Error: %s", e.what());
    }
    return 0;
}