#ifndef PLUGINLIB_LEARNING__POLYGON_BASE_H_
#define PLUGINLIB_LEARNING__POLYGON_BASE_H_

namespace polygon_base
{
    class RegularPolygon
    {
    protected:
        RegularPolygon() {}

    public:
        virtual void initialize(double side_length) = 0;
        virtual double area() = 0;
        virtual ~RegularPolygon() {}
    };
};

#endif