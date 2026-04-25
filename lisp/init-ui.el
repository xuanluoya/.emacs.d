;;; init-ui.el --- UI about -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(setq inhibit-startup-screen t)
(push '(width . 120) default-frame-alist)
(push '(height . 40) default-frame-alist)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(setq ring-bell-function 'ignore)

;; Line number
;; (setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Font
(add-to-list 'default-frame-alist '(font . "Maple Mono NF CN-17"))

;; themes
(sup 'gruvbox-theme)
(sup 'color-theme-sanityinc-solarized)

;; Change theme with macOS
(when (boundp 'ns-system-appearance)
  (defun my/apply-system-theme ()
    (dolist (theme custom-enabled-themes)
      (disable-theme theme))
    (if (eq ns-system-appearance 'dark)
        (load-theme 'gruvbox-dark-hard t)
      (load-theme 'sanityinc-solarized-light t)))

  (add-hook 'ns-system-appearance-change-functions #'my/apply-system-theme)
  (my/apply-system-theme))

;; Windows titles
(setq-default frame-title-format '("emacs: %b"))

;; Smooth scrolling
(defun pixel-scroll-setup ()
  (interactive)
  (setq pixel-scroll-precision-large-scroll-height 1)
  (setq pixel-scroll-precision-interpolation-factor 1))
(when (boundp 'pixel-scroll-precision-mode)
  (pixel-scroll-setup)
  (add-hook 'prog-mode-hook #'pixel-scroll-precision-mode))

;; Some highlighted words
(global-hl-line-mode)

(sup 'hl-todo)
(require 'hl-todo)
(global-hl-todo-mode)
;; #ff0000
(sup 'rainbow-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)

;; Hello
(sup 'dashboard)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice "*dashboard*")
(setq dashboard-center-content t)
(setq dashboard-show-shortcuts nil)
(setq dashboard-set-footer nil)
(setq dashboard-items '((recents  . 5)
                        (projects . 5)))
(setq dashboard-item-names '(("Recent Files:" . "recent:")
                             ("Projects:" . "projects:")))
(setq dashboard-banner-logo-title "GNU emacsへようこそ。")
(setq dashboard-image-banner-max-height 320)
(setq dashboard-image-banner-max-width 320)
(defmacro set-dashboard-banner (name)
  `(setq dashboard-startup-banner
         (expand-file-name ,name user-emacs-directory)))
(if (or (display-graphic-p) (daemonp))
    (set-dashboard-banner "assets/wow.png"))

;; Complete the floating box style
(when (display-graphic-p)
  (sup 'vertico-posframe)
  (require 'vertico-posframe)
  (vertico-posframe-mode 1)
  (set-face-background 'vertico-posframe-border
                       (face-attribute 'region :background)))


(provide 'init-ui)
;;; init-ui ends here
