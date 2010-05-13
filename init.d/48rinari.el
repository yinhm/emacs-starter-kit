;; ruby + rinari

(setq exec-path (cons "/var/lib/gems/1.8/bin" exec-path))
(setenv "PATH" (concat "/var/lib/gems/1.8/bin:" (getenv "PATH")))

(add-hook 'ruby-mode-hook
          (lambda ()
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (require 'ruby-align)))

(setq ruby-insert-encoding-magic-comment nil)

(setq rinari-tags-file-name "TAGS")

;; ruby block --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle 'overlay)

;; ruby test mode
(require 'ruby-test-mode)
