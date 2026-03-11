;;;; cl-alexandria-pure.asd
;;;; Common utility functions with ZERO external dependencies

(asdf:defsystem #:cl-alexandria-pure
  :description "Common utility functions for Common Lisp - pure implementation"
  :author "Parkian Company LLC"
  :license "BSD-3-Clause"
  :version "1.0.0"
  :serial t
  :components ((:file "package")
               (:module "src"
                :components ((:file "macros")
                             (:file "lists")
                             (:file "functions")
                             (:file "hash-tables")
                             (:file "sequences")
                             (:file "symbols")))))
