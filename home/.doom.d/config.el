;;;  -*- lexical-binding: t; -*-

;; completion/company
(after! company
  (setq-default company-minimum-prefix-length 2))

(after! company-quickhelp
  (setq-default company-quickhelp-delay 0.3))

;; lang/js
(after! js2-mode
  (setq-default flycheck-javascript-standard-executable "semistandard"))

;; lang/org
(after! org
  (evil-org-set-key-theme '(navigation insert textobjects heading shift todo additional))
  (setq doom-line-number t)
  (map! :map org-mode-map
        :localleader
        :desc "Export" :n "e" #'org-export-dispatch))

;; projectile
(after! projectile
  (setq-default projectile-generic-command "find -L . -type f -print0"))

;;; config.el ends here
