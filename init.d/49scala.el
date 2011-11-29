(add-to-list 'load-path (concat dotfiles-dir "/vendor/scala-mode"))
(require 'scala-mode-auto)

;; (setq yas/my-directory (concat dotfiles-dir "/vendor/scala-mode/contrib/yasnippet/snippets")
;;       (yas/load-directory yas/my-directory))

(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)))
