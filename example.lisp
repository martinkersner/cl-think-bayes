;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04

(defparameter *pmf* (make-instance 'probability-mass-function))
(defparameter *dice-numbers* '(1 2 3 4 5 6))

(mapcar #'(lambda (v)
            (set-value *pmf* v (/ 1 6)))
        *dice-numbers*)

(print (get-val-prob *pmf*))

(mapcar #'(lambda (v)
            (incr *pmf* v 1))
        *dice-numbers*)

(print (get-val-prob *pmf*))

(normalize *pmf*)

(print (get-val-prob *pmf*))

(print (prob *pmf* 4))
