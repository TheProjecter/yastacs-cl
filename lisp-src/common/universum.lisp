;;;; yastacs common universum
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
;;; universum.lisp

(in-package #:yastacs-common)

(defconstant *species* '(SP_NO SP_HUMAN SP_MANDULIN SP_CATOV SP_HYDROZ SP_KLOUDER) "Intelligent species in universum.")
(defconstant *startypes* '(ST_PROTO ST_MAINSEQ ST_REDGIANT ST_WHITEDWARF ST_NEUTRON))
(defconstant *planettypes* '(PT_GASGIANT PT_ICEGIANT PT_TERRESTRIAL))
(defconstant *cloudtypes* '(CT_EMISSION CT_PLANETARY CT_PROTO CT_SUPER))
(defconstant *asteroidfieldtypes* '(AS_BELT AS_CLOUD))
(defconstant *civlevels* '(CL_YOUNG CL_DEVELOPING CL_MATURE CL_DECAYING CL_DEAD) "Civilizations developedments levels.")
(defconstant *agricultlevels* '(AIL_NONE AIL_BASIC AIL_MEDIUM AIL_STRONG) "Agricultural or industry levels of planets.")

(defstruct univ
  "Game universum data structure."
  rndstate
  (dimension '(0 0 0) :read-only t)
  sectors)

(defstruct sector
  "A sector in the universum - cubic space, identified by its 3D coordinats."
  x y z					;position in sector
  name
  owner
  systems				;solar systems in the sector
  blackhole				;a blackhol if present in the system
  clouds				;clouds in the system
  asteroidfields)			;asteroids or groups of them in the system

(defstruct solsystem
  "Solar systems in the sector with stars."
  name
  stars)

(defstruct blackhole
  "Blackhole in a sector."
  x y z					;position in sector
  name
  rotating
  size)

(defstruct cloud
  "Cloud in a sector."
  x y z					;position in sector
  name
  size
  type)

(defstruct asteroidfield
  "Asteroidfield in a sector"
  x y z					;position in sector
  xd yd zd				;dimensions in 3d
  name
  type
  count
  asteroidlst)

(defstruct asteroid
  x y z					;position in field
  size)

(defstruct star
  x y z					;position in sector
  name
  type
  planets)

(defstruct planet
  x y z					;position in sector
  name
  type
  civlevel
  agrilevel
  indulevel
  moons)				;orbiting planets

;;; ===============================================================

(defun generate-universum (xd yd zd &optional (rndstate nil))
  (let ((u (make-univ :rndstate rndstate :dimension (list xd yd zd))))
    (log_msg 'INFO (format nil "Generating universum with dimensions (~A,~A,~A)" xd yd zd))    
    (setf (univ-rndstate u) (if (null rndstate)
			      (progn 
				(yastacs-common:log_msg 'WARN "Initializing new fresh random state")
				(make-random-state t))
			      rndstate))

    
    
    
    
    u)
  )
