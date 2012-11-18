;; fonts

;;(set-face-attribute 'default nil :font "Inconsolata-14")
;; specify a unicode font : MENLO (forced normal)
;;(set-fontset-font "fontset-default" 'unicode "-apple-Menlo-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(set-frame-font "Inconsolata-14`")
(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "Hiragino Sans GB" ))
