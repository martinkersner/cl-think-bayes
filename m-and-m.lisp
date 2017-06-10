;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/10 

(defclass m-and-m (suite)
  ((hypos-lst   :initarg :hypos)
   (hypos       :accessor get-hypos)
   (options-lst :initarg :options)
   (options     :accessor get-options)))

(defmethod initialize-instance :after ((m m-and-m) &key)
  (labels ((process-hash (hash-lst)
                         (let ((hash-part nil)
                               (hash (make-hash-table)))
                           (mapcar #'(lambda (h) (progn
                                                    (setq hash-part (make-hash-table))
                                                    (mapcar #'(lambda (d)
                                                                (setf (gethash (car d) hash-part) (cadr d)))
                                                            (cadr h))
                                                    (setf (gethash (first h) hash) hash-part)))
                                   hash-lst)
                           hash)))

    (let ((hypos-lst (slot-value m 'hypos-lst))
          (hypos nil)
          (options-lst (slot-value m 'options-lst))
          (options nil))

      (setf hypos (process-hash hypos-lst))
      (setf options (process-hash options-lst))

      (maphash #'(lambda (hypo val-prob-lst) (set-value m hypo 1)) hypos)

      (setf (get-hypos m) hypos)
      (setf (get-options m) options)

      (normalize m))))

(defmethod likelihood ((m m-and-m) data hypo)
  (let ((bag   (car data))
        (color (cadr data)))

    (multiple-value-setq (h found) (gethash hypo (get-hypos m)))
    (multiple-value-setq (mix-type found) (gethash bag h))
    (multiple-value-setq (color-hash found) (gethash mix-type (get-options m)))
    (multiple-value-setq (prob found) (gethash color color-hash))
  
  prob))
