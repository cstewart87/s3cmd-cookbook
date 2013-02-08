#
# Cookbook Name:: s3cmd
# Recipe:: default
#

#install s3cmd
package "s3cmd"

# for each user, install a credentials (.s3cfg) file
node[:s3cmd][:users].each do |user, creds| 
       
    home = node[:etc][:passwd][user][:dir] rescue nil

    # if the user does not yet exist, the next time
    # the recipe runs it will try that user again.
    if home.nil?
        Chef::Log.warn("Cannot install s3cmd configuration for #{user} because that user does not exist -- will try again later.")
    else
        template "s3cfg" do
            path "#{home}/.s3cfg"
            source "s3cfg.erb"
            mode 0600
            variables(
                :access_key => creds[:access],
                :secret_key => creds[:secret]
            )
        end 
    end
end