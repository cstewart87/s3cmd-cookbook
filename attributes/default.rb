#
# Cookbook Name:: s3cmd
# Attributes:: default
#
s3_users = Chef::EncryptedDataBagItem.load(node[:s3cmd][:creds][:databag], node[:s3cmd][:creds][:item]) rescue {}

default[:s3cmd][:users] = s3_users