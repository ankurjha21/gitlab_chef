#
# Cookbook Name:: gitlabb
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_package %w(policycoreutils postfix openssh-server openssh-clients) do
  action :install
end

service 'sshd' do
    action [:start, :enable]
 end

service 'postfix' do
    action [:start, :enable]
 end

 execute 'gitlab repo' do
   command 'rpm https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash'
 end

yum_package "gitlab-ce" do
   action :install
end

service "gitlab-ctl" do
   action :reconfigure
end



