;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

(autoload 'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(add-hook 'espresso-mode-hook 'moz-minor-mode)
;;(add-hook 'espresso-mode-hook 'esk-paredit-nonlisp)
(add-hook 'espresso-mode-hook 'run-coding-hook)
(setq espresso-indent-level 2)

;; Run jslint on a file to check syntax and coding conventions.
(add-hook 'espresso-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (let ((file (file-name-nondirectory buffer-file-name)))
                   (concat "node /usr/local/lib/node/jslint/bin/jslint.js " file)))))


;;; Node.js must installed in your system
;;; change /usr/local of jslint path to your path.
(defun flymake-jslint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
         (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "node" (list (expand-file-name "/usr/local/lib/node/jslint/bin/jslint.js") local-file))))

(defun flymake-espresso-enable ()
  (push '(".+\\.js$" flymake-jslint-init) flymake-allowed-file-name-masks)
  (push '("^\\(.+\\)\\([[:digit:]]+\\) \\([[:digit:]]+\\),\\([[:digit:]]+\\): \\(.+\\)$"
          nil 3 4 5)
        flymake-err-line-patterns)
  (when (and buffer-file-name
             (file-writable-p
              (file-name-directory buffer-file-name))
             (file-writable-p buffer-file-name)
             (if (fboundp 'tramp-list-remote-buffers)
                 (not (subsetp
                       (list (current-buffer))
                       (tramp-list-remote-buffers)))
               t))
    (local-set-key (kbd "C-c d")
                   'flymake-display-err-menu-for-current-line)
    (flymake-mode t)))

(require 'flymake)
(add-hook 'espresso-mode-hook 'flymake-espresso-enable)


;; If you prefer js2-mode, use this instead:
;; (add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

;; (eval-after-load 'javascript
;;   '(progn (define-key javascript-mode-map "{" 'paredit-open-curly)
;;           (define-key javascript-mode-map "}" 'paredit-close-curly-and-newline)
;;           ;; fixes problem with pretty function font-lock
;;           (define-key javascript-mode-map (kbd ",") 'self-insert-command)
;;           (font-lock-add-keywords
;;            'javascript-mode `(("\\(function *\\)("
;;                              (0 (progn (compose-region (match-beginning 1)
;;                                                        (match-end 1) "ƒ")
;;                                       nil)))))))

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here
