;;; init-lsp.el --- LSP & Programming Support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Eglot
(use-package eglot
  :ensure nil
  :hook ((c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (tuareg-mode . eglot-ensure))
  :config
  ;; Format when Save
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (add-hook 'before-save-hook #'eglot-format-buffer nil t)))

  (setq eldoc-idle-delay 0.1)
  (setq eglot-ignored-server-capabilities '(:documentHighlightProvider)))

;; 2. OCaml：Tuareg
(sup 'tuareg)

(when (display-graphic-p)
  (sup 'eldoc-box)
  (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-at-point-mode))

(provide 'init-lsp)
;;; init-lsp ends here
