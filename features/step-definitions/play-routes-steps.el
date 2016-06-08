;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.

(When "^I open a routes file"
      (lambda ()
        (find-file (make-temp-file "routes" nil "routes"))))
