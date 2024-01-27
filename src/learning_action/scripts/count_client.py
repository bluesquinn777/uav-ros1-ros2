#!/usr/bin/env python3
# coding:utf-8

import actionlib
import rospy
from learning_action.msg import CountAction, CountGoal


class CountActionClient:
    def __init__(self) -> None:
        """初始化函数, 构建一个名为client的实例, 其类型为actionlib.SimpleActionClient, "count"用于
        和动作服务端进行通信, 而CountAction是编译自定义action文件时生成的消息文件, 该参数用于被
        SimpleActionClient抓取来寻找我们定义的其他消息的类型.
        """
        self.client = actionlib.SimpleActionClient("count", CountAction)

    def doneCallback(self, state, result):
        """完成时回调函数.

        Args:
            state (int): 动作服务端的状态, 2代表PREEMPTED, 3代表SUCCEEDED, 4代码ABORTED.
            result (_type_): _description_
        """
        rospy.loginfo("Finished in state %d", state)
        rospy.loginfo("Total counted number: %d", result.finish)
        rospy.is_shutdown()

    def activeCallback(self):
        rospy.loginfo("Goal has been active")

    def feedbackCallback(self, feedback):
        rospy.loginfo("The progress is: %0.2f %%", feedback.percent_complete)

    def start(self):
        self.client.wait_for_server()
        goal = CountGoal()
        goal.goal_num = 1
        self.client.send_goal(
            goal, self.doneCallback, self.activeCallback, self.feedbackCallback
        )
        self.client.wait_for_result(rospy.Duration(30.0))
        if self.client.get_state() == actionlib.GoalStatus.SUCCEEDED:
            rospy.loginfo("The number are counted")
        else:
            rospy.loginfo("Cancel the goal")
            self.client.cancel_all_goals()
        rospy.loginfo("Current state: %d\n", self.client.get_state())


if __name__ == "__main__":
    rospy.init_node("count_client")
    countclient = CountActionClient()
    countclient.start()
    rospy.spin()
