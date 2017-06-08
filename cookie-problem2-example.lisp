;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04

(load "cookie-problem2")

(setq bowl1 (make-hash-table))
(setf (gethash 'vanilla   bowl1) 0.75)
(setf (gethash 'chocolate bowl1) 0.25)

(setq bowl2 (make-hash-table))
(setf (gethash 'vanilla   bowl2) 0.5)
(setf (gethash 'chocolate bowl2) 0.5)

(setq hypos (make-hash-table))
(setf (gethash 'bowl1 hypos) bowl1)
(setf (gethash 'bowl2 hypos) bowl2)

(setf cp (make-instance 'cookie-problem :hypos hypos))
(update cp 'vanilla)
(print (get-val-prob cp))
