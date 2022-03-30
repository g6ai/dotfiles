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
;; Emacs Mac from Homebrew
;;(setq doom-theme 'doom-one-light)
(defun mac-apply-system-appearance ()
  (let ((appearance (plist-get (mac-application-state) :appearance)))
    (cond ((equal appearance "NSAppearanceNameAqua")
           (load-theme 'doom-one-light t)
           (disable-theme 'doom-vibrant))
          ((equal appearance "NSAppearanceNameDarkAqua")
           (load-theme 'doom-vibrant t)
           (disable-theme 'doom-one-light))
          ((equal appearance nil)
           (load-theme 'doom-manegarm t)
           (custom-set-faces '(mode-line ((t (:background "#282828")))))))))
(add-hook 'after-init-hook 'mac-apply-system-appearance)
(add-hook 'mac-effective-appearance-change-hook 'mac-apply-system-appearance)
;; Emacs Plus from Homebrew
;; (defun my/apply-theme (appearance)
;;   "Load theme, taking current system APPEARANCE into consideration."
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (pcase appearance
;;     ('light (load-theme 'doom-one-light t))
;;     ('dark (load-theme 'doom-vibrant t))))
;; (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

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
;; Default fringe-mode value in Doom is 4, too small for fringe indicators.
(after! git-gutter-fringe
  (fringe-mode 8))

;; tty mouse
(unless window-system
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

;; auto-saving
(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (call-interactively #'save-buffer)))

;; directory
(setq directory-abbrev-alist
      '(("^/Users/gbai/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org" . "/Users/gbai/org/beorg")
        ("^/Users/gbai/Documents/GitHub/org-node" . "/Users/gbai/org/org-node")))

;; Magit
(setq magit-ediff-dwim-show-on-hunks t)

;; fix insert in Evil
(defun my/is-end-of-line ()
  (let* ((pos (current-column))
         (end-pos (save-excursion
                    (evil-end-of-line)
                    (current-column))))
    (eq pos end-pos)))
(defun my/compare-with-end-of-word ()
  (let* ((pos (current-column))
         (end-pos (save-excursion
                    (evil-backward-word-begin)
                    (evil-forward-word-end)
                    (current-column))))
    (- pos end-pos)))
(defun my/point-is-space ()
  (char-equal ?\s (char-after)))
(defun my/insert-after (func)
  (interactive)
  (let ((relative-loc (my/compare-with-end-of-word)))
    (cond ((my/is-end-of-line)
           (end-of-line)
           (call-interactively func))
          ((eq 0 relative-loc)
           (evil-forward-char)
           (call-interactively func))
          ((and (> 0 relative-loc) (not (my/point-is-space)))
           (evil-forward-word-end)
           (if (my/is-end-of-line)
               (end-of-line)
             (evil-forward-char))
           (call-interactively func))
          (t
           (call-interactively func)))))

;; Org-mode
(after! org
  ;; auto-saving
  ;;(add-hook 'org-trigger-hook 'save-buffer)
  (defun org-save-when-done (trigger-plist)
    (let ((type (plist-get trigger-plist :type))
          (pos (plist-get trigger-plist :position))
          (from (plist-get trigger-plist :from))
          (to (plist-get trigger-plist :to)))
      (when (equal type 'todo-state-change)
        (when (and (member from org-not-done-keywords)
                   (member to org-done-keywords))
          (save-buffer)))))
  (add-hook 'org-trigger-hook 'org-save-when-done)
  ;; With auto-saving enabled, do not delete trailing spaces on saving.
  (add-hook 'org-mode-hook (lambda () (ws-butler-mode -1)))

  ;; M-RET
  (defun org-meta-return (&optional arg)
    (interactive "P")
    (org-check-before-invisible-edit 'insert)
    (or (run-hook-with-args-until-success 'org-metareturn-hook)
        (call-interactively (cond (arg #'org-insert-heading)
                                  ((org-at-table-p) #'org-table-wrap-region)
                                  ((org-in-item-p) #'+org/insert-item-below)
                                  (t #'org-insert-heading)))))

  ;; indentation
  (add-hook 'org-mode-hook (lambda () (electric-indent-local-mode -1)))

  ;; plain lists
  (setq org-list-demote-modify-bullet '(("-" . "+") ("+" . "*") ("*" . "-")))

  ;; pretty
  ;; org-superstar
  ;; headline-bullets-list: ◉ ◎ ◈ ◇
  (setq org-superstar-headline-bullets-list '(9673 9678 9672 9671))
  ;; headline-bullets-list: ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
  ;;(setq org-superstar-headline-bullets-list '(9776 9777 9778 9779 9780 9781 9782 9783))
  ;; item-bullet-alist: (?- . ?⁃) (?+ . ?‣) (?* . ?•)
  (setq org-superstar-item-bullet-alist '((?- . 8259)
                                          (?+ . 8227)
                                          (?* . 8226)))

  ;; TODO
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  ;; org-habit
  (add-to-list 'org-modules 'org-habit)

  ;; LaTeX
  (setq org-latex-create-formula-image-program 'dvisvgm)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.75))
  (setq org-format-latex-header "\\documentclass{article}
\\usepackage[usenames]{color}
\[PACKAGES]
\[DEFAULT-PACKAGES]
\\pagestyle{empty}             % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}
% My settings
\\usepackage{siunitx}
\\sisetup{separate-uncertainty}
\\DeclareSIUnit\\angstrom{Å}
\\DeclareSIUnit\\bar{bar}
\\DeclareSIUnit\\torr{Torr}
\\DeclareSIUnit\\cycle{cycle}
\\usepackage[version=4]{mhchem}")
  (setq org-highlight-latex-and-related '(latex script entities))

  ;; misc
  (map! :leader
        "b g" #'org-mark-ring-goto)
  (map! :leader
        "\\" #'org-toggle-pretty-entities)

  ;; agenda
  (setq org-agenda-directory org-directory)

  ;; org-journal
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
  ;;(customize-set-variable 'org-journal-file-header "#+TITLE: Monthly Journal\n#+STARTUP: folded")
  (defun org-journal-file-header-func (time)
    "Custom function to create journal header."
    (concat
     (pcase org-journal-file-type
       (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
       (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
       (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
       (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))
  (setq org-journal-file-header 'org-journal-file-header-func)
  (customize-set-variable 'org-journal-enable-agenda-integration t)

  ;; Org-roam
  (setq org-roam-directory (concat org-directory "beorg/"))
  (defun my/org-roam-node-insert ()
    (interactive)
    (my/insert-after 'org-roam-node-insert))
  (map! :leader
        "n r i" #'my/org-roam-node-insert)
  (setq +org-roam-open-buffer-on-find-file nil)

  ;; Org-roam-UI
  (use-package! websocket
    :after org-roam)

  (use-package! org-roam-ui
    :after org-roam ;; or :after org
    ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
    ;;         a hookable mode anymore, you're advised to pick something yourself
    ;;         if you don't care about startup time, use
    ;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t
          org-roam-capture-templates '(("d" "default" plain "%?"
                                        :target (file+head "${slug}.org"
                                                           "#+title: ${title}\n")
                                        :unnarrowed t))))

  ;; Citar
  (setq! citar-bibliography '("~/Zotero/my_library.bib"))
  (setq! citar-notes-paths '("~/org/beorg/"))
  (setq! citar-file-open-function 'org-open-file)
  (setq! citar-templates
         '((main . "${author editor:36}     ${date year issued:4}     ${title:48}")
           (suffix . "          ${=key= id:24}    ${=type=:12}    ${tags keywords:*}")
           (note . "${=key=}\n\n${=type=}: =${title}=")))
  (setq! citar-symbols
         `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
           (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
           (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
  (setq! citar-symbol-separator "  ")
  (defun my/org-cite-insert ()
   (interactive)
   (my/insert-after 'org-cite-insert))
  (map! :leader
        "m @" #'my/org-cite-insert))
