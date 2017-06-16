;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/16

(defun percentile (pmf percentage)
  (let ((p (/ percentage 100.0))
        (total 0)
        (val-prob (get-val-prob pmf))
        (val-percentile nil))

    (maphash #'(lambda (val prob) (if (< total p)
                                    (progn
                                    (incf total prob)
                                    (setf val-percentile val))))
             val-prob)

    val-percentile))
