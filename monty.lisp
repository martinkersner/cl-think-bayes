;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/09 

(defclass monty (suite)
  ((hypos-lst :initarg :hypos)
   (hypos     :accessor get-hypos)))

(defmethod initialize-instance :after ((m monty) &key)
  (let ((hypos-lst (slot-value m 'hypos-lst))
        (hypos (make-hash-table)))

    (mapcar #'(lambda (h) (setf (gethash h hypos) 1)) hypos-lst)
    (maphash #'(lambda (hypo val-prob-lst) (set-value m hypo 1)) hypos)
    (setf (get-hypos m) hypos)
    (normalize m))
  )

(defmethod likelihood ((m monty) data hypo)
  (if (eq data hypo)
    0
    (if (eq hypo 'A)
      0.5
      1)))
