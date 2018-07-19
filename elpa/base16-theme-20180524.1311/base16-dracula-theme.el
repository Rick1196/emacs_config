;; base16-dracula-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-dracula-colors
  '(:base00 "#282936"
    :base01 "#3a3c4e"
    :base02 "#626483"
    :base03 "#4d4f68"
    :base04 "#62d6e8"
    :base05 "#e9e9f4"
    :base06 "#f1f2f8"
    :base07 "#f7f7fb"
    :base08 "#ea51b2"
    :base09 "#b45bcf"
    :base0A "#ebff87"
    :base0B "#00f769"
    :base0C "#a1efe4"
    :base0D "#62d6e8"
    :base0E "#b45bcf"
    :base0F "#00f769")
  "All colors for Base16 Dracula are defined here.")

;; Define the theme
(deftheme base16-dracula)

;; Add all the faces to the theme
(base16-theme-define 'base16-dracula base16-dracula-colors)

;; Mark the theme as provided
(provide-theme 'base16-dracula)

(provide 'base16-dracula-theme)

;;; base16-dracula-theme.el ends here
