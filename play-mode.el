(defvar play-mode-hook nil)

(add-to-list 'auto-mode-alist '("/routes\\'" . play-mode))

(setq routes-keywords '("GET" "POST" "DELETE" "PUT" "HEAD" "OPTIONS"))
(setq routes-keywords-regexp (regexp-opt routes-keywords 'words))

(setq routes-highlights
     `(
        ("#.*" . font-lock-comment-face)
        (":[^ /]+" . font-lock-variable-name-face)
        ("\\([a-zA-Z][a-zA-Z0-9]*\\)\\(:\\|=\\)" 1 font-lock-variable-name-face)
        (,routes-keywords-regexp . font-lock-keyword-face)
))

(define-derived-mode play-mode fundamental-mode
  (setq font-lock-defaults '(routes-highlights))
    (setq mode-name "routes"))


(provide 'play-mode)
