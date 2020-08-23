;;; centaur-tabs
;;;
;;; https://github.com/ema2159/centaur-tabs

(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-style "bar"
        centaur-tabs-set-bar 'over
        centaur-tabs-set-icons t
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-height 24
        ;;centaur-tabs-show-navigation-buttons t
        centaur-tabs-set-modified-marker t
        centaur-tabs-modifier-marker "*")
  (centaur-tabs-enable-buffer-reordering)
  ;; Move the currently selected tab to the left of the the last visited tab.
  (setq centaur-tabs-adjust-buffer-order 'left)
  ;;(setq centaur-tabs-adjust-buffer-order t)
  (centaur-tabs-mode t)
  )

(provide 'init-centaur-tabs)
;;; init-centaur-tabs.el ends here
