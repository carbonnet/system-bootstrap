# get the jdk and rebel scala launcher


package {'openjdk-7-jdk':
  ensure => present
}

file {'/home/ubuntu/bin':
  ensure => 'directory'
}
->
exec {"curl -o /home/ubuntu/bin/sbt -s https://raw.github.com/paulp/sbt-extras/master/sbt":
  path => [
    '/usr/bin'
  ],
  creates => "/home/ubuntu/bin/sbt"
}
->
file {'sbt':
  path => '/home/ubuntu/bin/sbt',
  ensure => 'present',
  mode => 0755
}
  
