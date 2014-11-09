;;;; yastacs common utils
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
;;; utils.lisp

(in-package #:yastacs-common)

(defun get-rndstate (rndstate)
  "Utility func for initializing random state in rnd funcs."
  (if (null rndstate) (make-random-state t) rndstate))

(defun rnd (&key (from 0) (to 1) (rndstate nil))
  "Generate random numbers between :from inclusive and :to exclusive."
  (let ((rt (get-rndstate rndstate)))
    (+ from (random (- to from) rt))))

(defun calc-limits (probs)
  "Utility func for rnd* - calcs the limits for rnd*"
  (loop 
   for p in probs ;do
       sum (car p) into m
       append (list (cons m (cdr p))) into l
     finally (return (values m l))))

(defun rnd* (probs &optional (rndstate nil))
  "Randomly selects from a consed list of probs and values.
Example value for probs '((0.1 . one) (0.1 . two) (0.2 . three))
"
  (multiple-value-bind (limit margins) 
      (calc-limits probs)
    (let ((r (rnd :to limit :rndstate (get-rndstate rndstate))))
      (when (> limit 0)
	(loop for m in margins
	   if (> (car m) r) return (values (cdr m) r))))))
