;;;; src/hash-tables.lisp
;;;; Hash table utilities

(in-package #:cl-alexandria-pure)

(defun hash-table-keys (hash-table)
  "Return a list of all keys in HASH-TABLE."
  (loop for key being the hash-keys of hash-table
        collect key))

(defun hash-table-values (hash-table)
  "Return a list of all values in HASH-TABLE."
  (loop for value being the hash-values of hash-table
        collect value))

(defun alist-hash-table (alist &key (test #'eql))
  "Convert an association list to a hash table.
TEST specifies the hash table test function."
  (let ((ht (make-hash-table :test test)))
    (loop for (key . value) in alist
          do (setf (gethash key ht) value))
    ht))

(defun copy-hash-table (hash-table &key (test nil test-p))
  "Return a copy of HASH-TABLE with the same keys and values.
If TEST is provided, use it for the new hash table."
  (let ((new (make-hash-table
              :test (if test-p test (hash-table-test hash-table))
              :size (hash-table-size hash-table))))
    (maphash (lambda (k v)
               (setf (gethash k new) v))
             hash-table)
    new))
