;; fonts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Platform
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linux specific
(when (eq system-type 'gnu/linux)
  (add-to-list 'default-frame-alist '(font . "Monaco-12"))

  (set-frame-font "Monaco-12")
  ;; (set-frame-font "Ubuntu Mono-13")

  (set-fontset-font (frame-parameter nil 'font)
                    'han '("Microsoft YaHei" . "unicode-bmp"))
  (set-fontset-font (frame-parameter nil 'font)
                    'unicode
                    '("DejaVu Sans Mono-12" . "unicode-bmp"))
  (set-fontset-font (frame-parameter nil 'font)
                    'han '("WenQuanYi Micro Hei" . "unicode-bmp"))

  )

;; MacOS X specific
(when (eq system-type 'darwin)
  (set-frame-font "Inconsolata-14")

  ;; Chinese fonts
  ;; Taken from: http://lidashuang.sinaapp.com/2012/11/%E6%8A%98%E8%85%BEemacs/
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Hiragino Sans GB")))
  )

(when (eq system-type 'windows-nt)
  ;; English fonts
  (set-frame-font "Consolas-14")
  
  ;; Chinese fonts
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      'han
                      '("Microsoft Yahei" . "unicode-bmp")))
  )
