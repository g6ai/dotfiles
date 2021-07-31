;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "G. Bai"
      user-mail-address "gdbaifdu@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font"))
(setq doom-modeline-height 18)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; frame
;;(add-to-list 'initial-frame-alist '(fullscreen . fullboth))
;;(setq ns-use-native-fullscreen t)
(setq initial-frame-alist '((left . 0.5) (top . 0.5) (width . 96) (height . 36)))

;; Auto-Saving
(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (call-interactively #'save-buffer)))

;; directory
(setq directory-abbrev-alist
      '(("^/Users/gbai/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org" . "/Users/gbai/org/beorg")
        ("^/Users/gbai/Documents/GitHub/org-node" . "/Users/gbai/org/org-node")))

;; indentation
(add-hook! 'org-mode-hook (electric-indent-local-mode -1))

;; TODO
(setq org-log-done 'time)

;; org-agenda
(setq org-agenda-directory org-directory)

;; org-journal
(after! org-journal
  (customize-set-variable 'org-journal-dir (concat org-directory "beorg/"))
  ;;(customize-set-variable 'org-journal-file-format "%Y%m%dW%V.org")
  (customize-set-variable 'org-journal-file-format "%Y%m.org")
  (customize-set-variable 'org-extend-today-until 05)
  (customize-set-variable 'org-journal-file-type 'monthly)
  (customize-set-variable 'org-journal-date-format "%A, %d %B %Y")
  ;;(customize-set-variable 'org-journal-date-prefix "* ")
  (customize-set-variable 'org-journal-time-format "TODO %R ")
  ;;(customize-set-variable 'org-journal-time-prefix "** ")
  ;;(customize-set-variable 'org-journal-file-header "#+TITLE: Weekly Journal\n#+STARTUP: folded")
  (customize-set-variable 'org-journal-file-header "#+TITLE: Monthly Journal\n#+STARTUP: folded")
  (customize-set-variable 'org-journal-enable-agenda-integration t))
