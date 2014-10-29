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
;;; config.lisp

(in-package #:yastacs-client)

(defclass Config ()
  ((renderer_w :accessor renderer_w :initarg :renderer_w :initform 0)
   (renderer_h :accessor renderer_h :initarg :renderer_h :initform 0)
   (renderer_fullscr :accessor renderer_fullscr :initarg :renderer_fullscr :initform nil)
   (debug :accessor debug :initarg :debug :initform nil))
  (:documentation "Class for storing the runtime game configuration."))
