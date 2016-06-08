;;; test-helper.el --- ensime-emacs: ERT Test helper

;; Copyright (C) 2016 play routes mode authors

(require 'f)
(require 'dash)

;;;;;;;;;;;;;;;;;;;;
;; variables
;;;;;;;;;;;;;;;;;;;;

(defvar play-routes-mode-emacs-test/test-path
  (f-dirname (f-this-file))
  "Path to tests directory.")

(defvar play-routes-mode-emacs-test/root-path
  (f-parent play-routes-mode-emacs-test/test-path)
  "Path to root directory.")

(add-to-list 'load-path play-routes-mode-emacs-test/root-path)
(add-to-list 'load-path play-routes-mode-emacs-test/test-path)

(require 'el-mock)
(eval-when-compile
    (require 'cl))

(require 'play-routes-mode)
