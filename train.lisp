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

    (mapcar #'(lambda (h) (setf (gethash h hypos) (expt h (- (get-alpha tr))))) hypos-lst)
    (setf (get-hypos tr) hypos)
    (normalize tr)))

(defmethod mean ((tr train))
  (let ((total 0)
        (hypos (get-hypos tr)))

    (maphash #'(lambda (h p) (setf total (+ total (* h p)))) hypos)
    total))
