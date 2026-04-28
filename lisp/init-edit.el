;;; init-edit.el --- edit edit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; vertico
(sup 'vertico)
(require 'vertico)
(vertico-mode)

;; DEL
(define-key vertico-map (kbd "DEL") #'vertico-directory-delete-char)

;; vertico-posframe
(when (display-graphic-p)
  (sup 'vertico-posframe)
  (require 'vertico-posframe)
  (vertico-posframe-mode 1)
  (set-face-background 'vertico-posframe-border
                       (face-attribute 'region :background)))

;; marginalia
(sup 'marginalia)
(require 'marginalia)
(marginalia-mode)

;; orderless
(sup 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

;; corfu
(sup 'corfu)
(require 'corfu)
(setq corfu-auto t)
(add-hook 'after-init-hook #'global-corfu-mode)

;; Avy
(sup 'avy)

;; projectile
(sup 'projectile)
(require 'projectile)
(projectile-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; C-x C-f : projectile or  find-file
(defun find-file-or-projectile ()
  (interactive)
  (if (projectile-project-p)
      (call-interactively 'projectile-find-file)
    (call-interactively 'find-file)))
(global-set-key (kbd "C-x C-f") 'find-file-or-projectile)

;; deadgrep：ripgrep on EMACS
(when (executable-find "rg")
  (sup 'deadgrep))

;; Helpful
(sup 'helpful)
(require 'helpful)

;; Markdown
(sup 'markdown-mode)


;; Evil - Vim emulation
(sup 'evil)
(require 'evil)
(evil-mode 1)

(provide 'init-edit)
;;; init-edit ends here
