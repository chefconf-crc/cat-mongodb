resource_name :mongodb

property :name, RubyType, default: 'value'

load_current_value do
 yum_repository 'mongo-org-3.2' do
  description 'MongoDB Repository'
  baseurl 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86/'
  gpgcheck true
  gpgkey 'https://www.mongodb.org/static/pgp/server-3.2.asc'
  enable true
  action :create
 end
end

action :install do
 yum_package 'mongodb-org' do
  action :install
 end
end

action :start do
 action [ :enable, :start ]
end
