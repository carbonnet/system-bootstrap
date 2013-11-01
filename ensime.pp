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

$en = "(add-to-list 'load-path \"/home/ubuntu/ensime_2.10.0-0.9.8.9/elisp/\")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
"

file {'/home/ubuntu/.emacs':
  content => "$el$en"
}

exec {"curl -o /home/ubuntu/ensime.tar.gz -L https://www.dropbox.com/sh/ryd981hq08swyqr/ZiCwjjr_vm/ENSIME%20Releases/ensime_2.10.0-0.9.8.9.tar.gz":
  path => [
    '/usr/bin'
  ],
  creates => "/home/ubuntu/ensime.tar.gz"
}
->
exec {"tar xvfz /home/ubuntu/ensime.tar.gz":
  path => [
    '/bin'
  ]
}
->
exec {"chown ubuntu:ubuntu -R /home/ubuntu/ensime*":
  path => [
    '/bin'
  ]
}
