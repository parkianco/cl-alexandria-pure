;;;; src/symbols.lisp
;;;; Symbol utilities

(in-package #:cl-alexandria-pure)

(defun make-keyword (name)
  "Intern NAME as a keyword.
NAME can be a string or symbol."
  (intern (string-upcase (string name)) :keyword))

(defun symbolicate (&rest things)
  "Concatenate THINGS into a single symbol in the current package.
Each thing can be a symbol, string, or character."
  (intern (apply #'concatenate 'string
                 (mapcar (lambda (thing)
                           (etypecase thing
                             (string thing)
                             (symbol (symbol-name thing))
                             (character (string thing))))
                         things))))
