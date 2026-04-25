;;; init-mapping.el --- Global Keybindings Map -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Vterm
(global-set-key (kbd "C-`") 'vterm-toggle)
(global-set-key (kbd "C-x t") 'vterm)

;; Diff (Ediff)
(defalias 'ediff-files-short 'ediff-files)
(global-set-key (kbd "C-c d f") 'ediff-files)   ;; two fils
(global-set-key (kbd "C-c d b") 'ediff-buffers) ;; two Buffer
(global-set-key (kbd "C-c d d") 'ediff-directories) ;; Dir

;; OCaml/LSP
(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c C-r") 'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c C-f") 'eglot-format-buffer))

;; Max
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

;; Helpful
;; mark-whole-buffer
(global-unset-key (kbd "C-x h"))

(global-set-key (kbd "C-x h f") #'helpful-callable)  ;; replace describe-function
(global-set-key (kbd "C-x h v") #'helpful-variable)  ;; replace describe-variable
(global-set-key (kbd "C-x h k") #'helpful-key)       ;; replace describe-key
(global-set-key (kbd "C-x h x") #'helpful-command)   ;; View command interaction definitions
(global-set-key (kbd "C-x h d") #'helpful-at-point)  ;; View the definition of the symbol under the cursor

;; Avy
(global-set-key (kbd "C-:")   #'avy-goto-char)
(global-set-key (kbd "C-'")   #'avy-goto-char-2)
(global-set-key (kbd "M-g l") #'avy-goto-line)
(global-set-key (kbd "M-g w") #'avy-goto-word-1)

(provide 'init-mapping)
;;; init-mapping.el ends here
