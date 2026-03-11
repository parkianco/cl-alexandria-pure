;;;; src/functions.lisp
;;;; Function utilities

(in-package #:cl-alexandria-pure)

(defun curry (function &rest args)
  "Return a function that applies ARGS then any additional arguments to FUNCTION."
  (lambda (&rest more-args)
    (apply function (append args more-args))))

(defun rcurry (function &rest args)
  "Return a function that applies any additional arguments then ARGS to FUNCTION."
  (lambda (&rest more-args)
    (apply function (append more-args args))))

(defun compose (&rest functions)
  "Return a function that is the composition of FUNCTIONS.
The returned function applies the last function first."
  (if (null functions)
      #'identity
      (let ((fn1 (car (last functions)))
            (fns (butlast functions)))
        (lambda (&rest args)
          (reduce #'funcall fns
                  :from-end t
                  :initial-value (apply fn1 args))))))
