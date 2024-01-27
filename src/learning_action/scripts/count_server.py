#!/usr/bin/env python3
# coding:utf-8

import actionlib
import rospy
from learning_action.msg import CountAction, CountFeedback, CountGoal, CountResult


class CountActionServer:
    goal = CountGoal()

    def __init__(self) -> None:
        self.server = actionlib.SimpleActionServer(
            "count", CountAction, self.executeCallback, False
        )
        self.server.register_preempt_callback(self.preemptyCallback)

    def executeCallback(self, goal):
        rate = rospy.Rate(1)
        rospy.loginfo("Get the goal, the goal value is: %d", goal.goal_num)
        feedback = CountFeedback()
        result = CountResult()
        count_num = 0
        finish_num = 10
        while count_num < finish_num:
            count_num += 1
            rospy.loginfo("Counting the number: %d", count_num)
            feedback.percent_complete = (float(count_num) / float(finish_num)) * 100
            self.server.publish_feedback(feedback)
            rate.sleep()
            result.finish = count_num
        if self.server.is_active():
            self.server.set_succeeded()

    def preemptyCallback(self):
        if self.server.is_active():
            self.server.set_preempted()

    def start(self):
        self.server.start()


if __name__ == "__main__":
    rospy.init_node("count_server")
    countserver = CountActionServer()
    countserver.start()
    rospy.spin()
