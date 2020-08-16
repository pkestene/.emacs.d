;;; init-cc.el --- Initialize c-like configuration.

;; Copyright (C) 2019 Thomas Padioleau

;; Author: Thomas Padioleau <padioleau.thomas@gmail.com>
;; URL: https://github.com/tpadioleau/.emacs.d

;; This file is not part of GNU Emacs.

;;; License

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Initialize c-like configuration.

;;; Code:

(use-package cc-mode
  :ensure nil
  :mode
  ("\\.[hH]\\(h?\\|xx\\|pp\\)\\'" . c++-mode)
  :custom
  (c-basic-offset 2)
  (c-default-style "bsd")
  (c-offsets-alist '((innamespace . 0)))
  (c-tab-always-indent 'complete))

;; handle cuda files
;; (use-package cuda-mode
;;   :ensure t
;;   :commands cuda-mode
;;   :mode (("\\.cu\\'" . cuda-mode)
;;          ("\\.cuh\\'" . cuda-mode)))

;; (use-package ccls
;;   :ensure t
;;   :after (:all lsp-mode cc-mode))
;; (setq ccls-executable "/home/pkestene/local/bin/ccls")

(use-package ccls
  :ensure t
  :no-require t)

(use-package modern-cpp-font-lock
  :ensure t
  :hook
  (c++-mode-hook . modern-c++-font-lock-mode))

(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))

  ;; https://github.com/emacs-lsp/lsp-ui/issues/190
(defun flycheck-clang-tidy-setup ()
  "Setup Flycheck clang-tidy."
  (add-to-list 'flycheck-checkers 'c/c++-clang-tidy)
  (when lsp-mode (flycheck-add-next-checker 'lsp-ui '(error . c/c++-clang-tidy))))

(use-package flycheck-clang-tidy
  :ensure t
  :after lsp-mode
  :hook
  (flycheck-mode-hook . flycheck-clang-tidy-setup)
  :config
  (flycheck-add-next-checker 'lsp '(warning . c/c++-clang-tidy)))

(use-package clang-format
  :ensure t
  :defer t)

;; https://www.emacswiki.org/emacs/SrSpeedbar
(use-package sr-speedbar
  :ensure t
  :no-require t)

(provide 'init-cc)
;;; init-cc.el ends here

