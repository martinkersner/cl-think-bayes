;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/12  

(defclass dice (suite)
  ((hypos-lst :initarg :hypos)
   (hypos     :accessor get-hypos)))

(defmethod initialize-instance :after ((d dice) &key)
  (let ((hypos-lst (slot-value d 'hypos-lst))
        (hypos (make-hash-table)))

    (mapcar #'(lambda (v) (setf (gethash v hypos) 1)) hypos-lst)

    (maphash #'(lambda (hypo val-prob-lst) (set-value d hypo 1)) hypos)
    (setf (get-hypos d) hypos)

    (normalize d)))

(defmethod likelihood ((d dice) data hypo)
  (if (< hypo data)
    0
    (/ 1 hypo)))
