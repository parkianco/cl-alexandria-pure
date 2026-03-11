;;;; src/macros.lisp
;;;; Control flow and macro utilities

(in-package #:cl-alexandria-pure)

;;; Control flow macros

(defmacro when-let ((var form) &body body)
  "Bind VAR to the result of FORM, execute BODY if non-nil."
  `(let ((,var ,form))
     (when ,var
       ,@body)))

(defmacro when-let* (bindings &body body)
  "Like WHEN-LET but with multiple sequential bindings.
Each binding is (var form). All must be non-nil for body to execute."
  (if (null bindings)
      `(progn ,@body)
      `(when-let ,(first bindings)
         (when-let* ,(rest bindings)
           ,@body))))

(defmacro if-let ((var form) then &optional else)
  "Bind VAR to FORM, execute THEN if non-nil, otherwise ELSE."
  `(let ((,var ,form))
     (if ,var ,then ,else)))

(defmacro if-let* (bindings then &optional else)
  "Like IF-LET but with multiple sequential bindings.
All bindings must be non-nil for THEN to execute."
  (if (null bindings)
      then
      (let ((var (caar bindings))
            (form (cadar bindings)))
        `(let ((,var ,form))
           (if ,var
               (if-let* ,(rest bindings) ,then ,else)
               ,else)))))

;;; Macro utilities

(defmacro with-gensyms (names &body body)
  "Bind each name in NAMES to a fresh gensym in BODY."
  `(let ,(loop for name in names
               collect `(,name (gensym ,(string name))))
     ,@body))

(defmacro once-only (names &body body)
  "Ensure each name in NAMES is evaluated only once.
Creates gensyms that capture the values, then binds the original names."
  (let ((gensyms (loop for name in names collect (gensym (string name)))))
    `(let ,(loop for g in gensyms for n in names collect `(,g (gensym ,(string n))))
       `(let (,,@(loop for g in gensyms for n in names
                       collect ``(,,g ,,n)))
          ,(let ,(loop for g in gensyms for n in names collect `(,n ,g))
             ,@body)))))
