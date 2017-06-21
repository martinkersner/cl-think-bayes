# Common Lisp Think Bayes
Martin Kersner, <m.kersner@gmail.com>

This repository contains examples from [Think Bayes](http://greenteapress.com/wp/think-bayes/) book written in Common Lisp.

## Requirements
Source code from this repository requires [asdf](https://gitlab.common-lisp.net/asdf/asdf) to be installed.

## Get code
```
git clone https://github.com/martinkersner/cl-think-bayes.git
```

## Initialization
Before running any code from this repository you must run following code.
```common-lisp
(load "init")
```

## Chapter 1 - Bayes's Theorem
* [Cookie Problem](https://github.com/martinkersner/cl-think-bayes/blob/master/cookie-problem.lisp)
* [Monty Hall Problem](https://github.com/martinkersner/cl-think-bayes/blob/master/monty-hall-problem.lisp)

## Chapter 2 - Computational Statistics
### Cookie Problem
[solution](https://github.com/martinkersner/cl-think-bayes/blob/master/cookie.lisp), [example](https://github.com/martinkersner/cl-think-bayes/blob/master/cookie-example.lisp)
```common-lisp
(setf hypos '((bowl1
                ((vanilla 0.75)
                 (chocolate 0.25)))
              (bowl2
                ((vanilla 0.5)
                 (chocolate 0.5)))))

(setf cp (make-instance 'cookie :hypos hypos))
(update cp 'vanilla)
(print-solution cp)
```
### Monty Hall Problem
[solution](https://github.com/martinkersner/cl-think-bayes/blob/master/monty.lisp), [example](https://github.com/martinkersner/cl-think-bayes/blob/master/monty-example.lisp)
```common-lisp
(setf hypos '(A B C))
(setf m (make-instance 'monty :hypos hypos))
(update m 'B)
(print-solution m)
```

### M&M Problem
[solution](https://github.com/martinkersner/cl-think-bayes/blob/master/m-and-m.lisp), [example](https://github.com/martinkersner/cl-think-bayes/blob/master/m-and-m-example.lisp)
```common-lisp
(setf options '((mix94
                 ((brown  30)
                  (yellow 20)
                  (red    20)
                  (green  10)
                  (orange 10)
                  (tan    10)
                  (blue    0)))

               (mix96
                 ((brown  13)
                  (yellow 14)
                  (red    13)
                  (green  20)
                  (orange 16)
                  (tan    0)
                  (blue   24)))))

(setf m (make-instance 'm-and-m :options options
                                :hypos hypos))
(update m '(bag1 yellow))
(update m '(bag2 green))
(print-solution m)
```

## Chapter 3 - Estimation
### Dice Problem
[solution](https://github.com/martinkersner/cl-think-bayes/blob/master/dice.lisp), [example](https://github.com/martinkersner/cl-think-bayes/blob/master/dice-example.lisp)
```common-lisp
(setf hypos '(4 6 8 12 20))
(setf d (make-instance 'dice :hypos hypos))
(mapcar #'(lambda (v)
            (update d v))
        '(6 8 7 7 5 4))
(print-solution d)
```

### Locomotive Problem
[solution](https://github.com/martinkersner/cl-think-bayes/blob/master/train.lisp), [example](https://github.com/martinkersner/cl-think-bayes/blob/master/train-example.lisp)
```common-lisp

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
```
