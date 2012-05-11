Exec {
  path => "/usr/local/nginx/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}
include nginx
include passenger
include catchlater
