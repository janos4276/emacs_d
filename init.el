;;; init.el --- My emacs init.el
;;; Commentary:
;;; See http://tuhdo.github.io/emacs-tutor3.html
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; --------------------------
;; No annoying backup files -
;; --------------------------
(setq make-backup-files nil backup-inhibited t)

;; -------------------
;; My custom modules -
;; -------------------
(add-to-list 'load-path "~/.emacs.d/custom")

;; -----------------
;; Load my modules -
;; -----------------
(require 'custom-packages)
(require 'customise-ui)
(require 'customise-editing)
(require 'customise-c)
(require 'customise-python)
(require 'customise-org)

;; -------
;; Tramp -
;; -------
;; (setq tramp-default-method "ssh")
;; (setq tramp-copy-size-limit -1)

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(org-agenda-files
   (quote
    ("~/notes/cpp_tips_and_tricks_practices.org" "~/notes/las-general.org" "~/notes/adelost_server.org" "~/notes/adelost_sensor.org" "~/notes/arena.org")))
 '(package-selected-packages
   (quote
    (solarized-theme smartparens python-x python-mode projectile markdown-toc markdown-preview-eww markdown-mode+ markdown-mode flycheck-pos-tip flycheck-irony flycheck highlight-symbol helm-gtags helm-core helm epl company-lua company-irony-c-headers company-irony company-c-headers company-quickhelp company cmake-font-lock cmake-mode auto-org-md async)))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 83 :width normal)))))
