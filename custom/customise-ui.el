;;; customise-ui.el --- My emacs ui customisations
;;; Commentary:
;;; Code:

(provide 'customise-ui)

;; ------------------------------------------------
;; Get rid of the tool bar. It sucks my left ball -
;; ------------------------------------------------
(tool-bar-mode -1)

;; ---------------------------------------------------
;; Get rid of the scroll bar. It sucks my right ball -
;; ---------------------------------------------------
(scroll-bar-mode -1)

;; --------------------------
;; Show me the line numbers -
;; --------------------------
(global-linum-mode 1)

;; -------
;; Theme -
;; -------
(load-theme 'solarized-dark t)
(setq x-underline-at-descent-line t)

;; ----------
;; Set font -
;; ----------
;; (set-face-attribute 'default nil :font "Droid Sans Mono-8" )
;; (setq default-frame-alist '((font . "Source Code Pro Regular-8")))
;; (set-face-attribute 'italic
;;                    : family "Droid Serif Italic-8")

;; -----------------------
;; Funny startup message -
;; -----------------------
(setq inhibit-startup-message t)
(defun emacs-reloaded ()
  (animate-string (concat ";; Initialization successful, welcome to " (substring (emacs-version) 0 16) ".") 0 0)
  (newline-and-indent)
  (newline-and-indent))
(add-hook 'after-init-hook 'emacs-reloaded)

;; -----------------------
;; Display time and date -
;; -----------------------
(setq display-time-day-and-date t display-time-24hr-format t)
(display-time)

;; -----------------------------
;; Show line number and column -
;; -----------------------------
(line-number-mode 1)
(column-number-mode 1)

;; ----------------------------
;; Show estimate of file size -
;; ----------------------------
(size-indication-mode t)

;; -------------------------------------------
;; Makes things a little bit more consistent -
;; -------------------------------------------
(fset 'yes-or-no-p 'y-or-n-p)

;; -------------------
;; Map mouse buttons -
;; -------------------
;; (global-set-key [(mouse-8)]  'previous-buffer)
;; (global-set-key [(mouse-9)]  'next-buffer)
;; (global-set-key [(mouse-10)] 'mouse-yank-primary)
;; (global-unset-key [(mouse-2)])

;;; customise-ui.el ends here
