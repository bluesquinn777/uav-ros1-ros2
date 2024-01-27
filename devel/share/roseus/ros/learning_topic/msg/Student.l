;; Auto-generated. Do not edit!


(when (boundp 'learning_topic::Student)
  (if (not (find-package "LEARNING_TOPIC"))
    (make-package "LEARNING_TOPIC"))
  (shadow 'Student (find-package "LEARNING_TOPIC")))
(unless (find-package "LEARNING_TOPIC::STUDENT")
  (make-package "LEARNING_TOPIC::STUDENT"))

(in-package "ROS")
;;//! \htmlinclude Student.msg.html


(intern "*FEMALE*" (find-package "LEARNING_TOPIC::STUDENT"))
(shadow '*FEMALE* (find-package "LEARNING_TOPIC::STUDENT"))
(defconstant learning_topic::Student::*FEMALE* 0)
(intern "*MALE*" (find-package "LEARNING_TOPIC::STUDENT"))
(shadow '*MALE* (find-package "LEARNING_TOPIC::STUDENT"))
(defconstant learning_topic::Student::*MALE* 1)

(defun learning_topic::Student-to-symbol (const)
  (cond
        ((= const 0) 'learning_topic::Student::*female*)
        ((= const 1) 'learning_topic::Student::*male*)
        (t nil)))

(defclass learning_topic::Student
  :super ros::object
  :slots (_name _sex _age _height _weight ))

(defmethod learning_topic::Student
  (:init
   (&key
    ((:name __name) "")
    ((:sex __sex) 0)
    ((:age __age) 0)
    ((:height __height) 0)
    ((:weight __weight) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _sex (round __sex))
   (setq _age (round __age))
   (setq _height (round __height))
   (setq _weight (round __weight))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:sex
   (&optional __sex)
   (if __sex (setq _sex __sex)) _sex)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint8 _sex
    1
    ;; uint8 _age
    1
    ;; uint8 _height
    1
    ;; uint8 _weight
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint8 _sex
       (write-byte _sex s)
     ;; uint8 _age
       (write-byte _age s)
     ;; uint8 _height
       (write-byte _height s)
     ;; uint8 _weight
       (write-byte _weight s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _sex
     (setq _sex (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _age
     (setq _age (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _height
     (setq _height (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _weight
     (setq _weight (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get learning_topic::Student :md5sum-) "92a1bc3c3ccabdc7bc35e52e7da3e1a1")
(setf (get learning_topic::Student :datatype-) "learning_topic/Student")
(setf (get learning_topic::Student :definition-)
      "string name
uint8 sex
uint8 age
uint8 height
uint8 weight
uint8 female = 0
uint8 male = 1
")



(provide :learning_topic/Student "92a1bc3c3ccabdc7bc35e52e7da3e1a1")


