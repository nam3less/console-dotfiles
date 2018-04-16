;;; private/nam3less/config.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; My doom configuration
;;; Code:
(setq-default doom-font (font-spec :family "Overpass Mono" :size 13))
(setq-default doom-line-numbers-style 'relative)

(setq-default flycheck-javascript-standard-executable "semistandard")

(when (eq system-type 'darwin)
  (setq mac-right-command-modifier nil)
  (setq-default url-using-proxy t
                url-proxy-services
                '(("http" . "192.168.1.254:8080")
                  ("https" . "192.168.1.254:8080")
                  ("ftp" . "192.168.1.254:8080"))))
;;; config.el ends here
