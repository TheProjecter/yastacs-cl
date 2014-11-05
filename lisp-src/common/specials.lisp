;;;; yastacs common specials
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
;;; specials.lisp

(in-package #:yastacs-common)

(defconstant +UNIVERSUM-DENSITY+ 0.001 "How many sectors contain some solar sytems and others in the universum.")

(defconstant +MIN_SOLSYSTEMS-PER-SECTOR+ 1)
(defconstant +MAX_SOLSYSTEMS-PER-SECTOR 5)

; hány asteroid belt vagy cloud van egy szektorban
(defconstant +MIN-ASTB-OR-CLO-PER-SECTOR 0)
(defconstant +MAX-ASTB-OR-CLO-PER-SECTOR 2)
(defconstant +MAX-ASTB-OR-CLO-PER-SECTOR2 1)
(defconstant +ASTB-OR-CLO-PROBABILITY 0.3)
(defconstant +MAX-BLACKHOLE-PER-SECTOR 1)
(defconstant +BLACKHOLE-PROBABILITY+ 0.1)

; hány csillag lehet egy naprendszerben
(defconstant +MIN-STARTS-IN-SOLSYS 1)
(defconstant +MAX-STARTS-IN-SOLSYS 2)
