;;;; package.lisp
;;;; cl-alexandria-pure package definition

(defpackage #:cl-alexandria-pure
  (:use #:cl)
  (:nicknames #:alexandria-pure #:alex)
  (:export
   ;; Control flow macros
   #:when-let
   #:when-let*
   #:if-let
   #:if-let*
   ;; Macro utilities
   #:with-gensyms
   #:once-only
   ;; List utilities
   #:ensure-list
   #:flatten
   #:mappend
   #:lastcar
   #:proper-list-p
   #:circular-list-p
   ;; Function utilities
   #:curry
   #:rcurry
   #:compose
   ;; Hash table utilities
   #:hash-table-keys
   #:hash-table-values
   #:alist-hash-table
   #:copy-hash-table
   ;; Sequence utilities
   #:shuffle
   #:random-elt
   #:iota
   ;; Symbol utilities
   #:make-keyword
   #:symbolicate))
