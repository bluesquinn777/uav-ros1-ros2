#!/usr/bin/env python3
# coding:utf-8
import rospy
from geometry_msgs.msg import Twist

count = 0


def velCallback(msg):
    """定义回调函数.

    Args:
        msg (Twist): 输出海龟速度消息内容
    """
    global count  # 注意这里使用 global 来全局记录计数器
    rospy.loginfo(
        "Turtle vel: linear x: %0.6f, y: %0.6f, z: %0.6f angular x: %0.6f, y: %0.6f, z: %0.6f",
        msg.linear.x,
        msg.linear.y,
        msg.linear.z,
        msg.angular.x,
        msg.angular.y,
        msg.angular.z,
    )
    count += 1

    rospy.loginfo("Subscribe times are: [%d]", count)


def vel_subscriber():
    """创建一个订阅者, 并指定其接收的话题为 /turtle1/cmd_vel, 接收到的消息的数据结构为 Twist, 并将其链接到
    回调函数 velCallback, 当其接收到来自话题的信息时, 系统会自动跳转到回调函数中.
    """
    # 全局计数变量
    rospy.init_node("turtle1_vel_subscriber", anonymous=True)
    rospy.Subscriber("/turtle1/cmd_vel", Twist, velCallback)
    rospy.spin()


if __name__ == "__main__":
    vel_subscriber()
