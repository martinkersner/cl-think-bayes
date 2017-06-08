;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04

(defclass cookie-problem (probability-mass-function)
  ((hypos-lst :initarg :hypos)
   (hypos     :accessor get-hypos)))

(defmethod initialize-instance :after ((cp cookie-problem) &key)
  (let ((hypos-lst (slot-value cp 'hypos-lst))
        (hypos (make-hash-table))
        (hypos-part nil))

    (mapcar #'(lambda (hypo) (progn
                            (setq hypos-part (make-hash-table))
                            (mapcar #'(lambda (d)
                                        (setf (gethash (car d) hypos-part) (cadr d)))
                                    (cadr hypo))
                            (setf (gethash (first hypo) hypos) hypos-part)))
            hypos-lst)

    (maphash #'(lambda (hypo val-prob-lst) (set-value cp hypo 1)) hypos)
    (setf (get-hypos cp) hypos)

    (normalize cp)))

(defmethod likelihood ((cp cookie-problem) data hypo)
  (multiple-value-setq (h hypos-found) (gethash hypo (get-hypos cp)))
  (multiple-value-setq (prob prob-found) (gethash data h))

  prob)

(defmethod update ((cp cookie-problem) data)
  (maphash #'(lambda (h val-prob-lst)
               (mult cp h (likelihood cp data h)))
           (get-hypos cp))
  
    (normalize cp))
