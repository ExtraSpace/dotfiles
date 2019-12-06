                                        ; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; (chrome :variables
     ;;         chrome-exec-path "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
     (ranger :variables
             ranger-show-preview t)
     docker
     ;; octave
     ;; rust
     ;; ipython-notebook
     pdf-tools
     docker
     csv
     html
     python
     yaml
     javascript
     react
     helm
     haskell
     (auto-completion :variables
                      auto-completion-enable-help-tooltip nil
                      auto-completion-enable-snippets-in-popup nil)
     better-defaults
     emacs-lisp
     ibuffer
     git
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     pandoc
     imenu-list
     (org :variables
          org-enable-bootstrap-support t
          org-enable-github-support t
          org-projectile-file "TODO.org")
     bibtex
     spell-checking
     (ess :variables
          ess-pdf-viewer-pref "emacsclient")
     themes-megapack
     (latex :variables
            latex-build-command "LaTeX"
            latex-enable-auto-fill t
            latex-enable-folding t)
     (osx :variables
          osx-use-option-as-meta t
          osx-dictionary-dictionary-choice "English")
     syntax-checking
     ;; version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(fold-this
                                      nord-theme
                                      doom-themes
                                      polymode
                                      poly-R
                                      poly-markdown
                                      poly-noweb
                                      poly-org
                                      sphinx-doc
                                      nord-theme
                                      doom-themes
                                      olivetti
                                      focus
                                      react-snippets
                                      (px :location (recipe :fetcher github :repo "aaptel/preview-latex")))
   ;; a list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; a list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; defines the behaviour of spacemacs when installing packages.
   ;; possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "initialization function.
this function is called at the very startup of spacemacs initialization
before layers configuration.
you should not put any user code in there besides modifying the variable
values."
  ;; this setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; if non nil elpa repositories are contacted via https whenever it's
   ;; possible. set it to nil if you have no way to use https in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; this variable has no effect if emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; maximum allowed time in seconds to contact an elpa repository.
   dotspacemacs-elpa-timeout 5
   ;; if non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. note that checking for
   ;; new versions works via git commands, thus it calls github services
   ;; whenever you start emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; if non-nil, a form that evaluates to a package directory. for example, to
   ;; use different package directories for different emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(nord
                         spacemacs-light
                         spacemacs-dark
                         white-sand
                         soft-stone
                         madhat2r
                         spacemacs-dark)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is the default Emacs mode-line. `custom'
   ;; is a user defined theme, refer to DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with
   ;; additional properties.
   ;; (default '(spacemacs :seperator wave :seperator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Space Mono for Powerline"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 0
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 0
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Configuration for treemacs
  (add-hook 'treemacs-mode-hook 'treemacs--disable-fringe-indicator)

  ;; Settings for org-mode
  (with-eval-after-load 'org
    ;; Load org-setting here
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
    ;; (setq org-ref-default-bibliography '("/Users/therimalaya/Dropbox/Papers/BibTex/03-Prediction-Comparison.bib")
    (setq
     org-ref-default-bibliography '("~/Dropbox/Papers/00-Thesis/References.bib")
     org-ref-pdf-directory "/Users/therimalaya/Dropbox/Papers/References/"
     bibtex-completion-pdf-field "file"
     bibtex-completion-format-citation-functions
     '((default . bibtex-completion-format-citation-default)
       (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
       (latex-mode . bibtex-completion-format-citation-cite)
       (org-mode . bibtex-completion-format-citation-org-link-to-PDF))
     )
    (setq org-startup-indented t)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((R . t)
       (python . t)))
    )
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; Initialize outline minor mode along with AucTex (LaTeX) mode
  (add-hook 'LaTeX-mode-hook 'outline-minor-mode)

  ;; Making PDF-tool as default PDF viewer
  (setq TeX-view-program-list
        '(("emacs" "/usr/local/bin/emacsclient -n %o")
          ("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
  (setq TeX-view-program-selection '((output-pdf "emacs"))
        TeX-source-correlate-start-server t)
  (setq neo-theme 'nerd)
  (spacemacs/set-leader-keys-for-major-mode 'latex-mode "o" 'TeX-fold-dwim)
  (spacemacs/set-leader-keys-for-major-mode 'ess-mode
    "ba" 'ess-r-devtools-ask
    "bi" 'ess-r-devtools-install-package
    "bl" 'ess-r-devtools-load-package
    "bc" 'ess-r-devtools-check-package)

  ;; open r-markdown in markdown mode
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

  ;; Custom function to insert new chunk in r-markdown mode
  (defun rmarkdown-new-chunk (name)
    "Insert a new R chunk."
    (interactive "sChunk name: ")
    (insert "\n```{r " name "}\n")
    (save-excursion
      (newline)
      (insert "```\n")
      (previous-line)))

  ;; Settings for Ranger
  (setq ranger-show-hidden t)
  (ranger-override-dired-mode t)

  ;; Fix problem with expansion with mac keyboard
  (setq-default mac-right-option-modifier nil)
