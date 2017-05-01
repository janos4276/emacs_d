;;; customise-editing.el --- My emacs editing customisations
;;; Commentary:
;;; Code:

(provide 'customise-editing)

;; -----------------------------------------
;; Set the coding and language environment -
;; -----------------------------------------
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)
(prefer-coding-system 'utf-8)

;; ---------
;; Tabbing -
;; ---------
(setq-default indent-tabs-mode nil) ;; Use spaces instead of tabs
(setq tab-width 4) ;; Set default tab width to 4

;; ------------------
;; Enable clipboard -
;; ------------------
(setq x-select-enable-clipboard t)

;; ---------
;; Wanking -
;; ---------
(setq kill-whole-line t)

;; ------------------------
;; Mouse yanking at point -
;; ------------------------
(setq mouse-yank-at-point t)

;; ------------------------------------
;; When yanking, delete selected text -
;; at mark first.                     -
;; ------------------------------------
(delete-selection-mode t)

;; --------------------
;; Add me the newline -
;; --------------------
(setq mode-require-final-newline t)

;; -----------------------------------------
;; Nukes trailing whitespace from the ends -
;; of lines, and deletes excess newlines   -
;; from the ends of buffers.               -
;; -----------------------------------------
;; (require 'whitespace)
;; (setq whitespace-auto-cleanup t)
;; (global-whitespace-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ----------------------------------
;; Smart parentheses (smartparens ) -
;; ----------------------------------
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; ------------------------
;; Rember where I was ... -
;; ------------------------
(require 'saveplace)
;; (toggle-save-place-globally 0)

;; --------------------------------
;; On the fly checking (flycheck) -
;; --------------------------------
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; Give me tips
(require 'flycheck-pos-tip)
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; --------------------------------------
;; Highlight symbols (highlight-symbol) -
;; --------------------------------------
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; -------------
;; Helm (helm) -
;; -------------
(require 'helm)
(require 'helm-config)
(global-set-key [(meta x)]                'helm-M-x)
(global-set-key [(control x) (control f)] 'helm-find-files)
(define-key helm-map [tab]                'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map [(control i)]        'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map [(control z)]        'helm-select-action) ; list actions using C-z

(global-set-key [(control x) b] 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(helm-mode 1)
(helm-autoresize-mode 1)

;; -------------------------
;; Helm-gtags (helm-gtags) -
;; -------------------------
;; See http://tuhdo.github.io/c-ide.html
;; Need to compile GNU Global: http://www.gnu.org/software/global/download.html
;; Ubuntu one is too old
;;(setq  helm-gtags-ignore-case t
;;       helm-gtags-auto-update t
;;       helm-gtags-use-input-at-cursor t
;;       helm-gtags-pulse-at-cursor t
;;       helm-gtags-prefix-key "\C-cg"
;;       helm-gtags-suggested-key-mapping t
;; )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j")     'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.")     'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,")     'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <")   'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >")   'helm-gtags-next-history)

;; -----------------------------------------------------
;; General completion with company mode (company-mode) -
;; -----------------------------------------------------
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;; customise-editing.el ends here
