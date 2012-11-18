;; ruby + rinari

(setq exec-path (cons "/var/lib/gems/1.9.1/bin" exec-path))
(setenv "PATH" (concat "/var/lib/gems/1.9.1/bin:" (getenv "PATH")))

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

;; rspec default ouput with ansi color, make compilation work with it.
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; auto complete
;; Complete by C-c .
;;(add-hook 'ruby-mode-hook
;;          (lambda ()
;;            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

;; If you want to start completion automatically after inserting . and ::,
(add-hook 'ruby-mode-hook
          (lambda ()
            ;;(add-to-list 'ac-sources 'ac-source-rsense)
            (add-to-list 'ac-sources 'ac-source-yasnippet)))

;; stop completion automatically after "do", "end"
(add-hook 'ruby-mode-hook
          (lambda ()
            (make-local-variable 'ac-ignores)
            (add-to-list 'ac-ignores "end")
            (add-to-list 'ac-ignores "do")))
