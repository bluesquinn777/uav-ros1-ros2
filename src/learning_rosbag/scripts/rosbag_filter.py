#!/usr/bin/env python3
# coding:utf-8

############## Only templates for rosbag filter

import os

import rosbag


def rosbag_merge(bag_merge, path):
    bagn = rosbag.Bag(path, "r")
    t1, t2 = 1638832875, 1638832875 + 100  # 给定时间段
    # 注意topic, msg, t顺序, 从包中解析依次是话题, 该话题消息内容, 该话题的时间戳
    for topic, msg, t in bagn:
        tmp = t
        tmp = float(str(tmp)) / 1e9  # 转化为秒
        if float(t1) <= tmp <= float(t2):
            if topic == "/topic_1":
                bag_merge.write(topic, msg, t)
            if topic == "/topic_2":
                bag_merge.write(topic, msg, t)
    bagn.close()


if __name__ == "__main__":
    bag_merge = rosbag.Bag("/home/qq219/uav-ros1-ros2/merge.bag", "w")
    path = os.path.split(os.path.realpath(__file__))[0]
    for files in os.listdir(path):
        if files.endswith(("bag")):
            bag_path = os.path.join(path, files)
            rosbag_merge(bag_merge, bag_path)
