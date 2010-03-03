;; color-theme
(color-theme-wombat)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; set tabs to 4 spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; auto-fill
(setq fill-column 78)

;; platform-specific stuff
(when (eq system-type 'darwin)
  ;; use command key as alt key
  (setq mac-command-modifier 'meta)
  (setq exec-path (cons "/opt/local/bin" exec-path)))

;; flyspell-mode
(setq-default ispell-program-name "aspell")

;; EMMS
(require 'emms-setup)
(emms-standard)
(emms-default-players)

;; column-number-mode
(column-number-mode t)

;; term-mode
(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

;; goto-last-change
(autoload 'goto-last-change "goto-last-change"
  "Set point to the position of the last change." t)
(global-set-key "\C-x\C-\\" 'goto-last-change)

;; reloads the current file
(defun reload-file ()
  "Reloads the current file."
  (interactive)
  (find-file (buffer-name)))

;; print a ascii table
(defun ascii-table ()
  "Print the ascii table."
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

;; convert from DOS > UNIX
(defun dos2unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; convert from UNIX > DOS
(defun unix2dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

;; word count
;; combine of http://www.emacswiki.org/emacs/WordCount and
;; http://www.neverfriday.com/sweetfriday/2008/06/emacs-tip-word-counting-with-a.html
(defun wc ()
  (interactive)
  (let ((start (if mark-active (region-beginning) (point-min)))
        (end (if mark-active (region-end) (point-max))))
    (message "Word count: %s" (how-many "\\w+" start end))))

;; toggle show trailing whitespace
;; from http://www.emacswiki.org/emacs/DaveBenjamin
(defun toggle-show-trailing-whitespace ()
  "Toggles the highlighting of trailing whitespace."
  (interactive)
  (set-variable 'show-trailing-whitespace (not show-trailing-whitespace)))

;; keyboard shortcuts
(global-set-key "\C-x\C-r" 'recentf-open-files)
(global-set-key (kbd "M-<return>") 'complete-tag)
(global-set-key (kbd "C-x t") 'ansi-term)

;; daemon
(server-start)
