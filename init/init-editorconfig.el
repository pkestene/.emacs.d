;; Editorconfig plugin for emacs
;; https://github.com/editorconfig/editorconfig-emacs
;;
;; Editorconfig : https://editorconfig.org/

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package editorconfig-generate
  :ensure t
  )

(provide 'init-editorconfig)
