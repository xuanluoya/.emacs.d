;;; init-tools.el --- tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Terminal
(sup 'vterm)

(add-hook 'vterm-mode-hook
          (lambda ()
            (setq-local global-hl-line-mode (null global-hl-line-mode))))

(setq vterm-kill-buffer-on-exit t)

(setq vterm-buffer-name-string "vt")

(sup 'vterm-toggle)
(setq vterm-toggle-hide-method 'delete-window)
(setq vterm-toggle-fullscreen-p nil)

(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                 (let ((buffer (get-buffer buffer-or-name)))
                   (equal major-mode 'vterm-mode)))
               (display-buffer-reuse-window display-buffer-at-bottom)
               (dedicated . t)
               (reusable-frames . visible)
               (window-height . 0.3)))

(defun vterm--kill-vterm-buffer-and-window (process event)
  "Kill buffer and window on vterm process termination."
  (when (not (process-live-p process))
    (let ((buf (process-buffer process)))
      (when (buffer-live-p buf)
        (with-current-buffer buf
          (kill-buffer)
          (ignore-errors (delete-window))
          (message "VTerm closed."))))))

(add-hook 'vterm-mode-hook
          (lambda ()
            (set-process-sentinel (get-buffer-process (buffer-name))
                                  #'vterm--kill-vterm-buffer-and-window)))


;; Git GUI
(sup 'magit)

;; Diff
(setq ediff-diff-options "")
(setq ediff-custom-diff-options "-u")
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-vertically)


(provide 'init-tools)
;;; init.el ends here
