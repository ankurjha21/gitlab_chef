# Cookbook Name:: gitlabb
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

package %w(ca-certificates curl openssh-server) do
  action :install
 end

package 'postfix' do
   action :install
 end


service 'postfix' do
    action [:start, :enable]
 end

execute 'gitlab repo' do
   command 'curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash script.deb.sh' 
 end

package 'gitlab-ce' do
   action :install
 end

execute 'gitlab-ctl' do
   command 'gitlab-ctl reconfigure'
 end



