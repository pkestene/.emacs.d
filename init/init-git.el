;; Git / magit / gutter

;; gutter allows to have a live visual git status (colored symbols on the
;; left of the frame).
;; [[https://github.com/syohex/emacs-git-gutter]]

(use-package magit
  :ensure t
  :commands magit-get-top-dir
  :bind (("M-g s" . magit-status)
         ("M-g l" . magit-file-log)
         ("M-g f" . magit-grep))
  :init
  ;; magit extensions
  (use-package magit-blame
    :bind ("M-g b" . magit-blame-mode))
  )

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))

(use-package git-timemachine
  :ensure t
  :bind ("M-g t" . git-timemachine-toggle))

(when (package-installed-p 'hydra)
  (defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
                                        :hint nil)
    "
Git gutter:
  _j_: next hunk        _s_tage hunk     _q_uit
  _k_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
  ^ ^                   _p_opup hunk
  _h_: first hunk
  _l_: last hunk        set start _R_evision
"
    ("j" git-gutter:next-hunk)
    ("k" git-gutter:previous-hunk)
    ("h" (progn (goto-char (point-min))
                (git-gutter:next-hunk 1)))
    ("l" (progn (goto-char (point-min))
                (git-gutter:previous-hunk 1)))
    ("s" git-gutter:stage-hunk)
    ("r" git-gutter:revert-hunk)
    ("p" git-gutter:popup-hunk)
    ("R" git-gutter:set-start-revision)
    ("q" nil :color blue)
    ("Q" (progn (git-gutter-mode -1)
                ;; git-gutter-fringe doesn't seem to
                ;; clear the markup right away
                (sit-for 0.1)
                (git-gutter:clear))
     :color blue)))


(global-set-key (kbd "M-g M-g") 'hydra-git-gutter/body)

;; font scaling
(use-package default-text-scale
  :ensure t
  :config
  (global-set-key (kbd "C-M-=") 'default-text-scale-increase)
  (global-set-key (kbd "C-M--") 'default-text-scale-decrease))


(provide 'init-git)
