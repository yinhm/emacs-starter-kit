;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

;; NB: js-mode is part of Emacs since version 23.2 (with an alias
;; javascript-mode). It is derived and updated from Espresso mode.

(defvar esk-js-mode-hook nil)
(defun run-esk-js-mode-hook ()
  (run-hooks 'esk-js-mode-hook))

(defmacro esk-configure-javascript (name)
  (let ((sym (intern name))
        (mode (intern (concat name "-mode")))
        (hook (intern (concat name "-mode-hook")))
        (keymap (intern (concat name "-mode-map")))
        (indent (intern (concat name "-indent-level"))))
    `(progn
       (autoload ',mode ,name ,(concat "Start " name "-mode") t)
       (add-to-list 'auto-mode-alist '("\\.js$" . ,mode))
       (add-to-list 'auto-mode-alist '("\\.json$" . ,mode))
       (add-hook ',hook 'moz-minor-mode)
       (add-hook ',hook 'esk-paredit-nonlisp)
       (add-hook ',hook 'run-coding-hook)
       (add-hook ',hook 'run-esk-js-mode-hook)
       (setq ,indent 2)

       (eval-after-load ',sym
         '(progn (define-key ,keymap "{" 'paredit-open-curly)
                 (define-key ,keymap "}" 'paredit-close-curly-and-newline)
                 (define-key ,keymap (kbd ",") 'self-insert-command))))))

(defun pretty-functions ()
  (font-lock-add-keywords
   nil `(("\\(function *\\)("
          (0 (progn (compose-region (match-beginning 1)
                                    (match-end 1) "ƒ")
                    nil))))))
(add-hook 'esk-js-mode-hook 'pretty-functions)

(if (< (string-to-number emacs-version) 23.2)
    (esk-configure-javascript "espresso")
  (esk-configure-javascript "js"))


;; Run jslint on a file to check syntax and coding conventions.
(add-hook 'esk-js-mode-hook
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

(defun flymake-jsmode-enable ()
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
(add-hook 'esk-js-mode-hook 'flymake-jsmode-enable)

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here
