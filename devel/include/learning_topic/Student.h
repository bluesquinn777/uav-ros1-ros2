// Generated by gencpp from file learning_topic/Student.msg
// DO NOT EDIT!


#ifndef LEARNING_TOPIC_MESSAGE_STUDENT_H
#define LEARNING_TOPIC_MESSAGE_STUDENT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace learning_topic
{
template <class ContainerAllocator>
struct Student_
{
  typedef Student_<ContainerAllocator> Type;

  Student_()
    : name()
    , sex(0)
    , age(0)
    , height(0)
    , weight(0)  {
    }
  Student_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , sex(0)
    , age(0)
    , height(0)
    , weight(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _name_type;
  _name_type name;

   typedef uint8_t _sex_type;
  _sex_type sex;

   typedef uint8_t _age_type;
  _age_type age;

   typedef uint8_t _height_type;
  _height_type height;

   typedef uint8_t _weight_type;
  _weight_type weight;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(female)
  #undef female
#endif
#if defined(_WIN32) && defined(male)
  #undef male
#endif

  enum {
    female = 0u,
    male = 1u,
  };


  typedef boost::shared_ptr< ::learning_topic::Student_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::learning_topic::Student_<ContainerAllocator> const> ConstPtr;

}; // struct Student_

typedef ::learning_topic::Student_<std::allocator<void> > Student;

typedef boost::shared_ptr< ::learning_topic::Student > StudentPtr;
typedef boost::shared_ptr< ::learning_topic::Student const> StudentConstPtr;

// constants requiring out of line definition

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::learning_topic::Student_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::learning_topic::Student_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::learning_topic::Student_<ContainerAllocator1> & lhs, const ::learning_topic::Student_<ContainerAllocator2> & rhs)
{
  return lhs.name == rhs.name &&
    lhs.sex == rhs.sex &&
    lhs.age == rhs.age &&
    lhs.height == rhs.height &&
    lhs.weight == rhs.weight;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::learning_topic::Student_<ContainerAllocator1> & lhs, const ::learning_topic::Student_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace learning_topic

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::learning_topic::Student_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::learning_topic::Student_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::learning_topic::Student_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::learning_topic::Student_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::learning_topic::Student_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::learning_topic::Student_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::learning_topic::Student_<ContainerAllocator> >
{
  static const char* value()
  {
    return "92a1bc3c3ccabdc7bc35e52e7da3e1a1";
  }

  static const char* value(const ::learning_topic::Student_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x92a1bc3c3ccabdc7ULL;
  static const uint64_t static_value2 = 0xbc35e52e7da3e1a1ULL;
};

template<class ContainerAllocator>
struct DataType< ::learning_topic::Student_<ContainerAllocator> >
{
  static const char* value()
  {
    return "learning_topic/Student";
  }

  static const char* value(const ::learning_topic::Student_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::learning_topic::Student_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n"
"uint8 sex\n"
"uint8 age\n"
"uint8 height\n"
"uint8 weight\n"
"uint8 female = 0\n"
"uint8 male = 1\n"
;
  }

  static const char* value(const ::learning_topic::Student_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::learning_topic::Student_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.sex);
      stream.next(m.age);
      stream.next(m.height);
      stream.next(m.weight);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Student_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::learning_topic::Student_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::learning_topic::Student_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.name);
    s << indent << "sex: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.sex);
    s << indent << "age: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.age);
    s << indent << "height: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.height);
    s << indent << "weight: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.weight);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LEARNING_TOPIC_MESSAGE_STUDENT_H
