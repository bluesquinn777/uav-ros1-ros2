#!/usr/bin/env python3
# coding:utf-8

import rospy

from learning_service.srv import Add, AddResponse


def addCallback(req):
    """定义回调函数

    Args:
        req (Add.request): 表示Add.srv中的request, 内部具体内容为在客户端中输入的两个参数.

    Returns:
        AddResponse: 返回Add.srv的response, 即输入的和.
    """
    rospy.loginfo(
        "The request and result is: %s + %s = %s", req.a, req.b, (req.a + req.b)
    )
    return AddResponse(req.a + req.b)


def add_server():
    # 初始化add_server节点, 创建名为s的服务端实例, 创建名为add_service的服务,
    # 并将其连接到回调函数addCallback, 该服务的类型为Add.
    rospy.init_node("add_server")
    s = rospy.Service("add_service", Add, addCallback)
    rospy.loginfo("Ready to add two number.")
    rospy.spin()


if __name__ == "__main__":
    add_server()
