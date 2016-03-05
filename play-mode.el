;;; play-mode.el --- Play Framework Integration

;; Copyright (C) 2016 Maximilien Riehl, Patrick Haun

;; Author: M.Riehl <max@flatmap.ninja>, P.Haun <bomgar85@googlemail.com>
;; Version: 0.1
;; Package-Requires: ()
;; Keywords: play, scala
;; URL: https://github.com/brocode/play-mode/

;;; Commentary:

;; This package provides basic support for the play framework

;;; Code:


(defvar play-mode-routes-keywords '("GET" "POST" "DELETE" "PUT" "HEAD" "OPTIONS"))
(defvar play-mode-routes-keywords-regexp (regexp-opt play-mode-routes-keywords 'words))

(defvar play-mode-routes-highlights
  `(
    (":[^ /]+" . font-lock-variable-name-face)
    ("\\([a-zA-Z][a-zA-Z0-9]*\\)\\(:\\|=\\)" 1 font-lock-variable-name-face)
    (,play-mode-routes-keywords-regexp . font-lock-keyword-face)
    ))

;;;###autoload
(define-derived-mode play-routes-mode fundamental-mode " PlayRoutes"
  "Major mode for Play Framework routes files."
  (setq font-lock-defaults '(play-mode-routes-highlights)))

(modify-syntax-entry ?# "<   " play-routes-mode-syntax-table)
(modify-syntax-entry ?\n ">   " play-routes-mode-syntax-table)

;;;###autoload
(add-to-list 'auto-mode-alist '("/routes\\'" . play-routes-mode))

(provide 'play-mode)
;;; play-mode.el ends here
