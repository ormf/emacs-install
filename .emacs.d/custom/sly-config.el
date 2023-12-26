;; ======== SLY ============================================================
(require 'sly)
(require 'sly-autoloads)

(setq inferior-lisp-program "/usr/bin/sbcl")

(setq sly-use-autodoc-mode t)

(add-hook
 'lisp-mode-hook
 (lambda ()
   (recentf-mode t)
   (company-mode t)
   (rainbow-delimiters-mode t)
   (paredit-mode t)
   (define-key sly-mode-map (kbd "C-c C-y") 'sly-mrepl)))

(setq sly-enable-evaluate-in-emacs t)

(global-set-key "\C-x\C-l" 'sly)

(add-hook
 'sly-mrepl-mode-hook
 (lambda ()
   (recentf-mode t)
   (company-mode t)
   (rainbow-delimiters-mode t)
   (paredit-mode t)
   (define-key sly-mrepl-mode-map (kbd "C-<up>") 'sly-mrepl-previous-input-or-button)
   (define-key sly-mrepl-mode-map (kbd "C-<down>") 'sly-mrepl-next-input-or-button)
   ))

;;; globally in every buffer and mode check if paredit-RET was called in
;;; the repl buffer and call sly-mrepl-return
(advice-add 'paredit-RET
            :after
            (lambda ()
              (when (string-prefix-p "*sly-mrepl for"
                                     (buffer-name (current-buffer)))
                (sly-mrepl-return))))

(sly)

;; ======== End SLY ============================================================

