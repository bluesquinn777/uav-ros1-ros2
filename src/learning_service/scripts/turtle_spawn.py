#!/usr/bin/env python3
# coding:utf-8

import rospy
from requests import request
from turtlesim.srv import Spawn


def turtle_spawn():
    rospy.init_node("turtle_spawn")
    rospy.wait_for_service("/spawn")
    try:
        spawn_turtle = rospy.ServiceProxy("/spawn", Spawn)
        srv = Spawn()
        srv.x = 1.0
        srv.y = 1.0
        srv.theta = 3.1415
        srv.name = "turtle2"

        # 用于客户端向 /spawn 服务中发送具体内容, 其中, srv 的内容作为 spawn_turtle() 的参数输入,
        # /spawn 服务接收到该要求后会按照 srv 中规定的格式去执行. 本节中的服务端为海龟服务器, 服务会
        # 在海龟服务器中执行要求. 执行成功会反馈一个生成的海龟的名称并将其赋给 response.
        response = spawn_turtle(srv.x, srv.y, srv.theta, srv.name)
        rospy.loginfo(
            "Call service to spawn turtle [x: %0.6f, y: %0.6f, theta: %0.6f, name: %s]",
            srv.x,
            srv.y,
            srv.theta,
            srv.name,
        )
        rospy.loginfo("Spawn turtle successfully, new turtle name: %s", response.name)
    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s", e)


if __name__ == "__main__":
    turtle_spawn()
