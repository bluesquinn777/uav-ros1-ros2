; Auto-generated. Do not edit!


(cl:in-package learning_action-msg)


;//! \htmlinclude CountFeedback.msg.html

(cl:defclass <CountFeedback> (roslisp-msg-protocol:ros-message)
  ((percent_complete
    :reader percent_complete
    :initarg :percent_complete
    :type cl:float
    :initform 0.0))
)

(cl:defclass CountFeedback (<CountFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CountFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CountFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learning_action-msg:<CountFeedback> is deprecated: use learning_action-msg:CountFeedback instead.")))

(cl:ensure-generic-function 'percent_complete-val :lambda-list '(m))
(cl:defmethod percent_complete-val ((m <CountFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_action-msg:percent_complete-val is deprecated.  Use learning_action-msg:percent_complete instead.")
  (percent_complete m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CountFeedback>) ostream)
  "Serializes a message object of type '<CountFeedback>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'percent_complete))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CountFeedback>) istream)
  "Deserializes a message object of type '<CountFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'percent_complete) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CountFeedback>)))
  "Returns string type for a message object of type '<CountFeedback>"
  "learning_action/CountFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CountFeedback)))
  "Returns string type for a message object of type 'CountFeedback"
  "learning_action/CountFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CountFeedback>)))
  "Returns md5sum for a message object of type '<CountFeedback>"
  "d342375c60a5a58d3bc32664070a1368")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CountFeedback)))
  "Returns md5sum for a message object of type 'CountFeedback"
  "d342375c60a5a58d3bc32664070a1368")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CountFeedback>)))
  "Returns full string definition for message of type '<CountFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%float32 percent_complete~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CountFeedback)))
  "Returns full string definition for message of type 'CountFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%float32 percent_complete~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CountFeedback>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CountFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'CountFeedback
    (cl:cons ':percent_complete (percent_complete msg))
))
