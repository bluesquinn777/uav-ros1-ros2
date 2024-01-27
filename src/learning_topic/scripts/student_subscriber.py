#!/usr/bin/env python3
# coding:utf-8

import rospy

from learning_topic.msg import Student

count = 0


def studentInfoCallback(msg):
    rospy.loginfo(
        "Subscribe Student info: name: %s, age: %d, sex: %d, height: %d, weight: %d",
        msg.name,
        msg.age,
        msg.sex,
        msg.height,
        msg.weight,
    )
    global count
    count += 1
    rospy.loginfo("Subscribe times are: [%d]", count)


def student_subscriber():
    rospy.init_node("student_subscriber", anonymous=True)
    rospy.Subscriber("/student_info", Student, studentInfoCallback)
    rospy.spin()


if __name__ == "__main__":
    student_subscriber()
