;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/09 

(defclass suite (probability-mass-function) ())

(defmethod update ((s suite) data)
  (maphash #'(lambda (h prob-val-lst)
               (mult s h (likelihood s data h)))
           (get-hypos s))
  
  (normalize s))
