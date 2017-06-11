;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/12  

(setf hypos '(4 6 8 12 20))
(setf d (make-instance 'dice :hypos hypos))
(mapcar #'(lambda (v)
            (update d v))
        '(6 8 7 7 5 4))
(print-solution d)
