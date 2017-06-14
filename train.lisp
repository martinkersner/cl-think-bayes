;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/13

(defclass train (dice)
  ((hypos-lst :initarg :hypos)
   (hypos     :accessor get-hypos)
   (alpha     :initarg :alpha
              :accessor get-alpha)))

(defmethod initialize-instance :after ((tr train) &key)
  (let ((hypos-lst (slot-value tr 'hypos-lst))
        (hypos (make-hash-table)))

    (mapcar #'(lambda (h) (setf (gethash h hypos) (expt (/ 1 h) (get-alpha tr)))) hypos-lst)
    ;(maphash #'(lambda (h val-prob-lst) (set-value tr h 1)) hypos)
    (maphash #'(lambda (h val-prob-lst) (set-value tr h (expt (/ 1 h) (get-alpha tr)))) hypos)

    (setf (get-hypos tr) hypos)
    (normalize tr)))

(defmethod mean ((tr train))
  (let ((total 0)
        (hypos (get-val-prob tr)))

    (maphash #'(lambda (h p) (setf total (+ total (* h p)))) hypos)

    total))
