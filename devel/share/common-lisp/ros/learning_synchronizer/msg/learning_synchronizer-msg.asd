
(cl:in-package :asdf)

(defsystem "learning_synchronizer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Person" :depends-on ("_package_Person"))
    (:file "_package_Person" :depends-on ("_package"))
  ))