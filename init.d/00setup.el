
(load "desktop") 
(desktop-save-mode 1)
;; (require 'tabbar)
;; (tabbar-mode)

;; auto fill
(setq default-fill-column 79)
(setq-default auto-fill-function 'do-auto-fill)

;; color theme
(require 'color-theme-textmate2)
(color-theme-textmate2)

;; Removing Annoyances
(setq kill-ring-max 200)
(setq scroll-margin 3
            scroll-conservatively 10000)
;; disallow creation of new lines when you press the "arrow-down key" at end of the buffer.
(setq next-line-add-newlines nil)

;; make "Ctrl-k" kills an entire line if the cursor is at the beginning of line
(setq kill-whole-line t)

(require 'align)
(setq make-backup-files nil)

(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; ispell dict
;; With emacs23.1 in ubuntu 10.10, you need to upgrade dictionaries-common to
;; 1.5.12 at least. See debbug # #591925
(ispell-change-dictionary "en_US" t)
(setq-default ispell-program-name "aspell")
