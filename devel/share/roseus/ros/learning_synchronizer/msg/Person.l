;; Auto-generated. Do not edit!


(when (boundp 'learning_synchronizer::Person)
  (if (not (find-package "LEARNING_SYNCHRONIZER"))
    (make-package "LEARNING_SYNCHRONIZER"))
  (shadow 'Person (find-package "LEARNING_SYNCHRONIZER")))
(unless (find-package "LEARNING_SYNCHRONIZER::PERSON")
  (make-package "LEARNING_SYNCHRONIZER::PERSON"))

(in-package "ROS")
;;//! \htmlinclude Person.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass learning_synchronizer::Person
  :super ros::object
  :slots (_header _age _height _name ))

(defmethod learning_synchronizer::Person
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:age __age) 0)
    ((:height __height) 0.0)
    ((:name __name) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _age (round __age))
   (setq _height (float __height))
   (setq _name (string __name))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _age
    4
    ;; float32 _height
    4
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _age
       (write-long _age s)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _age
     (setq _age (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get learning_synchronizer::Person :md5sum-) "f6c4bc89784cc3120ef300313a0d4bb7")
(setf (get learning_synchronizer::Person :datatype-) "learning_synchronizer/Person")
(setf (get learning_synchronizer::Person :definition-)
      "Header header
int32 age
float32 height
string name
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :learning_synchronizer/Person "f6c4bc89784cc3120ef300313a0d4bb7")


