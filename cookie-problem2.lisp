;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04

(defclass cookie-problem (probability-mass-function)
  ((hypos :accessor get-hypos
          :initarg :hypos)))

(defmethod initialize-instance :after ((cp cookie-problem) &key)
  (let ((hypos (get-hypos cp)))

    (maphash #'(lambda (h val-prob-lst) (set-value cp h 1)) hypos)
    (normalize cp)))

(defmethod likelihood ((cp cookie-problem) data hypo)
  (multiple-value-setq (h hypos-found) (gethash hypo (get-hypos cp)))
  (multiple-value-setq (d data-found) (gethash data h))

  d)

(defmethod update ((cp cookie-problem) data)
  (maphash #'(lambda (h val-prob-lst)
               (mult cp h (likelihood cp data h)))
           (get-hypos cp))
  
    (normalize cp))
