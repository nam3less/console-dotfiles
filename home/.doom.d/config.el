;;;  -*- lexical-binding: t; -*-

;; projectile
(after! projectile
  (setq projectile-generic-command "find -L . -type f -print0"))

;; completion/company

(after! company
  (setq-default company-minimum-prefix-length 2))

(after! company-quickhelp
  (setq company-quickhelp-delay 0.4))

;; completion/ivy
(setq-default ivy-re-builders-alist
              '((t . ivy--regex-ignore-order)))

;; lang/javascript
(after! js2-mode
  (setq-default flycheck-javascript-standard-executable "semistandard"))

;; lang/org
(after! org
  (evil-org-set-key-theme '(navigation insert textobjects heading shift todo additional))
  (setq doom-line-number t)
  (map! :map org-mode-map
        :localleader
        :desc "Export" :n "e" #'org-export-dispatch))

; lang/tex
(map! :map LaTeX-mode-map
      :localleader
      (:desc "View line" :n "v" #'TeX-view)
      (:desc "Command on master" :n "c" #'TeX-command-master))

;;; config.el ends here
