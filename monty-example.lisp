;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/09 

(setf hypos '(A B C))
(setf m (make-instance 'monty :hypos hypos))
(update m 'B)
(print-solution m)
