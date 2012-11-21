
;; ===============================================================
;; protobuf

;; (require 'protobuf-mode)
;; (add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))



;; ===============================================================
;; racket 
;; (require 'quack)

;; (setq quack-default-program "racket")
;; (setq quack-run-scheme-always-prompts-p nil)



;; ===============================================================
;; ;; Arc support
;; ;; from http://codangaems.blogspot.com/2008/03/arc-emacs.html
;; (autoload 'run-arc "inferior-arc"
;;   "Run an inferior Arc process, input and output via buffer *arc*.")
;; (autoload 'arc-mode "arc"
;;   "Major mode for editing Arc." t)
;; (add-to-list 'auto-mode-alist '("\\.arc$" . arc-mode))

;; ;; breaks in emacs when running with rlwrap

;; (setq arc-program-name "~/sources/arc/arc.sh --no-rl")


;; ;; Make Arc REPL prompt read-only,
;; (add-hook 'inferior-arc-mode-hook
;;        (lambda ()
;;          (set (make-local-variable 'comint-use-prompt-regexp) t)
;;          (set (make-local-variable 'comint-prompt-read-only) t)))


;; parenface for parenthesis dimming 
;; (add-hook 'arc-mode-hook
;;          (paren-face-add-support arc-font-lock-keywords-2))
;; (add-hook 'arc-interaction-mode-hook
;;          (paren-face-add-support arc-font-lock-keywords-2))

;; paredit
;; (add-hook 'arc-mode-hook (lambda () (paredit-mode +1)))





;; ===============================================================
;; (require 'dart-mode)


;; ===============================================================
;; DotNet
;; (require 'csharp-mode)
;; (setq auto-mode-alist
;;       (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))




;; ===============================================================
;; Scala
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/scala-mode"))
;; (require 'scala-mode-auto)

;; (setq yas/my-directory (concat dotfiles-dir "/vendor/scala-mode/contrib/yasnippet/snippets")
;;       (yas/load-directory yas/my-directory))

;; (add-hook 'scala-mode-hook
;;           '(lambda ()
;;              (yas/minor-mode-on)))



;; ===============================================================
;; scss
;; (autoload 'scss-mode "scss-mode")
;; (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
