#include <pluginlib/class_list_macros.h>
#include <learning_plugin/polygon_base.h>
#include <learning_plugin/polygon_plugins.h>

// 注册继承类插件, 使用格式为 PLUGINLIB_EXPORT_CLASS(继承类空间名::继承类名, 基类空间名::基类名)
PLUGINLIB_EXPORT_CLASS(polygon_plugins::Triangle, polygon_base::RegularPolygon)
PLUGINLIB_EXPORT_CLASS(polygon_plugins::Square, polygon_base::RegularPolygon)