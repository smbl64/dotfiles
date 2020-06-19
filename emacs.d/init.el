(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; --------------------------------------
;; Init MELPA
;; --------------------------------------
(require 'package)

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA Stable" . 5)
        ("MELPA"        . 0)))

(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;; ---------------------------------------
;; Install packages
;; ---------------------------------------
(use-package try
  :ensure t)

(use-package format-all
  :ensure t)

(use-package leuven-theme
  :ensure t)

(use-package delight
  :ensure t)

;;(use-package evil
;;  :ensure t
;;  :config
;;  (evil-mode 1)
;;  )

(use-package which-key
  :ensure t
  :delight
  :config
  (which-key-mode))


(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))


(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))


;; it looks like counsel is a requirement for swiper
(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :delight
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package projectile
  :ensure t
  :delight
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(setq projectile-completion-system 'ivy)

(use-package expand-region
  :ensure t
  :bind ("s-w" . er/expand-region))

(use-package ag
  :ensure t
  :custom
  (ag-project-root-function 'projectile-project-root)
  (ag-reuse-buffers t))

(use-package dumb-jump
  :ensure t
  :bind (("s-b" . dumb-jump-go)))

(use-package json-mode :ensure t)

;;(use-package intellij-theme :ensure t)

;; (use-package solarized-theme
;;   :ensure t
;;   :config
;;   (load-theme `solarized-dark t)
;;   )

(load-theme 'leuven t)

(use-package neotree
  :ensure t
  :bind ("<f8>" . neotree-toggle)
  )
;; ------------------------------------------
;; Customizations
;; -----------------------------------------
(setq inhibit-startup-message t)
(tool-bar-mode -1)

;; Disable annoying beep sound
(setq ring-bell-function 'ignore)

(global-set-key (kbd "C-x C-b") 'ibuffer)  ; Use ibuffer instead of list-buffers

;; Line numbers custimization
(global-display-line-numbers-mode 1)
(setq-default display-line-numbers 'visual
              display-line-numbers-current-absolute t
              display-line-numbers-width 4 
              display-line-numbers-widen t)

;; no backup file
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)

; maximized
(set-frame-parameter nil 'fullscreen 'maximized)

; no start message
(setq initial-scratch-message "")

(defalias 'list-buffers 'ibuffer)
(global-visual-line-mode 1)

(defun duplicate-line ()
  (interactive)
  (save-mark-and-excursion
    (beginning-of-line)
    (insert (thing-at-point 'line t))))

(global-set-key (kbd "C-S-d") 'duplicate-line)
(put 'upcase-region 'disabled nil)


;; due to ag bug on Mac
;; https://github.com/Wilfred/ag.el/issues/93#issuecomment-348003505
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))


;; Use ctrl-tab to switch window
(global-set-key (kbd "C-<tab>") 'ace-window)

;; toggles between beginning of line and the beginning of text
(defun beginning-of-line++ ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))
(global-set-key (kbd "C-a") 'beginning-of-line++)

;; Highlight parenthesis
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)


;; Make cursor into a line
(setq-default cursor-type 'bar) 
