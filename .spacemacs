;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; <SPC f e R> - sync spacemacs configuration.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   ;; options: `all', `unused', `nil'
   dotspacemacs-enable-lazy-installation 'all
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()

   dotspacemacs-configuration-layers
   '(
     elixir
     erlang
     csharp
     html
     javascript
     latex
     plantuml
     python
     shell-scripts
     sql
     yaml
     docker
     helm
     auto-completion
     emacs-lisp
     git
     github
     markdown
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     emoji
     spotify
     twitter
     games
     command-log
     deft
     rcirc
     slack
     prodigy
     restclient
     systemd
     plantuml
     )

   dotspacemacs-additional-packages
   '(
     editorconfig
     expand-region
     )

   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((projects . 7)
                                (agenda, 5)
                                (recents . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   ;; Press <SPC> T n to cycle to the next theme in the list.
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-which-key-delay 0.2
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 95
   dotspacemacs-inactive-transparency 60
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("grep" "pt" "AC" "ag")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing

   ;; Line endings.
   buffer-file-coding-system 'utf-8-unix

   ;; Line length.
   fill-column 80
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; User Settings
  (setq
   ;; neotree
   neo-theme 'nerd

   ;; markdown
   markdown-live-preview-engine 'vmd

   ;; browse-kill-ring
   browse-kill-ring-show-preview nil

   ;; plantuml
   plantuml-jar-path (expand-file-name "c:/bin/plantuml/plantuml.jar")
   ))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; add custom plugins directory to load-path.
  (push "~/.spacemacs-plugins/" load-path)

  ;; monitor the system clipboard and add any changes to the kill ring.
  (add-to-list 'after-init-hook 'clipmon-mode-start)

  ;; - keybindings -
  (spacemacs/set-leader-keys "C-;" 'avy-goto-char-timer)

  ;; - load plugins -
  (autoload 'speed-type-text "speed-type"))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" default)))
 '(deft-directory "c:/Users/Nate-Wilkins/Dropbox/Notes")
 '(deft-extensions (quote ("md")) t)
 '(deft-recursive t)
 '(desktop-save-mode t)
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (helm-spotify-plus evil-unimpaired editorconfig browse-kill-ring clipmon fireplace makefile-executor vmd-mode systemd restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well prodigy dockerfile-mode docker tablist docker-tramp deft twittering-mode slack emojify circe oauth2 websocket rcirc-notify rcirc-color magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht command-log-mode alert log4e gntp yapfify yaml-mode web-mode web-beautify tagedit sql-indent slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode plantuml-mode pip-requirements omnisharp shut-up livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang hy-mode helm-pydoc helm-css-scss haml-mode fish-mode erlang emmet-mode cython-mode csharp-mode company-web web-completion-data company-tern tern company-shell company-auctex company-anaconda coffee-mode auctex anaconda-mode pythonic typit mmt sudoku pacmacs dash-functional 2048-game spotify helm-spotify multi engine-mode ob-elixir flycheck-mix flycheck-credo alchemist elixir-mode emoji-cheat-sheet-plus company-emoji xterm-color smeargle shell-pop orgit multi-term mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
