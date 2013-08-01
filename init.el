;;; Code:
(setq-default indent-tabs-mode nil)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(defun zenburn-init ()
  (load-theme 'zenburn)
  (if window-system
    (set-face-attribute 'default nil :font "Pragmata-14"))
  (set-cursor-color "#7cfc00")
)
(add-to-list 'load-path "~/.emacs.d/js2/")

(add-hook 'after-init-hook 'zenburn-init)
(setq inhibit-splash-screen t)

(require 'ido)
(ido-mode t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; turn off toolbar, save desktop
(if window-system
    (tool-bar-mode 0)
    (global-linum-mode 1)
    (require 'desktop)
    (desktop-save-mode 1)
    (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save)
)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

(scroll-bar-mode -1)
(global-set-key (kbd "M-1") 'ns-toggle-fullscreen)
(setq scroll-step            1
      scroll-conservatively  10000)

(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)
(display-battery-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("4dacec7215677e4a258e4529fac06e0231f7cdd54e981d013d0d0ae0af63b0c8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)

;;; init.el ends here
