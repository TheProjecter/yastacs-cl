;;;; yastacs-client
;;;; Copyright (c) 2014 Kalman Kiss, Zalaegerszeg Hungary
;;;; 
;;;; This program is free software; you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License as published by
;;;; the Free Software Foundation; either version 2 of the License, or
;;;; (at your option) any later version.
;;;; 
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;; 
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program; if not, write to the Free Software
;;;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
;;;;
;;;; yastacs-client.lisp

(in-package :cl-user)

(unless (find-package :asdf)
  (require :asdf))

(asdf:oos 'asdf:load-op :llgs-engine-cl) 

(in-package #:yastacs-client)

(defun disp-name-and-license ()
  (format t "~A~%~A~%~A~%" +GAMELABEL+ +COPYRIGHT+ +RIGHTS+))

(defun conv-to-int (str)
  (parse-integer str :junk-allowed t))  

(defun get-cmdarg (args k def &optional (type nil))
    (let ((p (member k args :test #'equal)))
      (cond (p
	   (ecase type
	     ((int)
	      (let ((value (conv-to-int (second p))))
		(if value 
		    value 
		    (error (format nil "Invalid integer parameter (~A) value '~A'" k (second p))))))
	     ((bool) t)
	     ((nil) (second p))))
	  (t def))))

(defun parse-cmdargs (args)
  "Parse command line and return game initialization parameters."
  (let ((debug (get-cmdarg args "-d" nil 'bool)))
    (when debug (format t "parse-cmdargs: ~A~%" args))
    (make-instance 'config 
		   :renderer_h (get-cmdarg args "-h" 600 'int)
		   :renderer_w (get-cmdarg args "-w" 800 'int)
		   :renderer_fullscr (get-cmdarg args "-f" nil 'bool)
		   :debug debug
		   )))

;;; **************************************************************
(defun client-run ()
  "Yastacs client program entry point."
  (disp-name-and-license)
  (let ((args ccl:*UNPROCESSED-COMMAND-LINE-ARGUMENTS*)) 
    (when (or (get-cmdarg args "-?" nil) (get-cmdarg args "--help" nil))
      (format t "Command line params: -- [-w <res_width>] [-h <res_height>] [-f] [-d] [-?|--help]
 --     - mandatory separator
 -w -h  - renderwindow resolution - width and height in pixels
 -f     - run on fullscreen
 -d     - debug mode
 -?
 --help - this help~%")
      (return-from client-run))
    (yastacs-common:log_msg 'INFO "Parsing cmd args and loading config.")
    (setf *config* (parse-cmdargs args))))
