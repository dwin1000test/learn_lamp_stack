require 'serverspec'
require 'pathname'
require 'serverspec-firewalld-resources/lib/serverspec-firewalld-resources.rb'

set :backend, :exec

set :path, '/bin:/usr/local/bin:$PATH'
