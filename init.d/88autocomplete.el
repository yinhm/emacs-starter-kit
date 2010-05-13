;; auto-complete-setup.el
;;
;; Turn on and configure auto-complete
;;
;; Mamading Ceesay, 2010-02-17
;;
;; http://github.com/evangineer/aquamacs-emacs-starter-kit

;; add auto-complete to load path
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auto-complete"))
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; use C-n/C-p to select candidates
(define-key ac-completing-map "\C-n" 'ac-next)
(define-key ac-completing-map "\C-p" 'ac-previous)

;; start completion when 3 characters have been entered
;; (setq ac-auto-start 3)
;; never auto start
(setq ac-auto-start nil)

;; use tab to trigger auto-complete
(ac-set-trigger-key "TAB")

;; Complete by C-c .
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

;; If you want to start completion automatically after inserting . and ::,
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; stop completion automatically after "do", "end"
(add-hook 'ruby-mode-hook
          (lambda ()
            (make-local-variable 'ac-ignores)
            (add-to-list 'ac-ignores "end")
            (add-to-list 'ac-ignores "do")))
