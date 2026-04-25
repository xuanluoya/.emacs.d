;;; init-utils.el --- OMG -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;（yes/no → y/n）
(defalias 'yes-or-no-p 'y-or-n-p)

;; scratch buffer
(setq initial-major-mode 'lisp-interaction-mode)
(setq initial-scratch-message "")

;; Exit
(setq confirm-kill-processes nil)

;; hunspell
(cond
 ((executable-find "hunspell")
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
  (when (boundp 'ispell-hunspell-dictionary-alist)
    (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)))

 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))

;; ~ file
(setq make-backup-files nil)

;; # file
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; .# file
(setq create-lockfiles nil)

;; C-x u
(sup 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history nil)

;; Full
(toggle-frame-fullscreen)


(provide 'init-utils)
;;; init-utils.el ends here
