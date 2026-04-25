;;; init-tools.el --- tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Terminal
(sup 'vterm)

(setq vterm-kill-buffer-on-exit t)
(setq vterm-buffer-name-string "vt")

(sup 'vterm-toggle)

(setq vterm-toggle-hide-method 'delete-window)
(setq vterm-toggle-fullscreen-p nil)

(setq display-buffer-alist
      (cons '("\\*vterm\\*"
              (display-buffer-reuse-window display-buffer-at-bottom)
              (window-height . 0.3)
              (reusable-frames . visible)
              (side . bottom))
            display-buffer-alist))

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
            (setq-local global-hl-line-mode nil)
            (set-process-sentinel (get-buffer-process (current-buffer))
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
