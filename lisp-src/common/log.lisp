;;;; yastacs common log
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
;;; log.lisp

(in-package #:yastacs-common)

(defun log_msg (level msg)
  "Simple logging function (for now)."
  (format t "[~A] [~A] : ~A~%" (get-current-time-str) level msg))

(defun get-current-time-str ()
  (multiple-value-bind (sec min hour date month year day) (get-decoded-time)
    (declare (ignore date))
    (format nil "~A.~2,'0D.~2,'0D ~2,'0D:~2,'0D:~2,'0D" year month day hour min sec)))
