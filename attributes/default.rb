#
# Cookbook Name:: s3cmd
# Attributes:: default
#

Chef::Log.info("Grabbing cloud creds")
default[:s3cmd][:creds][:databag] = "credentials"
default[:s3cmd][:creds][:item] = "s3users"