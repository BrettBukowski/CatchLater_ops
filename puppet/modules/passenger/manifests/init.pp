class passenger {
  exec {
    "/usr/local/bin/gem install passenger -v=3.0.12":
      user   => root,
      group  => root,
      alias  => "install_passenger",
      require => Package["nginx"],
      unless => "ls /usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.12/"
  }

  exec {
    "/usr/local/bin/passenger-install-nginx-module --auto":
      user => root,
      group => root,
      path => "/bin:/usr/bin:/usr/local/nginx/sbin/",
      alias => "passenger_nginx_module",
      unless => "ls /usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.12/ext/nginx/"
  }
}
