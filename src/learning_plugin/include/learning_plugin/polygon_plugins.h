#ifndef PLUGINLIB_LEARNING__POLYGON_PLUGINS_H_
#define PLUGINLIB_LEARNING__POLYGON_PLUGINS_H_

#include <learning_plugin/polygon_base.h>
#include <cmath>
#define PI acos(-1)

namespace polygon_plugins
{
    class Triangle : public polygon_base::RegularPolygon
    {
    private:
        double side_length_;

    public:
        Triangle() {}
        void initialize(double side_length) { side_length_ = side_length; }
        double area() { return (3 * side_length_ * side_length_) / (4 * tan(PI / 3)); }
    };

    class Square : public polygon_base::RegularPolygon
    {
    private:
        double side_length_;

    public:
        Square() {}
        void initialize(double side_length) { side_length_ = side_length; }
        double area() { return (4 * side_length_ * side_length_) / (4 * tan(PI / 4)); }
    };
}

#endif