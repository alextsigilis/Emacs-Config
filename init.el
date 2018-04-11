
;; --------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/" ) t)
(package-initialize)

;; ---------------------------------------------------------------

(require 'linum)
(global-linum-mode)

;; -----------------------------------------------------------------

(tool-bar-mode -1)

;; -------------------------------------------------------------------
;; ======================================================================

;;              ORG MODE
;;  -------------------------------------------------------------

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)
(put 'erase-buffer 'disabled nil)



;; =====================================================================
;; -------------------------------------------------------------------

(set-input-method "greek") ;; Use C-\

;; --------------------------------------------------------------------

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))


(add-to-list 'exec-path "/usr/local/bin/")

;; ---------------------------------------------------------------
;;               PYTHON

(package-initialize)
(elpy-enable)

(setq python-shell-interpreter "/Library/Frameworks/Python.framework/Versions/3.6/bin/ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;; ---------------------------------------------------------------
;; ==============================================================

;;              FONT SETTING
;;  -------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (atom-dark)))
 '(custom-safe-themes
   (quote
    ("503385a618581dacd495907738719565243ab3e6f62fec8814bade68ef66e996" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" default)))
 '(fci-rule-color "#3E4451")
 '(package-selected-packages
   (quote
    (evil haskell-mode weechat projectile clojure-mode-extra-font-locking cider elpy atom-one-dark-theme atom-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; --------------------------------------------------------------------------------
;;
;;                     EVIL MODE

;;(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(package-initialize)

(require 'evil)
(evil-mode 1)

;; --------------------
