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

(setq ac-dictionary-directories (concat dotfiles-dir "/vendor/auto-complete/dict"))

;; use C-n/C-p to select candidates
(define-key ac-completing-map "\C-n" 'ac-next)
(define-key ac-completing-map "\C-p" 'ac-previous)

;; start completion when 3 characters have been entered
;; (setq ac-auto-start 3)
;; never auto start
(setq ac-auto-start nil)

;; use tab to trigger auto-complete
(ac-set-trigger-key "TAB")

