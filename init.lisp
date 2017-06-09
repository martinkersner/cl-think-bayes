;;;; Martin Kersner, m.kersner@gmail.com
;;;; 2016/09/16

(push (namestring (ext:cd)) asdf:*central-registry*)

(asdf:load-system :cl-think-bayes)
