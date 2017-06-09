;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/09 
;;;;
;;;; MONTY HALL PROBLEM
;;;; (description taken from Think Bayes (http://greenteapress.com/wp/think-bayes/)
;;;; Monty shows you three closed doors and tells you that there is a prize
;;;; behind each door: one prize is a car, the other two are less valuable
;;;; prizes like peanut butter and fake finger nails. The prizes are arranged
;;;; at random.
;;;; The object of the game is to guess which door has the car. If you guess
;;;; right, you get to keep the car.
;;;; You pick a door, which we will call Door A. We’ll call the other doors
;;;; B and C.
;;;; Before opening the door you chose, Monty increases the suspense by
;;;; opening either Door B or C, whichever does not have the car. (If the
;;;; car is actually behind Door A, Monty can safely open B or C, so he
;;;; chooses one at random.)
;;;; Then Monty offers you the option to stick with your original choice or
;;;; switch to the one remaining unopened door.
;;;; The question is, should you “stick” or “switch” or does it make no difference?
;;;; Monty chooses Door B and there is no car there.

(defparameter *pmf* (make-instance 'probability-mass-function))

;;; prior distribution
(set-value *pmf* 'A 0.33)
(set-value *pmf* 'B 0.33)
(set-value *pmf* 'C 0.33)

;;; applying likelihood
(mult *pmf* 'A 0.5)
(mult *pmf* 'B 0)
(mult *pmf* 'C 1)

(normalize *pmf*)

;;; it is better to switch the door
(print (prob *pmf* 'A))
(print (prob *pmf* 'B))
(print (prob *pmf* 'C))