0
  ;; Fix for completion when sidebar is open
  (with-eval-after-load "helm"
    (defun helm-persistent-action-display-window (&optional split-onewindow)
      "Return the window that will be used for persistent action.
        If SPLIT-ONEWINDOW is non-`nil' window is split in persistent action."
      (with-helm-window
        (setq helm-persistent-action-display-window (get-mru-window)))))

  ;; Key-binding for inserting new rmarkdown chunk
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "iC" 'rmarkdown-new-chunk)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "np" 'markdown-narrow-to-page)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "nb" 'markdown-narrow-to-block)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "ns" 'markdown-narrow-to-subtree)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "nr" 'narrow-to-region)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "nf" 'narrow-to-defun)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "nw" 'widen)

  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "lj" 'markdown-move-list-item-down)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "lk" 'markdown-move-list-item-up)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "lh" 'markdown-promote-list-item)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "ll" 'markdown-demote-list-item)

  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "hj" 'markdown-move-subtree-down)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "hk" 'markdown-move-subtree-item-up)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "hh" 'markdown-promote-subtree)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "hl" 'markdown-demote-subtree)

  ;; add outline minor mode in markdown-mode
  (add-hook 'markdown-mode-hook 'outline-minor-mode)

  ;; TeX fold mode in markdown-mode
  (add-hook 'markdown-mode-hook 'TeX-fold-mode)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "oe" 'TeX-fold-env)
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "oc" 'TeX-fold-clearout-item)

  ;; Key-binding for word wrapped
  (spacemacs/set-leader-keys "to" 'toggle-word-wrap)

  ;; Key-binding for expand snippets
  (define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)

  ;; Fixing Environment issue with R
  (setenv "LANG" "en_US.UTF-8")
  ;; (exec-path-from-shell-copy-env "LC_ALL")
  ;; (exec-path-from-shell-copy-env "LANG")

  ;; Automatically close buffer if successful
  (setq compilation-finish-function
        (lambda (buf str)
          (if (null (string-match ".*exited abnormally.*" str))
              ;;no errors, make the compilation window go away in a few seconds
              (progn
                (run-at-time
                 "2 sec" nil 'delete-windows-on
                 (get-buffer-create "*compilation*"))
                (message "No Compilation Errors!")))))

  ;; AucTex ask for master file
  (setq-default TeX-master nil) ; Query for master file.

  ;; Olivetti mode keybinding
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "to" 'olivetti-mode)
  ;; (add-hook 'poly-markdown+r-mode-hook (lambda() (olivetti-mode t)))
  (set 'olivetti-minimum-body-width 90)
  ;; (setq-mode-local 'markdown-mode 'olivetti-body-width 90)

  ;; Make ranger default
  (ranger-override-dired-mode t)

  ;; Prettify mode
  (global-prettify-symbols-mode 1)
  ;; (load-file "~/.emacs.d/private/fira-code-hack.el")

  ;; Fold-this bindings
  (spacemacs/set-leader-keys "of" 'fold-this)

  ;; Tab space for different modes
  (setq default-tab-width 2)

  ;; setting up common lisp path
  (setq inferior-lisp-program "/usr/local/bin/clisp")

  ;; Fix for evil search trigger
  (defun kill-minibuffer ()
    (interactive)
    (when (windowp (active-minibuffer-window))
      (evil-ex-search-exit)))

  (add-hook 'mouse-leave-buffer-hook #'kill-minibuffer)

  ;; React Configuration
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  ;; Some Shortcut for React Mode
  (spacemacs/set-leader-keys-for-major-mode 'react-mode "we" 'web-mode-element-end)
  (spacemacs/set-leader-keys-for-major-mode 'react-mode "wb" 'web-mode-element-beginning)
  (spacemacs/set-leader-keys-for-major-mode 'react-mode "ff" 'web-mode-fold-or-unfold)
  (spacemacs/set-leader-keys-for-major-mode 'react-mode "fl" 'hs-hide-level)
  (spacemacs/set-leader-keys-for-major-mode 'react-mode "fbs" 'hs-show-block)
  (spacemacs/set-leader-keys-for-major-mode 'react-mode "fbh" 'hs-hide-block)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
