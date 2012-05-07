class nginx {
  package {
    "nginx":
      ensure => present,
      before => File["/usr/local/nginx/nginx.conf"]
  }
  service {
    "nginx":
      ensure => true,
      enable => true,
      subscribe => File["/usr/local/nginx/nginx.conf"],
  }
  file {
    "/etc/init.d/nginx":
      owner => root,
      group => root,
      mode => 755,
      source => "puppet:///modules/nginx/"
    "/usr/local/nginx/nginx.conf":
      owner => root,
      group => root,
      mode  => 644,
      source => "puppet:///modules/nginx/nginx.conf";
    "/usr/local/nginx/sites-available/catchlater":
      owner => root,
      group => root,
      mode => 644,
      source => "puppet:///modules/nginx/vhost",
      notify => Service["nginx"],
      require => Package["nginx"];
    "/user/local/nginx/sites-enabled/catchlater":
      ensure => 'link',
      target => '/usr/local/nginx/sites-available/catchlater';
  }
}
