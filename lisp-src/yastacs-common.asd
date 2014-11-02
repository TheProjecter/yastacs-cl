;;;; yastacs common
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
;;;; yastacs-common.asd

(defpackage #:yastacs-system
  (:use #:cl #:asdf))
(in-package #:yastacs-system)

(asdf:defsystem #:yastacs-common
;  :serial t
  :description "Yet Another Space Trading And Combat Simalator common things"
  :author "Kalman Kiss <kiskami@freemail.hu>"
  :license "GPL2"
;  :depends-on ()
  :components ((:module "common" :components
			((:file "package")
			 (:file "specials" :depends-on ("package"))
			 (:file "log" :depends-on ("package"))
			 (:file "universum" :depends-on ("package" "specials" "log"))))))
