;; (require 'flymake)
;; (require 'js-beautify)

;; ;; Run jslint on a file to check syntax and coding conventions.
;; (add-hook 'esk-js-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (let ((file (file-name-nondirectory buffer-file-name)))
;;                    (concat "jslint --indent=2 " file)))))

;; ;;; Node.js must installed in your system
;; ;;; change /usr/local of jslint path to your path.

;; (defcustom flymake-jslint-arguments
;;   (list "--indent=2")
;;   "JSLint arguments to invoke syntax checking.")

;; (defun flymake-jslint-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		     'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;; 		      temp-file
;; 		      (file-name-directory buffer-file-name))))
;;     (list "jslint-emacs" (append flymake-jslint-arguments (list local-file)))))

;; (defun flymake-jslint-enable ()
;;   (push '(".+\\.js$" flymake-jslint-init) flymake-allowed-file-name-masks)
;;   (push '("#\\([[:digit:]]+\\) \\(.+\\) => \\(.+\\) // Line \\([[:digit:]]+\\), Pos \\([[:digit:]]+\\)$"
;;           nil 4 5 2)
;;         flymake-err-line-patterns)
;;   (when (and buffer-file-name
;;              (file-writable-p
;;               (file-name-directory buffer-file-name))
;;              (file-writable-p buffer-file-name)
;;              (if (fboundp 'tramp-list-remote-buffers)
;;                  (not (subsetp
;;                        (list (current-buffer))
;;                        (tramp-list-remote-buffers)))
;;                t))
;;     (local-set-key (kbd "C-c d")
;;                    'flymake-display-err-menu-for-current-line)
;;     (flymake-mode t)))

;; (add-hook 'esk-js-mode-hook 'flymake-jslint-enable)
