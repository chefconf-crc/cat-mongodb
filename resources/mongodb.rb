resource_name :mongodb

action :install do
  yum_repository 'mongodb-org-3.2' do
    description 'MongoDB Repository'
    baseurl 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/'
    gpgcheck true
    gpgkey 'https://www.mongodb.org/static/pgp/server-3.2.asc'
    enabled true
    action :create
  end

  yum_package 'mongodb-org' do
    action :install
  end

  service 'mongod' do
    action [:enable, :start]
  end
end

action :uninstall do
  service 'mongod' do
    action :stop
  end

  yum_package 'mongodb-org' do
    action :remove
  end
end
