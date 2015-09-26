;;; -*-Emacs-Lisp-*-
(setq load-path (append '("~/.emacs.d/elpa") load-path))
;;;(setq load-path (append '("~/opt/local/share/emacs/site-lisp/") load-path))
(setq load-path (append '("/usr/local/share/gtags/") load-path))

;;; package manager
(when (> emacs-major-version 23)
(require 'package))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(global-set-key "\C-h" 'delete-backward-char)

;;;
(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    auto-complete
    ;;auto-complete-config
    ;;ac-company
    ;;gtags-mode
    sr-speedbar
    color-theme
    ansi-color
    yasnippet
    highlight-symbol
    git-blame
    ;flymake
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
;;; デバッグ時は以下をコメントアウト
;;; (setq debug-on-error t)
(menu-bar-mode 0)
(column-number-mode t)

;;; DEL と BS を入れ換える
;(load "term/keyswap")
(setq-default c-indent-tabs-mode nil     ; Pressing TAB should cause indentation
	      c-indent-level 4         ; A TAB is equivilent to four spaces
	      c-argdecl-indent 0       ; Do not indent argument decl's extra
	      c-tab-always-indent t
	      backward-delete-function nil) ; DO NOT expand tabs when deleting
;; for c-mode
;;(defun my-c-mode-common-hook ()
;;)
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;(setq c-indent-level 4)
;;(setq indent-tabs-mode nil)
(setq next-line-add-newlines nil)

;;; set key [お好きなように]
(global-set-key "\C-x\C-j" 'goto-line)
;(global-set-key "\M-/" 'auto-fill-mode)
(global-set-key "\M-r" 'redraw-display)
(global-set-key "\C-x\C-[" 'repeat-complex-command)

;;; 漢字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


; east asian ambiguous character table
(defun east-asian-ambiguous-characters ()
  '(
    (#x00A1 . #x00A1) (#x00A4 . #x00A4) (#x00A7 . #x00A8)
    (#x00AA . #x00AA) (#x00AD . #x00AE) (#x00B0 . #x00B4)
    (#x00B6 . #x00BA) (#x00BC . #x00BF) (#x00C6 . #x00C6)
    (#x00D0 . #x00D0) (#x00D7 . #x00D8) (#x00DE . #x00E1)
    (#x00E6 . #x00E6) (#x00E8 . #x00EA) (#x00EC . #x00ED)
    (#x00F0 . #x00F0) (#x00F2 . #x00F3) (#x00F7 . #x00FA)
    (#x00FC . #x00FC) (#x00FE . #x00FE) (#x0101 . #x0101)
    (#x0111 . #x0111) (#x0113 . #x0113) (#x011B . #x011B)
    (#x0126 . #x0127) (#x012B . #x012B) (#x0131 . #x0133)
    (#x0138 . #x0138) (#x013F . #x0142) (#x0144 . #x0144)
    (#x0148 . #x014B) (#x014D . #x014D) (#x0152 . #x0153)
    (#x0166 . #x0167) (#x016B . #x016B) (#x01CE . #x01CE)
    (#x01D0 . #x01D0) (#x01D2 . #x01D2) (#x01D4 . #x01D4)
    (#x01D6 . #x01D6) (#x01D8 . #x01D8) (#x01DA . #x01DA)
    (#x01DC . #x01DC) (#x0251 . #x0251) (#x0261 . #x0261)
    (#x02C4 . #x02C4) (#x02C7 . #x02C7) (#x02C9 . #x02CB)
    (#x02CD . #x02CD) (#x02D0 . #x02D0) (#x02D8 . #x02DB)
    (#x02DD . #x02DD) (#x02DF . #x02DF) (#x0300 . #x036F)
    (#x0391 . #x03A9) (#x03B1 . #x03C1) (#x03C3 . #x03C9)
    (#x0401 . #x0401) (#x0410 . #x044F) (#x0451 . #x0451)
    (#x2010 . #x2010) (#x2013 . #x2016) (#x2018 . #x2019)
    (#x201C . #x201D) (#x2020 . #x2022) (#x2024 . #x2027)
    (#x2030 . #x2030) (#x2032 . #x2033) (#x2035 . #x2035)
    (#x203B . #x203B) (#x203E . #x203E) (#x2074 . #x2074)
    (#x207F . #x207F) (#x2081 . #x2084) (#x20AC . #x20AC)
    (#x2103 . #x2103) (#x2105 . #x2105) (#x2109 . #x2109)
    (#x2113 . #x2113) (#x2116 . #x2116) (#x2121 . #x2122)
    (#x2126 . #x2126) (#x212B . #x212B) (#x2153 . #x2154)
    (#x215B . #x215E) (#x2160 . #x216B) (#x2170 . #x2179)
    (#x2190 . #x2199) (#x21B8 . #x21B9) (#x21D2 . #x21D2)
    (#x21D4 . #x21D4) (#x21E7 . #x21E7) (#x2200 . #x2200)
    (#x2202 . #x2203) (#x2207 . #x2208) (#x220B . #x220B)
    (#x220F . #x220F) (#x2211 . #x2211) (#x2215 . #x2215)
    (#x221A . #x221A) (#x221D . #x2220) (#x2223 . #x2223)
    (#x2225 . #x2225) (#x2227 . #x222C) (#x222E . #x222E)
    (#x2234 . #x2237) (#x223C . #x223D) (#x2248 . #x2248)
    (#x224C . #x224C) (#x2252 . #x2252) (#x2260 . #x2261)
    (#x2264 . #x2267) (#x226A . #x226B) (#x226E . #x226F)
    (#x2282 . #x2283) (#x2286 . #x2287) (#x2295 . #x2295)
    (#x2299 . #x2299) (#x22A5 . #x22A5) (#x22BF . #x22BF)
    (#x2312 . #x2312) (#x2460 . #x24E9) (#x24EB . #x254B)
    (#x2550 . #x2573) (#x2580 . #x258F) (#x2592 . #x2595)
    (#x25A0 . #x25A1) (#x25A3 . #x25A9) (#x25B2 . #x25B3)
    (#x25B6 . #x25B7) (#x25BC . #x25BD) (#x25C0 . #x25C1)
    (#x25C6 . #x25C8) (#x25CB . #x25CB) (#x25CE . #x25D1)
    (#x25E2 . #x25E5) (#x25EF . #x25EF) (#x2605 . #x2606)
    (#x2609 . #x2609) (#x260E . #x260F) (#x2614 . #x2615)
    (#x261C . #x261C) (#x261E . #x261E) (#x2640 . #x2640)
    (#x2642 . #x2642) (#x2660 . #x2661) (#x2663 . #x2665)
    (#x2667 . #x266A) (#x266C . #x266D) (#x266F . #x266F)
    (#x273D . #x273D) (#x2776 . #x277F) (#xE000 . #xF8FF)
    (#xFE00 . #xFE0F) (#xFFE0 . #xFFE6) (#xFFFD . #xFFFD)))
 
; setting function
(defun set-east-asian-ambiguous-width (width)
  (cond ((= emacs-major-version 22) (set-east-asian-ambiguous-width-22 width))
        ((> emacs-major-version 22) (set-east-asian-ambiguous-width-23 width))))
 
; for emacs 22
(defun set-east-asian-ambiguous-width-22 (width)
  (if (= width 2)
    (utf-translate-cjk-set-unicode-range (east-asian-ambiguous-characters))))
 
; for over 23 (checked work in emacs 24)
(defun set-east-asian-ambiguous-width-23 (width)
  (while (char-table-parent char-width-table)
         (setq char-width-table (char-table-parent char-width-table)))
  (let ((table (make-char-table nil)))
    (dolist (range (east-asian-ambiguous-characters))
      (set-char-table-range table range width))
    (optimize-char-table table)
    (set-char-table-parent table char-width-table)
    (setq char-width-table table)))
    
(set-east-asian-ambiguous-width 2)

;; GIT
; contrib/emacs/{git.el,git-blame.el,vc-git.el} をパスの通ったところにコピー
(require 'git-blame) 
; ログを UTF-8 にして，git に渡す
(add-to-list 'process-coding-system-alist '("git" . utf-8))

(setq use-kuten-for-period nil)
(setq use-touten-for-comma nil)
(setq enable-double-n-syntax t)
;;
;; for text-mode
;;
;; text-mode では、自動的に auto-fill-mode にする
;(setq text-mode-hook
;      '(lambda ()
;	 (auto-fill-mode 1)))
;; auto-fill-mode では、各行を 70 文字以内に詰める
(set-default 'fill-column 60)

(global-font-lock-mode 1)


;;settings around auto-complete
(require 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)

;;(require 'ac-company)


;;(add-to-list 'auto-mode-alist (cons  "\\.\\(mq\\|q\\|bq\\)\\'" 'q-mode))
;;(autoload 'q-mode "q-mode" nil t)
;;(add-hook 'q-mode-hook 
;;         (lambda ()
;;           (run-with-idle-timer 1.0 t 'get-operand-tip)))

;;(ac-company-define-source ac-source-company-xcode company-xcode)
;;(ac-company-define-source ac-source-company-gtags company-gtags)

(setq ac-modes (append ac-modes '(c-mode)))
(setq ac-modes (append ac-modes '(c++-mode)))

;;(add-hook 'c-mode-hook
;;	  (lambda ()
;;	    add-to-list 'ac-sources 'ac-source-company-gtags)
;;	  )

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)

(setq ac-auto-start nil)

(ac-set-trigger-key "TAB")

(setq ac-candidate-max 20)


(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
	 (local-set-key "\M-t" 'gtags-find-tag)
	 (local-set-key "\M-r" 'gtags-find-rtag)
	 (local-set-key "\M-s" 'gtags-find-symbol)
	 (local-set-key "\M-p" 'gtags-pop-stack)
))

(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (gtags-mode 1)
	     (gtags-make-complete-list)
	     (c-set-style "stroustrup")
	     (setq-default tab-width 4
			   c-basic-offset 4)

))

(require 'sr-speedbar)
(global-set-key (kbd "C-c RET") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil) 

(require 'color-theme)
(color-theme-initialize)
(color-theme-tty-dark)

;(setq haskell-font-lock-symbols t)


;(add-to-list 'load-path "~/.emacs.d/apel")

;(add-to-list 'load-path "~/.emacs.d/elscreen")

;(setq elscreen-prefix-key "\C-e")
;(load "elscreen" "Elscreen" t)

;(require 'tabbar)
(setq windmove-wrap-around t)
(windmove-default-keybindings)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;;(load "clang-format.el")
;;(global-set-key "\C-c\C-f" 'clang-format-region)


(require 'cl)
;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; yasnippetを置いているフォルダにパスを通す
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/yasnippet"))
(require 'yasnippet)
;; ~/.emacs.d/にsnippetsというフォルダを作っておきましょう
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;; 作成するスニペットはここに入る
        "~/.emacs.d/yasnippet/snippets" ;; 最初から入っていたスニペット(省略可能)
        ))
(yas-global-mode 1)

;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;; (setqだとtermなどで干渉問題ありでした)
;; もちろんTAB以外でもOK 例えば "C-;"とか
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(js2-basic-offset 2)
 '(json-reformat:indent-width 2)
 '(mail-indentation-spaces 2)
 '(yas-trigger-key "TAB"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

(setq erc-server-coding-system '(utf-8 . utf-8))

(require 'highlight-symbol)
(global-set-key (kbd "C-c h") 'highlight-symbol-at-point)
;(global-set-key [f3] 'highlight-symbol-next)
;(global-set-key [(shift f3)] 'highlight-symbol-prev)
;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;(require 'cl-lib)
(require 'flymake)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:inherit error :underline t)))))

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(eval-after-load "js2-mode"
  '(progn
     (setq-default js2-basic-offset 2) ; 2 spaces for indentation (if you prefer 2 spaces instead of default 4 spaces for tab)

     ;; add from jslint global variable declarations to js2-mode globals list
     ;; modified from one in http://www.emacswiki.org/emacs/Js2Mode
     (defun my-add-jslint-declarations ()
       (when (> (buffer-size) 0)
	 (let ((btext (replace-regexp-in-string
		       (rx ":" (* " ") "true") " "
		       (replace-regexp-in-string
			(rx (+ (char "\n\t\r "))) " "
			;; only scans first 1000 characters
			(save-restriction (widen) (buffer-substring-no-properties (point-min) (min (1+ 1000) (point-max)))) t t))))
	   (mapc (apply-partially 'add-to-list 'js2-additional-externs)
		 (split-string
		  (if (string-match (rx "/*" (* " ") "global" (* " ") (group (*? nonl)) (* " ") "*/") btext)
		      (match-string-no-properties 1 btext) "")
		  (rx (* " ") "," (* " ")) t))
	   )))
     (add-hook 'js2-post-parse-callbacks 'my-add-jslint-declarations)))
