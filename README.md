#+title: Emacs Configuartion

* Package Instalation

** Melpa
I add this to my init.el file for melpa suport
#+begin_src emacs-lisp
   (require 'package)
   (add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/" ) t)
   (package-initialize)
#+end_src

* Looks and Themes

Here I lay out what I customizations I made for emacs to looks as he does

** Showing line number at the left
The pacage is cold *linum*

#+begin_src emacs-lisp
   (require 'linum)
   (global-linum-mode)
#+end_src

** Atom Theme
This is a package-theme that make emacs look like atom
called  *Atom Dark Theme*, by doing this

#+begin_src emacs-lisp
   M-x package-install
   atom-one-dark-them

   M-x customize-thems
#+end_src

Then Sellect the theme you want (ex. atom one dark) and save changes

** Toolbar
Lastly we have to hide that ugly toolbar by writing the followng to
init.el

#+begin_src emacs-lisp
(tool-bar-mode -1)
#+end_src

* Org Mode

Now we're getting to the fun stuff, but firsts things firsts

** Indenting
We need to configure org-mode to indent properly the outlines

#+begin_src emacs-lisp
(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)
(put 'erase-buffer 'disabled nil)
#+end_src

** GTD : Getting Things Done

This could be a file on it self. I will refer to [[https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html][this post]] for more info.


* System Configuration

** Greek Keyboard
But I may want to take notes in greek. what do I do?
Don't worry here's how you do it.

Simply add this to your init.el file
#+begin_src emacs-lisp
(set-input-method "greek") ;; Use C-\
#+end_src

** $PATH
So you want to use terminal, shell and comple .org files to pdf?
The you should add the following to init.el

#+begin_src emacs-lisp
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
#+end_src