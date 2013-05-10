
(load "desktop") 
(desktop-save-mode 1)
;; (require 'tabbar)
;; (tabbar-mode)

;; auto fill
(setq fill-column 79)
(setq-default auto-fill-function 'do-auto-fill)

(setq tab-width 4)

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Platform
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linux specific
(when (eq system-type 'gnu/linux)
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

  ;; ispell dict
  ;; With emacs23.1 in ubuntu 10.10, you need to upgrade dictionaries-common to
  ;; 1.5.12 at least. See debbug # #591925
  (ispell-change-dictionary "en_US" t)
  (setq-default ispell-program-name "aspell")
  )


;; MacOS X specific
(when (eq system-type 'darwin)
  ;; key bindings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  (global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

  ;; Macports execute path
  ;;(add-to-list 'exec-path "/opt/local/bin")
  (setq exec-path (cons "/opt/local/bin" exec-path))
  (setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))

  ;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

  ;; ispell dict
  ;; port install aspell first
  ;;(setq-default ispell-program-name "aspell")
  ;;(ispell-change-dictionary "english" t)
  )
