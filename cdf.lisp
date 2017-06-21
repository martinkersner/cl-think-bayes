;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/21 
;;;;
;;;; Common Lisp version of Think Bayes
;;;; https://github.com/AllenDowney/ThinkBayes
;;;;
;;;; CUMULATIVE DISTRIBUTION FUNCTION

(defclass cumulative-distribution-function ()
  ((values :accessor get-percentile
           :initform (make-hash-table :test 'equal))
   (pmf    :accessor get-pmf
           :initarg :pmf)))

(defmethod initialize-instance :after ((cdf cumulative-distribution-function) &rest args)
  (let ((cum-prob 0))
           
    (maphash #'(lambda (v p) (progn
                               (incf cum-prob p)
                               (setf (gethash v (get-percentile cdf)) cum-prob)))
             (get-pmf cdf))))

(defgeneric percentile (cdf cumulative-distribution-function)
  (:documentation ""))

(defmethod percentile ((cdf cumulative-distribution-function) p)
  (block res
         (maphash #'(lambda (val cum-prob)
                      (if (<= cum-prob p)
                        (return-from res (1+ val))))

                  (get-percentile cdf))

         res))
