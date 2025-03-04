;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

;; evil-tutor
(package! evil-tutor)

;; Org-roam
(unpin! org-roam)
(package! org-roam-ui)

;; Magit
;;(package! transient
;;      :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440"
;;      :recipe (:host github :repo "magit/transient"))
;;
;;(package! with-editor
;;          :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab"
;;          :recipe (:host github :repo "magit/with-editor"))

;; Gruvbox
(package! gruvbox-theme)

;;(package! jupyter :pin "16cbda79167b4e2f2c6b61b218658f0f660d97f9")

;; phscroll
(package! phscroll :recipe (:host github :repo "misohena/phscroll"))

;; stripe-buffer
(package! stripe-buffer :recipe (:host github :repo "sabof/stripe-buffer"))

;; ox-chameleon
;;(package! ox-chameleon :recipe (:host github :repo "tecosaur/ox-chameleon"))

;; exec-path-from-shell
(package! exec-path-from-shell :recipe (:host github :repo "purcell/exec-path-from-shell"))
