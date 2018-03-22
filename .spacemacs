;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; <SPC f e R> - sync spacemacs configuration.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   ;; options: `all', `unused', `nil'
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   ;; dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-delete-orphan-packages t
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
     ;; -[ deft ]---------------------------------------------------
     ;; SPC a n	:: Open Deft (works globally)
     ;; SPC m d	:: Delete selected note
     ;; SPC m r	:: Rename selected note
     ;; SPC m i	:: Toggle to regex search
     ;; SPC m n	:: Create new file with filter text
     deft
     ;; -[ vinegar ]------------------------------------------------
     ;; -	      :: Navigate to parent directory in dired
     ;; 0	      :: (Dired) Move to the beginning of the file in dired
     ;; =	      :: (Dired) Diff between selected files
     ;; C-j	    :: (Dired) Move to next subdirectory
     ;; C-k	    :: (Dired) Move to previous sbdirectory
     ;; I	      :: (Dired) Toggle showing dotfiles
     ;; ~~~	    :: (Dired) Navigate to home directory
     ;; f	      :: (Dired) Helm find file
     ;; J	      :: (Dired) Goto file
     ;; C-f	    :: (Dired) dired-find
     ;; H	      :: (Dired) Show dired history
     ;; T	      :: (Dired) Move down in dired tree
     ;; K	      :: (Dired) Kill marked lines (hide, do not delete)
     ;; r	      :: (Dired) Redisplay buffer
     vinegar
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
     emojify
     google-this

     ;; https://github.com/melpa/melpa#recipe-format
     (speed-type :repo "hagleitn/speed-type" :fetcher github :files ("speed-type.el"))
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
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((projects . 7)
                                (recents . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'markdown-mode
   ;; Press <SPC> T n to cycle to the next theme in the list.
   dotspacemacs-themes'(spacemacs-dark
                        spacemacs-light)
                        ;; [local theme support](spacemacs/issues/7373)
                        ;; (base16-harmonic16-dark :location local)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Fonts
   ;; - Source Code Pro
   ;; - Hack
   dotspacemacs-default-font '("Hack"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   ;; SPC-: -> can be used instead of: M-x
   dotspacemacs-emacs-command-key ":"
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
   dotspacemacs-fullscreen-at-startup nil
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
   fill-column 80))

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

   ;; twit
   ;; https://github.com/hayamiz/twittering-mode/
   twittering-use-master-password t
   twittering-icon-mode t
   twittering-convert-fix-size 48
   twittering-use-icon-storage t
   twittering-number-of-tweets-on-retrieval 50
   twittering-timer-interval 30
   twittering-display-remaining t

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
  (setq-default
   ;; deft.
   deft-directory "~/Dropbox/Notes"
   deft-extensions '("md", "txt")
   ;; no acceleration on mouse wheel.
   mouse-wheel-progressive-speed nil
   ;; min number of lines to keep below/above the cursor in view.
   scroll-margin 0
   ;; open urls -> google-chrome
   browse-url-browser-function 'browse-url-generic
   browse-url-generic-program "google-chrome")

  ;; no double spacing sentences.
  (setq sentence-end-double-space nil)
  ;; follow symlinks when editing.
  (setq vc-follow-symlinks t)

  (custom-set-variables
   '(markdown-command "/usr/bin/pandoc"))

  ;; [hooks]
  ;; prog.
  (defun custom-prog-hook ()
    (spacemacs/toggle-fill-column-indicator-on))

  (add-hook 'prog-mode-hook 'custom-prog-hook)

  ;; erlang.
  (defun custom-erlang-mode-hook ()
    (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "." 'alchemist-goto-definition-at-point)
    (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "," 'alchemist-goto-jump-back))

  (add-hook 'erlang-mode-hook 'custom-erlang-mode-hook)

  ;; elixir.
  (defun custom-elixir-mode-hook ()
    (spacemacs/set-leader-keys-for-major-mode 'elixir-mode "." 'alchemist-goto-definition-at-point)
    (spacemacs/set-leader-keys-for-major-mode 'elixir-mode "," 'alchemist-goto-jump-back))

  (add-hook 'elixir-mode-hook 'custom-elixir-mode-hook)

  ;; # enable emojis everywhere.
  (add-hook 'after-init-hook #'global-emojify-mode)
  ;; # monitor the system clipboard and add any changes to the kill ring.
  (add-to-list 'after-init-hook 'clipmon-mode-start)

  ;; [keybindings]
  (spacemacs/set-leader-keys "SPC" 'avy-goto-char-timer)
  (spacemacs/set-leader-keys "=" 'vc-resolve-conflicts)
  )
