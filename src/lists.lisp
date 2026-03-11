;;;; src/lists.lisp
;;;; List utilities

(in-package #:cl-alexandria-pure)

(defun ensure-list (thing)
  "If THING is a list, return it. Otherwise return (list thing)."
  (if (listp thing)
      thing
      (list thing)))

(defun flatten (tree)
  "Flatten a nested list structure into a single flat list."
  (let ((result nil))
    (labels ((rec (x)
               (cond ((null x) nil)
                     ((atom x) (push x result))
                     (t (rec (car x))
                        (rec (cdr x))))))
      (rec tree))
    (nreverse result)))

(defun mappend (function &rest lists)
  "Map FUNCTION over LISTS and append the results."
  (apply #'append (apply #'mapcar function lists)))

(defun lastcar (list)
  "Return the last element of LIST. Equivalent to (car (last list))."
  (car (last list)))

(defun proper-list-p (object)
  "Return T if OBJECT is a proper list."
  (and (listp object)
       (null (cdr (last object)))))

(defun circular-list-p (object)
  "Return T if OBJECT is a circular list.
Uses Floyd's cycle detection algorithm."
  (and (consp object)
       (loop with slow = object
             with fast = object
             do (setf fast (cdr fast))
                (unless (consp fast)
                  (return nil))
                (setf fast (cdr fast))
                (unless (consp fast)
                  (return nil))
                (setf slow (cdr slow))
             when (eq slow fast)
               return t)))
