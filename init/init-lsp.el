;; init-lsp.el --- Initialize lsp configuration.

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

;; Initialize lsp configuration.

;;; Code:

(use-package nxml-mode
  :ensure t
  :hook (nxml-mode . lsp)
  :init (fset 'xml-mode 'nxml-mode)
  :custom
  (nxml-slash-auto-complete-flag t)
  (nxml-auto-insert-xml-declaration-flag t))

;; Config to make it lsp-diagnose compliant
(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook
  ((c-mode-hook c++-mode-hook objc-mode-hook TeX-mode-hook
                python-mode-hook sh-mode-hook) . lsp-deferred)
  :custom
  (lsp-completion-enable-additional-text-edit nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-prefer-capf t)
  (read-process-output-max (* 1024 1024))
  (lsp-xml-logs-client nil)
  (lsp-xml-jar-file (expand-file-name
                     "~/install/xml/lemminx/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar"))
  :config
  (remove-hook 'company-backends 'company-clang)
  (progn
    (setq lsp-prefer-flymake nil)))

(use-package lsp-ui
  :ensure t
  :hook
  (lsp-mode-hook . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-imenu-enable t)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate nil))

(use-package format-all
  :ensure t
  :no-require t)

(provide 'init-lsp)
;;; init-lsp.el ends here
