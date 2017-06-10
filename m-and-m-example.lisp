;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/10 

(setf options '((mix94
                 ((brown  30)
                  (yellow 20)
                  (red    20)
                  (green  10)
                  (orange 10)
                  (tan    10)))
               (mix96
                 ((brown  24)
                  (yellow 20)
                  (red    16)
                  (green  14)
                  (orange 13)
                  (tan    13)))))

(setf hypos '((A
                ((bag1 mix94)
                 (bag2 mix96)))
              (B
                ((bag1 mix96)
                 (bag2 mix94)))))

(setf m (make-instance 'm-and-m :options options
                                :hypos hypos))
(update m '(bag1 yellow))
(update m '(bag2 green))
(print-solution m)
