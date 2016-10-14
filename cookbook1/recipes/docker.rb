include_recipe 'docker::docker_service'
include_recipe 'docker::docker_image'
include_recipe 'docker::docker_container'


package 'docker-cont' do
  action :install
end

docker_service 'default' do
  action [:create, :start]
end

docker_image 'busybox' do
  action :pull
end

docker_container 'an echo server' do
  repo 'busybox'
  port '1234:1234'
  command "nc -ll -p 1234 -e /bin/cat"
end
