;;;; src/sequences.lisp
;;;; Sequence utilities

(in-package #:cl-alexandria-pure)

(defun shuffle (sequence)
  "Return a randomly shuffled copy of SEQUENCE.
Uses Fisher-Yates algorithm."
  (let ((result (copy-seq sequence))
        (n (length sequence)))
    (loop for i from (1- n) downto 1
          for j = (random (1+ i))
          do (rotatef (elt result i) (elt result j)))
    result))

(defun random-elt (sequence)
  "Return a random element from SEQUENCE.
Signals an error if sequence is empty."
  (when (zerop (length sequence))
    (error "Cannot select random element from empty sequence"))
  (elt sequence (random (length sequence))))

(defun iota (n &key (start 0) (step 1))
  "Return a list of N integers starting from START with STEP increment.
(iota 5) => (0 1 2 3 4)
(iota 5 :start 1) => (1 2 3 4 5)
(iota 5 :start 0 :step 2) => (0 2 4 6 8)"
  (loop for i from start by step
        repeat n
        collect i))
