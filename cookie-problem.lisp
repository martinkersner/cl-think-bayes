;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/04
;;;;
;;;; COOKIE PROBLEM
;;;; (description taken from Think Bayes (http://greenteapress.com/wp/think-bayes/)
;;;; Suppose there are two bowls of cookies. Bowl 1 contains 30 vanilla cookies
;;;; and 10 chocolate cookies. Bowl 2 contains 20 of each. Now suppose you
;;;; choose one of the bowls at random and, without looking, select a cookie
;;;; at random. The cookie is vanilla. What is the probability that it came
;;;; from Bowl 1?

(defparameter *pmf* (make-instance 'probability-mass-function))

;;; prior distribution
(set-value *pmf* 'bowl1 0.5)
(set-value *pmf* 'bowl2 0.5)

;;; applying likelihood
(mult *pmf* 'bowl1 0.75)
(mult *pmf* 'bowl2 0.5)

(normalize *pmf*)

;;; the probability that cookie came from bowl 1 is 0.6
(print (prob *pmf* 'bowl1))
