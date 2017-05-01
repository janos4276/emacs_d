;;; customise-org.el --- My org customisations
;;; Commentary:
;;; Code:

(provide 'customise-org)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
