; Auto-generated. Do not edit!


(cl:in-package learning_action-msg)


;//! \htmlinclude CountGoal.msg.html

(cl:defclass <CountGoal> (roslisp-msg-protocol:ros-message)
  ((goal_num
    :reader goal_num
    :initarg :goal_num
    :type cl:integer
    :initform 0))
)

(cl:defclass CountGoal (<CountGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CountGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CountGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learning_action-msg:<CountGoal> is deprecated: use learning_action-msg:CountGoal instead.")))

(cl:ensure-generic-function 'goal_num-val :lambda-list '(m))
(cl:defmethod goal_num-val ((m <CountGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_action-msg:goal_num-val is deprecated.  Use learning_action-msg:goal_num instead.")
  (goal_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CountGoal>) ostream)
  "Serializes a message object of type '<CountGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'goal_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'goal_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'goal_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'goal_num)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CountGoal>) istream)
  "Deserializes a message object of type '<CountGoal>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'goal_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'goal_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'goal_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'goal_num)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CountGoal>)))
  "Returns string type for a message object of type '<CountGoal>"
  "learning_action/CountGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CountGoal)))
  "Returns string type for a message object of type 'CountGoal"
  "learning_action/CountGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CountGoal>)))
  "Returns md5sum for a message object of type '<CountGoal>"
  "255f71eb93c304464e7bb2f6b7689d25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CountGoal)))
  "Returns md5sum for a message object of type 'CountGoal"
  "255f71eb93c304464e7bb2f6b7689d25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CountGoal>)))
  "Returns full string definition for message of type '<CountGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%uint32 goal_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CountGoal)))
  "Returns full string definition for message of type 'CountGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%uint32 goal_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CountGoal>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CountGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'CountGoal
    (cl:cons ':goal_num (goal_num msg))
))
