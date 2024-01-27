#!/usr/bin/env python3
# coding:utf-8

import threading

import rospy
from geometry_msgs.msg import Twist
from std_srvs.srv import Trigger, TriggerResponse

# 创建全局的pubflag和Publisher, 并初始化.
pubflag = False
turtle_vel_pub = rospy.Publisher("/turtle1/cmd_vel", Twist, queue_size=1000)


def commandCallback(req):
    """定义回调函数

    Args:
        req (std_srvs.srv.TriggerRequest): 表示request, 但根据.srv文件定义, 这里输入为空

    Returns:
        std_srvs.srv.TriggerResponse: 表示response, 根据.srv文件定义, 需返回是否成功, 以及对应信息.
    """
    global pubflag
    pubflag = bool(1 - pubflag)
    rospy.loginfo("Publish turtle velocity command: %s", pubflag)
    # 对Trigger.srv文件中的response的两个变量进行赋值.
    return TriggerResponse(1, "Change turtle pubflag value successfully")


def turtle_command_server():
    rospy.init_node("turtle_vel_cmd", anonymous=True)
    # 创建一个名为s的服务端实例和一个名为"/turtle_cmd"的服务, 将其连接到回调函数commandCallback,
    # 该服务的类型为Trigger.
    s = rospy.Service("/turtle_cmd", Trigger, commandCallback)
    rate = rospy.Rate(10)

    # 初始化Twist消息之后Publisher向指定话题发送消息.
    vel_msg = Twist()
    vel_msg.linear.x = 1.0
    vel_msg.angular.z = 1.0

    rospy.loginfo("Ready to receive turtle command.")
    while True:  # 服务的循环查询, Publisher功能的执行和当前线程数的查询.
        if pubflag:
            turtle_vel_pub.publish(vel_msg)
            rospy.loginfo("The number of threads are: %d", len(threading.enumerate()))
            rate.sleep()

    rospy.spin()


if __name__ == "__main__":
    turtle_command_server()
