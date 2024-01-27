; Auto-generated. Do not edit!


(cl:in-package learning_service-srv)


;//! \htmlinclude Add-request.msg.html

(cl:defclass <Add-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:float
    :initform 0.0)
   (b
    :reader b
    :initarg :b
    :type cl:float
    :initform 0.0))
)

(cl:defclass Add-request (<Add-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Add-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Add-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learning_service-srv:<Add-request> is deprecated: use learning_service-srv:Add-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <Add-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_service-srv:a-val is deprecated.  Use learning_service-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <Add-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_service-srv:b-val is deprecated.  Use learning_service-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Add-request>) ostream)
  "Serializes a message object of type '<Add-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Add-request>) istream)
  "Deserializes a message object of type '<Add-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'a) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'b) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Add-request>)))
  "Returns string type for a service object of type '<Add-request>"
  "learning_service/AddRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Add-request)))
  "Returns string type for a service object of type 'Add-request"
  "learning_service/AddRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Add-request>)))
  "Returns md5sum for a message object of type '<Add-request>"
  "eb3958e9614615192c3e63bd0b5590df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Add-request)))
  "Returns md5sum for a message object of type 'Add-request"
  "eb3958e9614615192c3e63bd0b5590df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Add-request>)))
  "Returns full string definition for message of type '<Add-request>"
  (cl:format cl:nil "float64 a~%float64 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Add-request)))
  "Returns full string definition for message of type 'Add-request"
  (cl:format cl:nil "float64 a~%float64 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Add-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Add-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Add-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude Add-response.msg.html

(cl:defclass <Add-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:float
    :initform 0.0))
)

(cl:defclass Add-response (<Add-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Add-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Add-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learning_service-srv:<Add-response> is deprecated: use learning_service-srv:Add-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <Add-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_service-srv:sum-val is deprecated.  Use learning_service-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Add-response>) ostream)
  "Serializes a message object of type '<Add-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'sum))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Add-response>) istream)
  "Deserializes a message object of type '<Add-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sum) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Add-response>)))
  "Returns string type for a service object of type '<Add-response>"
  "learning_service/AddResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Add-response)))
  "Returns string type for a service object of type 'Add-response"
  "learning_service/AddResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Add-response>)))
  "Returns md5sum for a message object of type '<Add-response>"
  "eb3958e9614615192c3e63bd0b5590df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Add-response)))
  "Returns md5sum for a message object of type 'Add-response"
  "eb3958e9614615192c3e63bd0b5590df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Add-response>)))
  "Returns full string definition for message of type '<Add-response>"
  (cl:format cl:nil "float64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Add-response)))
  "Returns full string definition for message of type 'Add-response"
  (cl:format cl:nil "float64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Add-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Add-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Add-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Add)))
  'Add-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Add)))
  'Add-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Add)))
  "Returns string type for a service object of type '<Add>"
  "learning_service/Add")