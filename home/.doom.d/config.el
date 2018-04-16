;;;  -*- lexical-binding: t; -*-

;; projectile
(setq projectile-generic-command "find -L -type f -print0")

;; completion/company
(after! company-quickhelp
  (setq company-quickhelp-delay 0.2))

;; completion/ivy
(setq-default ivy-re-builders-alist
              '((t . ivy--regex-ignore-order)))

;; lang/javascript
(setq-default flycheck-javascript-standard-executable "semistandard")
