# Commong Lisp Think Bayes
Martin Kersner, <m.kersner@gmail.com>

This repository contains examples from [Think Bayes](http://greenteapress.com/wp/think-bayes/) book written in Common Lisp.

## Requirements
cl-ml requires [asdf](https://gitlab.common-lisp.net/asdf/asdf) to be installed.

## Get code
```
git clone https://github.com/martinkersner/cl-think-bayes.git
```

## Chapter 1 - Bayes's Theorem
* [Cookie Problem](https://github.com/martinkersner/cl-think-bayes/blob/master/cookie-problem.lisp)
* [Monty Hall Problem](https://github.com/martinkersner/cl-think-bayes/blob/master/monty-hall-problem.lisp)

## Chapter 2 - Computational Statistics
### Cookie Problem
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
```common-lisp
(setf hypos '(A B C))
(setf m (make-instance 'monty :hypos hypos))
(update m 'B)
(print-solution m)
```

### M&M Problem
```common-lisp
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
```

## Chapter 3 - Estimation
### Dice
```common-lisp
(setf hypos '(4 6 8 12 20))
(setf d (make-instance 'dice :hypos hypos))
(mapcar #'(lambda (v)
            (update d v))
        '(6 8 7 7 5 4))
(print-solution d)
```
