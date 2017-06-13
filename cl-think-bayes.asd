;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2017/06/09 

(defpackage #:cl-think-bayes
  (:use :cl :asdf))

(in-package :cl-think-bayes)

(asdf:defsystem cl-think-bayes
  :name    "cl-think-bayes"
  :version "0.1"
  :author  "Martin Kersner, <m.kersner@gmail.com>"
  :long-description "Common Lisp version of Think Bayes"
  :defsystem-depends-on (:asdf-package-system)
  :components ((:file "pmf")
                            (:file "suite")
                            (:file "monty")
                            (:file "cookie")
                            (:file "m-and-m")
                            (:file "dice")
                            (:file "train")))
