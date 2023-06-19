;; Increase garbage collection and file limits
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)


;; Initialize package sources
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
         '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!
;(setq user-emacs-directory "~/.cache/emacs")

(use-package no-littering)

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))


(setq inhibit-startup-message t
      visible-bell t)

;; Turn off UI elements
(menu-bar-mode -1)
(set-fringe-mode 10)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(scroll-bar-mode -1)

;; display line numbers
(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

; remember place in buffer
(save-place-mode 1)

(show-paren-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(fset 'yes-or-no-p 'y-or-n-p)

;; Keep folders clean (create new directory when not yet existing)
(make-directory (expand-file-name "backups/" user-emacs-directory) t)
(setq backup-directory-alist `(("." . ,
                (expand-file-name "backups/" user-emacs-directory))))

(add-hook 'before-save-hook 'whitespace-cleanup)

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(use-package crux
  :ensure t
  :bind
  ("C-k" . crux-smart-kill-line)
  ("C-c n" . crux-cleanup-buffer-or-region)
  ("C-c f" . crux-recentf-find-file)
  ("C-a" . crux-move-beginning-of-line))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode +1))

(use-package json-mode :pin melpa-stable)

(use-package counsel
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind (("M-x" . counsel-M-x)
     ("C-s" . swiper-isearch)
     ("M-y" . counsel-yank-pop)
     ("C-x C-f" . counsel-find-file)
     ("C-x b" . ivy-switch-buffer)))

(use-package yaml-mode)

(use-package markdown-mode)

(use-package projectile
  :pin melpa-stable
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
  :bind-keymap
  ("s-p" . projectile-command-map))

(use-package counsel-projectile
  :pin melpa-stable)

;; git support (magit)
(use-package magit
  :pin melpa-stable
  :bind (("C-x g" . magit-status)
     ("C-x M-g" . magit-dispatch)))

;; Lisp Language support
(use-package paredit
  :hook (lisp-mode-hook . enable-paredit-mode))

;; slime setup
(use-package sly)

;; cider setup
(use-package cider)

;; Customization
(use-package doom-themes
  :config
  (load-theme 'doom-ayu-mirage t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package vterm)

(use-package evil
  :config
  (evil-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" default))
 '(package-selected-packages
   '(markdown-mode yaml-mode ledger-mode evil-mode vterm flycheck company which-key crux expand-region counsel-projectile ace-jump-mode evil paredit counsel all-the-icons doom-themes doom-modeline org-mode cider projectile magit json-mode use-package no-littering auto-package-update))
 '(tab-bar-close-button-show 'selected)
 '(tab-bar-format
   '(tab-bar-format-history tab-bar-format-tabs tab-bar-separator))
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 145 :family "Input")))))
