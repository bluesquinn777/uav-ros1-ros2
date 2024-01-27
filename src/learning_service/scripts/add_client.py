#!/usr/bin/env python3
# coding:utf-8

import sys

import rospy

from learning_service.srv import Add  # 包含自定义的Add.srv的服务类型, 用于后续传送服务的数据.


def add_client(x, y):
    # 初始化一个名为add_client的节点, 并等待由客户端创建的服务add_service, 为之后客户端向该服务发送数据做准备.
    rospy.init_node("add_client", anonymous=True)  # 注意这里节点名是 add_client
    rospy.wait_for_service("add_service")  # 注意这里服务是 add_service

    try:  # 构造客户端实例, 通过客户端将从终端中获取的参数x, y传递给服务从而获得服务的反馈值.
        # 生成一个名为c的客户端实例, 定义其服务类型为Add型, 将其连接到指定服务add_service.
        c = rospy.ServiceProxy("add_service", Add)
        # 用于调用服务, 即将终端中得到的参数传递到服务中, 并将该服务中的数据传递给变量response, 用于获取服务反馈值.
        response = c(x, y)
        rospy.loginfo("Sum is: %s", response.sum)
    except rospy.ServiceException as e:
        rospy.loginfo("Failed to call service add_service: %s", e)


if __name__ == "__main__":
    if len(sys.argv) == 3:  # 接收终端中输入的参数, 并将参数赋值为x和y, 将其作为参数传递给add_client函数.
        x = float(sys.argv[1])
        y = float(sys.argv[2])
        add_client(x, y)
    else:
        rospy.logerr("usage: add two ints X Y")
        sys.exit(1)
