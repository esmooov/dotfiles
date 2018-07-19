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
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     ;; TODO: spacemacs-purpose
     elixir
     erlang
     csharp
     fsharp
     html
     (javascript :variables
                 js2-mode-show-parse-errors t
                 js2-mode-show-strict-warnings t)
     react
     latex
     plantuml
     (python :variables
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t)
     shell-scripts
     sql
     yaml
     docker
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t)
     emacs-lisp
     git
     github
     markdown
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; - [ version-control ] --------------------------------------
     ;; SPC g . h	:: Show diff of hunk
     ;; SPC g . n	:: Next hunk
     ;; SPC g . N	:: Previous hunk
     ;; SPC g . p	:: Previous hunk
     ;; SPC g . r	:: Revert hunk
     ;; SPC g . s	:: Stage hunk
     ;; SPC g . t	:: Toggle margin indicators
     ;; SPC g . w	:: Stage file
     ;; SPC g . u	:: Unstage file
     ;; SPC g . d	:: Repo diff popup
     ;; SPC g . D	:: Show diffs of unstaged hunks
     ;; SPC g . c	:: Commit with popup
     ;; SPC g . C	:: Commit
     ;; SPC g . P	:: Push repo with popup
     ;; SPC g . f	:: Fetch for repo with popup
     ;; SPC g . F	:: Pull repo with popup
     ;; SPC g . l	:: Show repo log
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left
                      version-control-global-margin t)
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
     plantuml)

   dotspacemacs-additional-packages
   '(
     editorconfig
     expand-region
     emojify
     google-this
     prettier-js
     add-node-modules-path,

     ;; https://github.com/melpa/melpa#recipe-format
     (speed-type :repo "hagleitn/speed-type" :fetcher github :files ("speed-type.el")))

     ;; TODO: Use a better flowjs implementation?
     ;;(flow-for-emacs :repo "flowtype/flow-for-emacs" :fetcher github :files ("flow.el"))
     ;;(flow-minor-mode :repo "an-sh/flow-minor-mode" :fetcher github :files ("flow-minor-mode.el"))
     ;;(flow-js2-mode :repo "Fuco1/flow-js2-mode" :fetcher github :files ("flow-js2-test-helpers.el", "flow-js2-mode.el")))

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
   dotspacemacs-default-font '("Source Code Pro"
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
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
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

   ;; Projectile Git Grep
   projectile-use-git-grep 1))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'flycheck)

  (setq-default
   ;; magit
   magit-repository-directories '("~/projects/")

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

  ;; -[ company ]------------------------------------------------
  ;; C-d	    :: open minibuffer with documentation of thing at point in company dropdown
  ;; C-/	    :: show candidates in Helm (for fuzzy searching)
  ;; C-M-/	  :: filter the company dropdown menu
  ;; M-h	    :: show current candidate’s documentation in a tooltip (requires auto-completion-enable-help-tooltip)
  ;; ------------------------------------------------------------
  ;; C-j	    :: go down in company dropdown menu
  ;; C-k	    :: go up in company dropdown menu
  ;; C-l	    :: complete selection
  (setq company-idle-delay .1)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq company-lighter "")
  (custom-set-faces
  '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
  '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
  (global-company-mode)

  ;; editorconfig
  (editorconfig-mode 1)

  ;; - [ magit ] -------------------------------------------
  ;; if the branch has a jira ticket, add that to the commit message.
  ;; https://github.com/gopar/.emacs.d/blob/9bf836ed254c7e5ebaeff97e19e4bb3fd5f84e73/init.el#L523
  (add-hook 'git-commit-setup-hook
    '(lambda ()
       (let ((has-ticket-title (string-match "^[A-Z]+-[0-9]+" (magit-get-current-branch)))
              (words (s-split-words (magit-get-current-branch))))
         (if has-ticket-title
           (insert (format "%s-%s " (car words) (car (cdr words))))))))

  ;; - [ flycheck ] ----------------------------------------
  ;; stop flycheck from saying this is a dangerous variable
  ;; https://github.com/gopar/.emacs.d/blob/9bf836ed254c7e5ebaeff97e19e4bb3fd5f84e73/init.el#L634
  (put 'flycheck-python-mypy-args 'safe-local-variable (lambda (x) t))
  (put 'flycheck-python-mypy-executable 'safe-local-variable (lambda (x) t))

  ;; javascript
  ;; TOOD:
  ;; - use single mode for editing JS (js2-mode vs web-mode vs react-mode).
  (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))

  ;; javascript.node_modules.bin
  (add-hook 'flycheck-mode-hook 'add-node-modules-path)

  ;; javascript.flowjs (http://flowtype.org)
  ;; https://github.com/bodil/emacs.d/blob/master/bodil/bodil-js.el
  (defun flycheck-parse-flow (output checker buffer)
    (let ((json-array-type 'list))
      (let ((o (json-read-from-string output)))
        (mapcar #'(lambda (errp)
                    (let ((err (cadr (assoc 'message errp))))
                      (flycheck-error-new
                       :line (cdr (assoc 'line err))
                       :column (cdr (assoc 'start err))
                       :level 'error
                       :message (cdr (assoc 'descr err))
                       :filename (f-relative
                                  (cdr (assoc 'path err))
                                  (f-dirname (file-truename
                                              (buffer-file-name))))
                       :buffer buffer
                       :checker checker)))
                (cdr (assoc 'errors o))))))

  (flycheck-define-checker javascript-flow
    "Javascript type checking using Flow."
    :command ("flow" "--json" source-original)
    :error-parser flycheck-parse-flow
    :modes react-mode
    :next-checkers ((error . javascript-eslint)))

  (add-to-list 'flycheck-checkers 'javascript-flow)

  ;; javascript.eslint
  ;; disable jshint -> prefer eslint
  (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
      '(javascript-jshint)))

  ;; eslint in (web-mode, js2-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-flow 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (flycheck-add-mode 'javascript-flow 'js2-mode)
  (flycheck-add-mode 'javascript-eslint 'react-mode)
  (flycheck-add-mode 'javascript-flow 'react-mode)

  ;; set flycheck temp file prefix.
  (setq-default flycheck-temp-prefix ".flycheck")

  ;; javascript.prettier
  ;; https://github.com/prettier/prettier-emacs/blob/master/prettier-js.el
  ;; javascript.prettier.hooks
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'react-mode-hook 'prettier-js-mode)

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
  (spacemacs/set-leader-keys "=" 'magit-ediff-resolve)

  (global-set-key [f7] 'spacemacs/previous-error)
  (global-set-key [f8] 'spacemacs/next-error)

  ;; projectile
  (spacemacs/set-leader-keys "p D" 'projectile-dired-other-window)
  (spacemacs/set-leader-keys "p d" 'projectile-dired)

  ;; rebind SPC-q-q to frame-killer (so we don't kill the daemon emacs server)
  (spacemacs/set-leader-keys "q q" 'spacemacs/frame-killer))
