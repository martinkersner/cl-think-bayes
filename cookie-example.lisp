;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04

(setf hypos '((bowl1
                ((vanilla 0.75)
                 (chocolate 0.25)))
              (bowl2
                ((vanilla 0.5)
                 (chocolate 0.5)))))

(setf cp (make-instance 'cookie :hypos hypos))
(update cp 'vanilla)
(print-solution cp)
