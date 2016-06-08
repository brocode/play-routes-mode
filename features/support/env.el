(require 'f)

(defvar play-routes-mode-support-path
  (f-dirname load-file-name))

(defvar play-routes-mode-features-path
  (f-parent play-routes-mode-support-path))

(defvar play-routes-mode-root-path
  (f-parent play-routes-mode-features-path))

(add-to-list 'load-path play-routes-mode-root-path)

(require 'play-routes-mode)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
