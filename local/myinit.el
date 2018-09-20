(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

(use-package try
	:ensure t)

(use-package which-key
	:ensure t 
	:config
	(which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package tabbar
  :ensure t
  :config (tabbar-mode 1)
)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))

(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;(use-package color-theme-modern
 ; :ensure t)
    
;(use-package zenburn-theme
 ; :ensure t
 ;:config (load-theme 'zenburn t))

;(use-package spacemacs-theme
;  :ensure t
;  ;:init
;  ;(load-theme 'spacemacs-dark t)
;  )
;(use-package base16-theme
;:ensure t
;)
;(use-package moe-theme
;:ensure t)


;(use-package alect-themes
;:ensure t)

(use-package zerodark-theme
:ensure t)

;;(load-theme 'zerodark t)
;;(zerodark-setup-modeline-format)

(require 'ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
:ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))
  (use-package elpy 
  :ensure t
  :config 
  (elpy-enable))

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package undo-tree
:ensure t
:init
(global-undo-tree-mode))

; Highlights the current cursor line
  (global-hl-line-mode t)
  
  ; flashes the cursor's line when you scroll
  (use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  ; (setq beacon-color "#666600")
  )
  
  ; deletes all the whitespace when you hit backspace or delete
  (use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))
  

  (use-package multiple-cursors
  :ensure t)

  ; expand the marked region in semantic increments (negative prefix to reduce region)
  (use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(setq save-interprogram-paste-before-kill t)


(global-auto-revert-mode 1) ;; you might not want this
(setq auto-revert-verbose nil) ;; or this
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f6>") 'revert-buffer)

; mark and edit all copies of the marked region simultaniously. 
(use-package iedit
:ensure t)

; if you're windened, narrow to the region, if you're narrowed, widen
; bound to C-x n
(defun narrow-or-widen-dwim (p)
"If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
(interactive "P")
(declare (interactive-only))
(cond ((and (buffer-narrowed-p) (not p)) (widen))
((region-active-p)
(narrow-to-region (region-beginning) (region-end)))
((derived-mode-p 'org-mode)
;; `org-edit-src-code' is not a real narrowing command.
;; Remove this first conditional if you don't want it.
(cond ((ignore-errors (org-edit-src-code))
(delete-other-windows))
((org-at-block-p)
(org-narrow-to-block))
(t (org-narrow-to-subtree))))
(t (narrow-to-defun))))

;; (define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(use-package web-mode
    :ensure t
    :config
	   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	   (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
	   (setq web-mode-engines-alist
		 '(("django"    . "\\.html\\'")))
	   (setq web-mode-ac-sources-alist
	   '(("css" . (ac-source-css-property))
	   ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
         ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq web-mode-enable-auto-closing t))
(setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned

(use-package better-shell
  :ensure t
  :bind (("C-\"" . better-shell-shell)
         ("C-:" . better-shell-remote-open)))

(use-package projectile
:ensure t
:config
(projectile-global-mode)
(setq projectile-completion-system 'ivy))

;(use-package counsel-projectile
;:ensure t
;:config
;(counsel-projectile-on))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  )

(use-package all-the-icons)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require 'hl-line)

(defface my-linum-hl
  `((t :inherit linum :background ,(face-background 'hl-line nil t)))
  "Face for the current line number."
  :group 'linum)

(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

(defun my-linum-get-format-string ()
  (let* ((width (1+ (length (number-to-string
                             (count-lines (point-min) (point-max))))))
         (format (concat "%" (number-to-string width) "d \u2502")))
    (setq my-linum-format-string format)))

(defvar my-linum-current-line-number 0)

(setq linum-format 'my-linum-format)

(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face
              (if (eq line-number my-linum-current-line-number)
                  'my-linum-hl
                'linum)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)
(global-linum-mode t)

(use-package magit
  :ensure t
  :init
  (progn
  (bind-key "C-x g" 'magit-status)
  ))

  (use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))

  (global-set-key (kbd "M-g M-g") 'hydra-git-gutter/body)


  (use-package git-timemachine
  :ensure t
  )
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
       :color blue))
