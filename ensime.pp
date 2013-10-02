# get Emacs 24, scala-mode and ensime


package {'emacs24':
  ensure => present
}

$el = "(require 'package)
(add-to-list 'package-archives
             '(\"melpa\" . \"http://melpa.milkbox.net/packages/\") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))
"

$en = "(add-to-list 'load-path \"/home/ubuntu/ensime-2.10.0-0.9.8.8/src/main/elisp/\")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
"

file {'/home/ubuntu/.emacs':
  content => "$el$en"
}

exec {"curl -L -o /home/ubuntu/v2.10.0-0.9.8.8.tar.gz -s https://github.com/aemoncannon/ensime/archive/v2.10.0-0.9.8.8.tar.gz":
  path => [
    '/usr/bin'
  ],
  creates => "/home/ubuntu/v2.10.0-0.9.8.8.tar.gz"
}
->
exec {"tar xvfz /home/ubuntu/v2.10.0-0.9.8.8.tar.gz":
  path => [
    '/bin'
  ]
}

