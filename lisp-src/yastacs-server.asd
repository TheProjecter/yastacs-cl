;;;; yastacs-server.asd

(defpackage #:yastacs-system
  (:use #:cl #:asdf))
(in-package #:yastacs-system)

(asdf:defsystem #:yastacs-server
  :serial t
  :description "Yet Another Space Trading And Combat Simulator server"
  :author "Kalman Kiss <kiskami@freemail.hu>"
  :license "GPL2"
  :depends-on (#:yastacs-common)
  :components ((:module "server" :components
			((:file "package")
			 (:file "yastacs")))))

