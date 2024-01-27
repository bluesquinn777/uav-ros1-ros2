
(cl:in-package :asdf)

(defsystem "learning_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Add" :depends-on ("_package_Add"))
    (:file "_package_Add" :depends-on ("_package"))
    (:file "Spawn" :depends-on ("_package_Spawn"))
    (:file "_package_Spawn" :depends-on ("_package"))
    (:file "Trigger" :depends-on ("_package_Trigger"))
    (:file "_package_Trigger" :depends-on ("_package"))
  ))