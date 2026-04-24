;;; init-buffer.el --- buffer buffer -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(global-set-key (kbd "S-<up>")    'windmove-up)
(global-set-key (kbd "S-<down>")  'windmove-down)
(global-set-key (kbd "S-<left>")  'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)

;; ace-window
(sup 'ace-window)
(require 'ace-window)

(global-set-key [remap other-window] 'ace-window)
;; Swap window positions
(global-set-key (kbd "C-x w") 'ace-swap-window)

(setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s))
(setq aw-scope 'frame)
(setq aw-ignore-current t)
(setq aw-background nil)


(provide 'init-buffer)
;;; init-buffer ends here
