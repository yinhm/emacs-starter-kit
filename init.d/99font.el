;; fonts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Platform
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linux specific
(when (eq system-type 'gnu/linux)
  (add-to-list 'default-frame-alist '(font . "Monaco-10"))

  (set-default-font "Monaco-10")
  (set-fontset-font (frame-parameter nil 'font)
                    'unicode
                    '("DejaVu Sans Mono-10" . "unicode-bmp"))
  (set-fontset-font (frame-parameter nil 'font)
                    'han '("Microsoft YaHei" . "unicode-bmp"))
  (set-fontset-font (frame-parameter nil 'font)
                    'han
                    '("SimSun" . "unicode-bmp"))
  )

;; MacOS X specific
(when (eq system-type 'darwin)
  (set-frame-font "Inconsolata-14")
  (set-fontset-font
   (frame-parameter nil 'font)
   'han
   (font-spec :family "Hiragino Sans GB" ))
  )
