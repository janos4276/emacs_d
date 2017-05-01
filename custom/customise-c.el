;;; customise-c.el --- My c customisations
;;; Commentary:
;;; Code:

(provide 'customise-c)

(require 'cc-mode)
;; Let's start with BSD and go from there
(setq c-default-style "bsd"
      c-basic-offset 4)

(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)

;; Irony
(require 'company-irony-c-headers)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(setq irony--compile-options
      '("-std=c++11"))

(defun irony--check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun irony--indent-or-complete ()
  "Indent or Complete."
  (interactive)
  (cond ((and (not (use-region-p))
              (irony--check-expansion))
         (message "complete")
         (company-complete-common))
        (t
         (message "indent")
         (call-interactively 'c-indent-line-or-region))))

(defun irony-mode-keys ()
  "Modify keymaps used by `irony-mode'."
  (local-set-key (kbd "TAB") 'irony--indent-or-complete)
  (local-set-key [tab] 'irony--indent-or-complete))
(add-hook 'c-mode-common-hook 'irony-mode-keys)

;; Flycheck
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; -------------------------------------------
;; Use Clang and company for auto-completion -
;; -------------------------------------------
;; (setq company-backends
;;      (delete 'company-semantic company-backends))
;; (define-key c-mode-map   [(control /)] 'company-clang)
;; (define-key c++-mode-map [(control /)] 'company-clang)

;; -----------------------------
;; Auto-completion for headers -
;; requires company-c-headers  -
;; -----------------------------
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9")

;;; customise-c.el ends here
