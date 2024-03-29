// Generated by gencpp from file learning_service/AddRequest.msg
// DO NOT EDIT!


#ifndef LEARNING_SERVICE_MESSAGE_ADDREQUEST_H
#define LEARNING_SERVICE_MESSAGE_ADDREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace learning_service
{
template <class ContainerAllocator>
struct AddRequest_
{
  typedef AddRequest_<ContainerAllocator> Type;

  AddRequest_()
    : a(0.0)
    , b(0.0)  {
    }
  AddRequest_(const ContainerAllocator& _alloc)
    : a(0.0)
    , b(0.0)  {
  (void)_alloc;
    }



   typedef double _a_type;
  _a_type a;

   typedef double _b_type;
  _b_type b;





  typedef boost::shared_ptr< ::learning_service::AddRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::learning_service::AddRequest_<ContainerAllocator> const> ConstPtr;

}; // struct AddRequest_

typedef ::learning_service::AddRequest_<std::allocator<void> > AddRequest;

typedef boost::shared_ptr< ::learning_service::AddRequest > AddRequestPtr;
typedef boost::shared_ptr< ::learning_service::AddRequest const> AddRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::learning_service::AddRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::learning_service::AddRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::learning_service::AddRequest_<ContainerAllocator1> & lhs, const ::learning_service::AddRequest_<ContainerAllocator2> & rhs)
{
  return lhs.a == rhs.a &&
    lhs.b == rhs.b;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::learning_service::AddRequest_<ContainerAllocator1> & lhs, const ::learning_service::AddRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace learning_service

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::learning_service::AddRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::learning_service::AddRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::learning_service::AddRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::learning_service::AddRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::learning_service::AddRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::learning_service::AddRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::learning_service::AddRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6f4f9f1b571de73ae8592a1438fd23f3";
  }

  static const char* value(const ::learning_service::AddRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6f4f9f1b571de73aULL;
  static const uint64_t static_value2 = 0xe8592a1438fd23f3ULL;
};

template<class ContainerAllocator>
struct DataType< ::learning_service::AddRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "learning_service/AddRequest";
  }

  static const char* value(const ::learning_service::AddRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::learning_service::AddRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 a\n"
"float64 b\n"
;
  }

  static const char* value(const ::learning_service::AddRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::learning_service::AddRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.a);
      stream.next(m.b);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AddRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::learning_service::AddRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::learning_service::AddRequest_<ContainerAllocator>& v)
  {
    s << indent << "a: ";
    Printer<double>::stream(s, indent + "  ", v.a);
    s << indent << "b: ";
    Printer<double>::stream(s, indent + "  ", v.b);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LEARNING_SERVICE_MESSAGE_ADDREQUEST_H
