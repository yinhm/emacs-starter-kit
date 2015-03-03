;; golang mode
;;
;; Gocode
;; go get -u github.com/nsf/gocode
;; 
;; See https://github.com/nsf/gocode for usage

;; go get golang.org/x/tools/cmd/goimports
(setq gofmt-command "/home/yinhm/gopath/bin/goimports")

(require 'go-mode-autoloads)
(require 'go-autocomplete)
(require 'auto-complete-config)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)))
