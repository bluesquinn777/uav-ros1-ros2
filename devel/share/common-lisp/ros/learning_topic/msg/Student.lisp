; Auto-generated. Do not edit!


(cl:in-package learning_topic-msg)


;//! \htmlinclude Student.msg.html

(cl:defclass <Student> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (sex
    :reader sex
    :initarg :sex
    :type cl:fixnum
    :initform 0)
   (age
    :reader age
    :initarg :age
    :type cl:fixnum
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:fixnum
    :initform 0)
   (weight
    :reader weight
    :initarg :weight
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Student (<Student>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Student>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Student)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learning_topic-msg:<Student> is deprecated: use learning_topic-msg:Student instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Student>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:name-val is deprecated.  Use learning_topic-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'sex-val :lambda-list '(m))
(cl:defmethod sex-val ((m <Student>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:sex-val is deprecated.  Use learning_topic-msg:sex instead.")
  (sex m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <Student>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:age-val is deprecated.  Use learning_topic-msg:age instead.")
  (age m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <Student>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:height-val is deprecated.  Use learning_topic-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'weight-val :lambda-list '(m))
(cl:defmethod weight-val ((m <Student>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:weight-val is deprecated.  Use learning_topic-msg:weight instead.")
  (weight m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Student>)))
    "Constants for message type '<Student>"
  '((:FEMALE . 0)
    (:MALE . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Student)))
    "Constants for message type 'Student"
  '((:FEMALE . 0)
    (:MALE . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Student>) ostream)
  "Serializes a message object of type '<Student>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sex)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'weight)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Student>) istream)
  "Deserializes a message object of type '<Student>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sex)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'weight)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Student>)))
  "Returns string type for a message object of type '<Student>"
  "learning_topic/Student")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Student)))
  "Returns string type for a message object of type 'Student"
  "learning_topic/Student")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Student>)))
  "Returns md5sum for a message object of type '<Student>"
  "92a1bc3c3ccabdc7bc35e52e7da3e1a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Student)))
  "Returns md5sum for a message object of type 'Student"
  "92a1bc3c3ccabdc7bc35e52e7da3e1a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Student>)))
  "Returns full string definition for message of type '<Student>"
  (cl:format cl:nil "string name~%uint8 sex~%uint8 age~%uint8 height~%uint8 weight~%uint8 female = 0~%uint8 male = 1~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Student)))
  "Returns full string definition for message of type 'Student"
  (cl:format cl:nil "string name~%uint8 sex~%uint8 age~%uint8 height~%uint8 weight~%uint8 female = 0~%uint8 male = 1~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Student>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Student>))
  "Converts a ROS message object to a list"
  (cl:list 'Student
    (cl:cons ':name (name msg))
    (cl:cons ':sex (sex msg))
    (cl:cons ':age (age msg))
    (cl:cons ':height (height msg))
    (cl:cons ':weight (weight msg))
))
