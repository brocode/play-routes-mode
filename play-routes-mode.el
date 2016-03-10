;;; play-routes-mode.el --- Play Framework Routes File Support

;; Copyright (C) 2016 Maximilien Riehl, Patrick Haun

;; Author: M.Riehl <max@flatmap.ninja>, P.Haun <bomgar85@googlemail.com>
;; Version: 0.1
;; Package-Requires: ()
;; Keywords: play, scala
;; URL: https://github.com/brocode/play-routes-mode/

;;; Commentary:

;; This package provides basic support for the play routes file

;;; Code:


(defconst play-routes-mode-keywords '("GET" "POST" "DELETE" "PUT" "HEAD" "OPTIONS"))
(defconst play-routes-mode-keywords-regexp (regexp-opt play-routes-mode-keywords 'words))
(defconst play-routes-mode-path-variable-regex (rx ?/ (group (any ?: ?* ?$) (one-or-more (not (any whitespace ?/))))))
(defconst play-routes-mode-arg-variable-regex (rx
                                               (or ?, ?\( (seq ?, (zero-or-more whitespace)))
                                               (group (or lower upper) (zero-or-more alnum))
                                               (group (or ?: (seq (zero-or-more whitespace) ?=) ?\)))
                                              )
)

(defvar play-routes-mode-highlights
  `(
    (,play-routes-mode-path-variable-regex 1 font-lock-variable-name-face)
    (,play-routes-mode-arg-variable-regex 1 font-lock-variable-name-face)
    (,play-routes-mode-keywords-regexp . font-lock-keyword-face)
    ))

;;;###autoload
(define-derived-mode play-routes-mode prog-mode "PlayRoutes"
  "Major mode for Play Framework routes files."
  (setq font-lock-defaults '(play-routes-mode-highlights))
  (set (make-local-variable 'comment-start) "# ")
  (set (make-local-variable 'comment-start-skip) "#+ *")
)

(modify-syntax-entry ?# "<   " play-routes-mode-syntax-table)
(modify-syntax-entry ?\n ">   " play-routes-mode-syntax-table)

;;;###autoload
(add-to-list 'auto-mode-alist '("/routes\\'" . play-routes-mode))

(provide 'play-routes-mode)
;;; play-routes-mode.el ends here
