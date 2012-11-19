;; yasnippet

(setq yas-path
      (concat dotfiles-dir "/vendor/yasnippet"))

(add-to-list 'load-path yas-path)

(require 'yasnippet)
(yas-global-mode 1)

(yas-load-directory
 (concat yas-path "/snippets"))


(require 'dropdown-list)
(setq yas-prompt-functions
      '(yas/dropdown-prompt
        yas/ido-prompt
        yas/x-prompt))
;; (setq yas/wrap-around-region 'cua)
