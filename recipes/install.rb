#
# Cookbook Name:: cat-mongodb
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
yum_repository 'mongodb-org-3.2' do
  description 'MongoDB Repository'
  baseurl 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86/'
  gpgcheck true
  gpgkey 'https://www.mongodb.org/static/pgp/server-3.2.asc'
  enabled true
  action :create
