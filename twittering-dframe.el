;;; twittering-dframe.el --- dedicate frame for twittering-mode

;; Copyright (C) 2011  Hironori OKAMOTO

;; Author: Hironori OKAMOTO <k.ten87@gmail.com>
;; Keywords: frames, hypermedia

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(require 'dframe)
(require 'twittering-mode)

(defcustom twittering-dframe-frame-parameter
  '((buffer-predicate . twittering-buffer-p)
    (left-fringe . 0)
    (minibuffer . nil)
    (title . "twittering")
    (unsplittable . t))
  ""
  :type '(alist))

(defvar twittering-dframe-buffer)
(defvar twittering-dframe-cached-frame nil)
(defvar twittering-dframe-frame nil)

(defun twittering-dframe-frame-mode (&optional arg)
  (interactive "P")
  (save-window-excursion
    (twit))
  (setq twittering-dframe-buffer (car twittering-buffer-info-list))
  (dframe-frame-mode arg
		     'twittering-dframe-frame
		     'twittering-dframe-cached-frame
		     'twittering-dframe-buffer
		     "Twittering"
		     nil
		     twittering-dframe-frame-parameter))

(provide 'twittering-dframe)
;;; twittering-dframe.el ends here
