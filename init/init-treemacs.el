;; treemacs

;; A tree layout file explorer for emacs.
;; [[https://github.com/Alexander-Miller/treemacs]]

(use-package treemacs
  :ensure t
  :bind
  (:map global-map
        ([f8] . treemacs)
        ("C-<f8>" . treemacs-select-window))
  :config
  (setq treemacs-is-never-other-window t)
  )


;; https://github.com/emacs-lsp/lsp-treemacs
;; useful commands
;;
;; lsp-treemacs-symbols
;; lsp-treemacs-references
;; lsp-treemacs-call-hierarchy
;; lsp-treemacs-symbols-list
;; lsp-treemacs-errors-list
(use-package lsp-treemacs
  :after treemacs lsp
  :ensure t
  :config
  (lsp-treemacs-sync-mode 1)
)

(use-package treemacs-all-the-icons
  :after treemacs all-the-icons
  :ensure t
)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t
)

;; to be evaluated
;; (use-package treemacs-persp
;;   :after treemacs persp-mode
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Perspectives)
;; )

(provide 'init-treemacs)
;;; init-treemacs.el ends here
