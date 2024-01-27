;; Auto-generated. Do not edit!


(when (boundp 'learning_service::Add)
  (if (not (find-package "LEARNING_SERVICE"))
    (make-package "LEARNING_SERVICE"))
  (shadow 'Add (find-package "LEARNING_SERVICE")))
(unless (find-package "LEARNING_SERVICE::ADD")
  (make-package "LEARNING_SERVICE::ADD"))
(unless (find-package "LEARNING_SERVICE::ADDREQUEST")
  (make-package "LEARNING_SERVICE::ADDREQUEST"))
(unless (find-package "LEARNING_SERVICE::ADDRESPONSE")
  (make-package "LEARNING_SERVICE::ADDRESPONSE"))

(in-package "ROS")





(defclass learning_service::AddRequest
  :super ros::object
  :slots (_a _b ))

(defmethod learning_service::AddRequest
  (:init
   (&key
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    )
   (send-super :init)
   (setq _a (float __a))
   (setq _b (float __b))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; float64 _a
    8
    ;; float64 _b
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _a
       (sys::poke _a (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _b
       (sys::poke _b (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _a
     (setq _a (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _b
     (setq _b (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass learning_service::AddResponse
  :super ros::object
  :slots (_sum ))

(defmethod learning_service::AddResponse
  (:init
   (&key
    ((:sum __sum) 0.0)
    )
   (send-super :init)
   (setq _sum (float __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; float64 _sum
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _sum
       (sys::poke _sum (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _sum
     (setq _sum (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass learning_service::Add
  :super ros::object
  :slots ())

(setf (get learning_service::Add :md5sum-) "eb3958e9614615192c3e63bd0b5590df")
(setf (get learning_service::Add :datatype-) "learning_service/Add")
(setf (get learning_service::Add :request) learning_service::AddRequest)
(setf (get learning_service::Add :response) learning_service::AddResponse)

(defmethod learning_service::AddRequest
  (:response () (instance learning_service::AddResponse :init)))

(setf (get learning_service::AddRequest :md5sum-) "eb3958e9614615192c3e63bd0b5590df")
(setf (get learning_service::AddRequest :datatype-) "learning_service/AddRequest")
(setf (get learning_service::AddRequest :definition-)
      "float64 a
float64 b
---
float64 sum
")

(setf (get learning_service::AddResponse :md5sum-) "eb3958e9614615192c3e63bd0b5590df")
(setf (get learning_service::AddResponse :datatype-) "learning_service/AddResponse")
(setf (get learning_service::AddResponse :definition-)
      "float64 a
float64 b
---
float64 sum
")



(provide :learning_service/Add "eb3958e9614615192c3e63bd0b5590df")


