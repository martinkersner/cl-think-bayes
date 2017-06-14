;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/13

(defun iota-rec (lst val lower-limit)
  (if (>= val lower-limit)
    (iota-rec (push val lst) (1- val) lower-limit)
    lst))

(defun iota (upper-limit &optional (start 0))
  (iota-rec nil (+ (1- upper-limit) start) start))

(setf upper-bound '(500 1000 2000))
(setf alpha 1)

(mapcar #'(lambda (upper) (progn
                            (setf hypos (iota upper 1))
                            (setf tr (make-instance 'train
                                                    :hypos hypos
                                                    :alpha alpha))
                            
                            (setf observations '(30 60 90))
                            (mapcar #'(lambda (v) (update tr v)) observations)
                            (print (mean tr))))
        upper-bound)
