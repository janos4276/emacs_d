;;; init.el --- My emacs init.el
;;; Commentary:
;;; See http://tuhdo.github.io/emacs-tutor3.html
;;; Code:

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
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 83 :width normal)))))
