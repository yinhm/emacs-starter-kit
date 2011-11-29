
(require 'go-mode-load)

(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'tab-width) 2)))
