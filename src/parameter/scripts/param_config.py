#!/usr/bin/env python3
# coding:utf-8

# python头文件配置, 在运行python脚本时告诉操作系统要用python解释器.
# 告诉python解释器此源程序是utf-8编码的, 即要求解释器按utf-8编码的方式来读取程序.

import sys
import rospy

def param_config():
    # 初始化名为"param_config"的节点, 而 anonymous=True 作用是当之后定义了一个同名的
    # 节点时, 按照序号进行排列.
    rospy.init_node("param_config", anonymous=True)

    # 获取参数值.
    red = rospy.get_param("/turtlesim/background_r")
    green = rospy.get_param("/turtlesim/background_g")
    blue = rospy.get_param("/turtlesim/background_b")
    rospy.loginfo("Get background color [%d, %d, %d]", red, green, blue)

    # 对参数值进行赋值.
    rospy.set_param("/turtlesim/background_r", 255)
    rospy.set_param("/turtlesim/background_g", 255)
    rospy.set_param("/turtlesim/background_b", 0)
    rospy.loginfo("Set background color [255, 255, 0]")

    # 再次读取参数.
    red = rospy.get_param("/turtlesim/background_r")
    green = rospy.get_param("/turtlesim/background_g")
    blue = rospy.get_param("/turtlesim/background_b")
    rospy.loginfo("Get background color [%d, %d, %d]", red, green, blue)

    # 删除参数.
    rospy.delete_param("/turtlesim/background_b")
    ifparam1 = rospy.has_param("/turtlesim/background_b")
    if(ifparam1):
        rospy.loginfo("/turtlesim/background_b exists")
    else:
        rospy.loginfo("/turtlesim/background_b doesn't exists")

    params = rospy.get_param_names()  # 获取现存所有参数名.
    rospy.loginfo("param list: %s", params)  # 并在终端打印.

if __name__ == "__main__":
    param_config()