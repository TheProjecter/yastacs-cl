;;;; yastacs.asd

(asdf:defsystem #:yastacs
  :serial t
  :description "Describe yastacs here"
  :author "Kalman Kiss <kiskami@freemail.hu"
  :license "GPL2"
  :depends-on (#:llgs-engine-cl)
  :components ((:file "package")
               (:file "yastacs")))

