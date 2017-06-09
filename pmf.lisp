;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04
;;;;
;;;; Common Lisp version of Think Bayes
;;;; https://github.com/AllenDowney/ThinkBayes
;;;;
;;;; PROBABILITY MASS FUNCTION

(defclass probability-mass-function ()
  ((values :accessor get-val-prob
           :initform (make-hash-table :test 'equal))))

;;; Originally called "set" in Think Bayes
(defgeneric set-value (pmf value probability)
  (:documentation ""))

(defmethod set-value ((pmf probability-mass-function) value probability)
  (setf (gethash value (get-val-prob pmf)) probability))

(defgeneric incr (pmf value increment)
  (:documentation ""))

(defmethod incr ((pmf probability-mass-function) value increment)
  (multiple-value-setq (prob pred) (gethash value (get-val-prob pmf))) 
  (if pred
    (setf (gethash value (get-val-prob pmf)) (+ prob increment))))

(defgeneric mult (pmf value multiplier)
  (:documentation ""))

(defmethod mult ((pmf probability-mass-function) value multiplier)
  (multiple-value-setq (prob pred) (gethash value (get-val-prob pmf))) 
  (if pred
    (setf (gethash value (get-val-prob pmf)) (* prob multiplier))))

(defgeneric total (pmf)
  (:documentation ""))

(defmethod total ((pmf probability-mass-function))
  (let ((prob-lst '()))

    (maphash #'(lambda (val prob) (push prob prob-lst)) (get-val-prob pmf))
    (apply '+ prob-lst)))

(defgeneric normalize (pmf &optional fraction)
  (:documentation "fraction: what the total should be after normalization"))

(defmethod normalize ((pmf probability-mass-function) &optional (fraction 1))
  (let* ((prob-sum (total pmf))
         (factor (/ fraction prob-sum)))

    (maphash #'(lambda (val prob)
                 (setf (gethash val (get-val-prob pmf)) (* prob factor)))
             (get-val-prob pmf))))

(defgeneric prob (pmf prob)
  (:documentation ""))

(defmethod prob ((pmf probability-mass-function) value)
  (multiple-value-setq (prob pred) (gethash value (get-val-prob pmf)))

  (if pred
    prob 
    nil))
