;;; custom-packages.el --- My emacs custom packages
;;; Commentary:
;;; See http://tuhdo.github.io/emacs-tutor3.html
;;; Code:

(provide 'custom-packages)

;; --------------------------------------------------
;; MELPA: Milkypostman’s Emacs Lisp Package Archive -
;; --------------------------------------------------
(require 'package)

(setq package-archives '(("gnu"          . "http://elpa.gnu.org/packages/")
			 ("melpa"        . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

;; -------------------------------
;; Pin the packages that we want -
;; -------------------------------
(setq package-pinned-packages
      '((async                   . "melpa-stable")
        (auto-org-md             . "melpa")
        (cmake-mode              . "melpa-stable")
        (cmake-font-lock         . "melpa")
        (company                 . "melpa")
        (company-quickhelp       . "melpa")
        (company-c-headers       . "melpa")
        (company-irony           . "melpa")
        (company-irony-c-headers . "melpa")
        (company-lua             . "melpa")
        (dash                    . "melpa-stable")
        (docker-compose-mode     . "melpa-stable")
        (dockerfile-mode         . "melpa-stable")
        (epl                     . "melpa-stable")
        (groovy-mode             . "melpa-stable")
        (helm                    . "melpa-stable")
        (helm-core               . "melpa-stable")
        (helm-gtags              . "melpa-stable")
        (helm-projectile         . "melpa-stable")
        (highlight-symbol        . "melpa-stable")
        (flycheck                . "melpa")
        (flycheck-irony          . "melpa")
        (flycheck-pos-tip        . "melpa")
        (let-alist               . "gnu")
        (markdown-mode           . "melpa")
        (markdown-mode+          . "melpa")
        (markdown-preview-eww    . "melpa")
        (markdown-toc            . "melpa")
        (org                     . "gnu")
        (pkg-info                . "melpa-stable")
        (popup                   . "melpa-stable")
        (pos-tip                 . "melpa-stable")
        (projectile              . "melpa-stable")
        (python-mode             . "melpa")
        (python-x                . "melpa")
        (smartparens             . "melpa-stable")
        (solarized-theme         . "melpa-stable")))

(defun install-required-packages (package-list)
  (when (>= emacs-major-version 24)
    (package-refresh-contents)
    (mapc (lambda (package)
            (unless (require package nil t)
              (package-install package)))
          package-list)))

(setq required-package-list '(async
                              auto-org-md
                              cmake-mode
                              cmake-font-lock
                              company
                              company-quickhelp
                              company-c-headers
                              company-irony
                              company-irony-c-headers
                              company-lua
                              dash
                              docker-compose-mode
                              dockerfile-mode
                              epl
                              groovy-mode
                              helm
                              helm-core
                              helm-gtags
                              highlight-symbol
                              flycheck
                              flycheck-irony
                              flycheck-pos-tip
                              markdown-mode
                              markdown-mode+
                              markdown-preview-eww
                              markdown-toc
                              let-alist
                              org
                              pkg-info
                              popup
                              pos-tip
                              projectile
                              python-mode
                              python-x
                              smartparens
                              solarized-theme))

(install-required-packages required-package-list)

;;; custom-packages.el ends here
