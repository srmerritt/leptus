(add-to-list 'load-path "elisp")
(add-to-list 'load-path "elisp/org-mode/lisp")

(require 'htmlize)
(require 'org-publish)
(require 'ox-html)

(setq org-publish-project-alist
      '(
        ("leptus-docs"
         :base-directory "./tmp"
         :base-extension "org"
         :publishing-directory "./public_html"
         :recursive t
         :publishing-function org-html-publish-to-html
         :exclude "README.org"
         :headline-levels 4
         )
        ))
(org-publish "leptus-docs")
