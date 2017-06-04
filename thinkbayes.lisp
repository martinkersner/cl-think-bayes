;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04
;;;;
;;;; Common Lisp version of Think Bayes
;;;; https://github.com/AllenDowney/ThinkBayes

;;; PROBABILITY MASS FUNCTION
(defclass probability-mass-function ()
  ((values  :accessor get-values
            :initform (make-hash-table))))

;;; Originally called "set" in Python Think Bayes
(defgeneric set-value (pmf value)
  (:documentation ""))

(defmethod set-value ((pmf probability-mass-function) value)
  )

(defgeneric incr (pmf value increment)
  (:documentation ""))

(defmethod incr ((pmf probability-mass-function) value increment)
  )

(defgeneric normalize (pmf)
  (:documentation ""))

(defmethod normalize ((pmf probability-mass-function))
  )

(defgeneric prob (pmf prob)
  (:documentation ""))

(defmethod prob ((pmf probability-mass-function) value)
  )
