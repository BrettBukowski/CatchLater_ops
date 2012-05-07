class nginx {
  package {
    "nginx":
      ensure => present
  }
  service {
    "nginx":
      ensure => true,
      enable => true
  }
  file {
    "/usr/local/nginx/nginx.conf":
      owner => root,
      group => root,
      mode  => 644,
      source => "puppet:///modules/nginx/nginx.conf";
    "/usr/local/nginx/sites-available/catchlater":
      owner => root,
      group => root,
      mode => 644,
      source => "puppet:///modules/nginx/vhost";
    "/user/local/nginx/sites-enabled/catchlater":
      ensure => 'link',
      target => '/usr/local/nginx/sites-available/catchlater';
  }
}
