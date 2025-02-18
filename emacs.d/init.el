(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven-dark))
 '(custom-safe-themes
   '("dea106ab256a8017a325f51f01b1131915989fa25db48eb831ffb18dac8ecd39" "1d1f4f5b0f792f0bb1b8f944b8ed93b3b20bbebc4ba072c2b7daff82da23ae86" default))
 '(package-selected-packages
   '(rust-mode lsp-pyright flycheck company lsp-ui go-mode lsp-mode base16-theme undo-fu evil-collection)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-screen t)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(scroll-bar-mode  -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(eval-when-compile (require 'use-package))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Download automatically
(setq use-package-always-ensure t)

;; Defer loading packages by default
(setq use-package-always-defer t)

;; Add the ability to upgrade all packages
(use-package package-utils
  :commands (package-utils-upgrade-all-and-recompile))

;; Highlight terms in code-comments such as TODO, FIXME, URL's & email
(use-package hl-prog-extra
  :commands (hl-prog-extra-mode)
  :init (add-hook 'prog-mode-hook #'hl-prog-extra-mode))

(use-package which-key
  :demand t
  :config
  (which-key-mode))

; Vim Bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-undo-system 'undo-fu)
  (setq evil-search-module 'evil-search)
  :config
  (evil-mode 1))

(use-package undo-fu)

(use-package evil-surround
  :demand t
  :config
  ;; Initialize.
  (global-evil-surround-mode 1))

; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package lsp-mode
  :hook (
	 ((java-mode js-mode go-mode rust-mode) . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package company
  :commands (company-complete-common company-dabbrev)
  :custom (company-idle-delay 0)
  :config
  (global-company-mode)
  (setq company-tooltip-limit 40)

  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case nil)

  (define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-l") 'company-complete-selection)
  (define-key company-active-map (kbd "C-h") 'company-abort)
  (define-key company-active-map (kbd "<C-return>") 'company-complete-selection)

  (define-key company-search-map (kbd "C-j") 'company-select-next)
  (define-key company-search-map (kbd "C-k") 'company-select-previous)
)

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright")
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package base16-theme
  :ensure t)

(use-package emacs
  :config
  (load-theme 'base16-decaf t))

(use-package go-mode)
(use-package rust-mode)

(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono")


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Don't group undo steps
(fset 'undo-auto-amalgamate 'ignore)

(setq undo-limit 67108864)
;; Make undo work like Vim
(setq evil-want-fine-undo t)
;; ---------------------------
;; UI enhancements
;; ---------------------------
;; Mode line information
(setopt line-number-mode t)
(setopt column-number-mode t)
(blink-cursor-mode -1)       ; no blinking
(setopt visible-cursor nil)  ; no blinking in cli mode

(global-display-line-numbers-mode 1)
(setopt display-line-numbers-width 3)           ; Set a minimum width

;; Show matching parentheses
(show-paren-mode 1)

;; Start the initial frame full size
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))


; Use iBuffer to list buffers
(global-set-key [remap list-buffers] 'ibuffer)
