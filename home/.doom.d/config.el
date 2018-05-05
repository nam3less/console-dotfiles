;;;  -*- lexical-binding: t; -*-

;; projectile
(after! projectile
  (setq projectile-generic-command "find -L . -type f -print0"))

;; completion/company
(after! company-quickhelp
  (setq company-quickhelp-delay 0.4))

;; completion/ivy
(setq-default ivy-re-builders-alist
              '((t . ivy--regex-ignore-order)))

;; lang/javascript
(setq-default flycheck-javascript-standard-executable "semistandard")

; lang/tex
(map! :map LaTeX-mode-map
      :localleader
      (:desc "View line" :n "v" #'TeX-view)
      (:desc "Command on master" :n "c" #'TeX-command-master))
;;; config.el ends here
