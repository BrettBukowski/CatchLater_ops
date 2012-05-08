class catchlater {
  file {
    ["/var/catchlater/",
     "/var/catchlater/shared/",
     "/var/catchlater/shared/config/"]:
      ensure => directory,
      owner => root,
      owner => root,
      mode => 775
  }
  package {
    "bundler":
      provider => gem
  }
}
