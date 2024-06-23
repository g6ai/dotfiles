;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "G. Bai"
      user-mail-address "gdbaifdu@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "New York")
      doom-serif-font (font-spec :family "Latin Modern Mono"))
(setq doom-modeline-height 18)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)

;; Emacs Mac from Homebrew
;;(setq doom-theme 'doom-one-light)
;;(defun mac-apply-system-appearance ()
;;  (let ((appearance (plist-get (mac-application-state) :appearance)))
;;    (cond ((equal appearance "NSAppearanceNameAqua")
;;           (load-theme 'doom-one-light t)
;;           (disable-theme 'doom-grubvox))
;;          ((equal appearance "NSAppearanceNameDarkAqua")
;;           (load-theme 'doom-gruvbox t)
;;           (disable-theme 'doom-one-light))
;;          ((equal appearance nil)
;;           (load-theme 'doom-manegarm t)
;;           (custom-set-faces '(mode-line ((t (:background "#282828")))))))))
;;(add-hook 'after-init-hook 'mac-apply-system-appearance)
;;(add-hook 'mac-effective-appearance-change-hook 'mac-apply-system-appearance)

;; Emacs Plus from Homebrew
(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'doom-one-light t))
    ('dark (load-theme 'doom-gruvbox t))))
(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

(setq ns-use-native-fullscreen t)
(pixel-scroll-precision-mode t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-download-image-dir "images")  ; `org-download-image-dir` defaults to `org-directory'/.attach/

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

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

;; allow hash to be entered
(bind-keys* ("M-3" . (lambda () (interactive) (insert "#"))))

;; disable confirm-kill-emacs
(setq confirm-kill-emacs nil)

;; change company-complete-selection mappping
(with-eval-after-load 'evil
  (with-eval-after-load 'company
    (define-key company-active-map [return] nil)
    (define-key company-active-map (kbd "RET") nil)
    (evil-define-key nil company-active-map (kbd "C-f") #'company-complete-selection)))

;; doom-dashboard
(defun my/open-portal ()
  (interactive)
  (find-file (concat org-directory "beorg/portal.org")))
(map! :leader
      "o p" #'my/open-portal)
(setq +doom-dashboard-menu-sections
  '(("Open portal.org"
     :icon (nerd-icons-octicon "nf-oct-telescope" :face 'doom-dashboard-menu-title)
     :face (:inherit (doom-dashboard-menu-title bold))
     :action my/open-portal)
    ("Reload last session"
     :icon (nerd-icons-octicon "nf-oct-history" :face 'doom-dashboard-menu-title)
     :when (cond ((modulep! :ui workspaces)
                  (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                 ((require 'desktop nil t)
                  (file-exists-p (desktop-full-file-name))))
     :face (:inherit (doom-dashboard-menu-title bold))
     :action doom/quickload-session)))
(defun doom-dashboard-draw-ascii-banner-fn ()
  (let* ((banner
          '("        __            __"
            ".-----.|  |--..---.-.|__|"
            "|  _  ||  _  ||  _  ||  |"
            "|___  ||_____||___._||__|"
            "|_____|"
            ""
            "   D O O M   E M A C S"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat
                 line (make-string (max 0 (- longest-line (length line)))
                                   32)))
               "\n"))
     'face 'doom-dashboard-banner)))

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
  ;; with auto-saving enabled, do not delete trailing spaces on saving.
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

  ;; agenda
  (setq! org-agenda-files '("~/org/beorg" "~/org/beorg/daily"))

  ;; org-babel
  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((yaml . t)
     (emacs-lisp . nil)
     (matlab . t)))

  ;; Org-roam
  (setq org-roam-directory (concat org-directory "beorg/"))
  (defun my/org-roam-node-insert ()
    (interactive)
    (my/insert-after 'org-roam-node-insert))
  (map! :leader
        "n r i" #'my/org-roam-node-insert)
  (setq +org-roam-open-buffer-on-find-file nil)
  (setq org-roam-capture-templates '(("d" "default" plain "%?"
                                      :target (file+head "${slug}.org"
                                                         "#+title: ${title}\n")
                                      :unnarrowed t)))
  (setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* TODO %<%R> %?"
         :target (file+head "%<%Y%m%d>.org"
                            "#+title: %<%d %b %Y>\n"))))
  (customize-set-variable 'org-extend-today-until 05)

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
          org-roam-ui-open-on-start t))

  ;; Citar
  (setq! citar-bibliography '("~/Zotero/my_library.bib"))
  (setq! citar-notes-paths '("~/org/beorg/citar/"))
  (setq! citar-file-open-function 'org-open-file)
  (setq! citar-templates
         '((main . "${author editor:36}     ${date year issued:4}     ${title:48}")
           (suffix . "          ${=key= id:24}    ${=type=:12}    ${tags keywords:*}")
           (preview . "${author editor} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
           (note . "${=key=}\n\n${=type=}: =${title}=")))
  (setq! citar-symbols
         `((file ,(nerd-icons-faicon "nf-fa-file_o" :face 'nerd-icons-green :v-adjust -0.1) . " ")
           (note ,(nerd-icons-mdicon "nf-md-note_edit" :face 'nerd-icons-blue :v-adjust -0.3) . " ")
           (link ,(nerd-icons-octicon "nf-oct-link" :face 'nerd-icons-orange :v-adjust 0.01) . " ")))
  (setq! citar-symbol-separator "  ")
  (defun my/org-cite-insert ()
    (interactive)
    (my/insert-after 'org-cite-insert))
  (map! :leader
        "m @" #'my/org-cite-insert)

  ;; org-download
  (setq org-download-method 'directory)
  (setq org-download-link-format "#+ATTR_ORG: :width 500\n[[download:%s]]\n")

  ;; misc
  (map! :leader
        "b g" #'org-mark-ring-goto)
  (map! :leader
        "\\" #'org-toggle-pretty-entities)
  (defun my/org-insert-link ()
    (interactive)
    (my/insert-after 'org-insert-link))
  (map! :leader
        "m l l" #'my/org-insert-link))
