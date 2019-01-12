##### Libraries #####

%w{python3 python2}.each do |python_pack|
  chocolatey_package python_pack do
    action :install
  end
end

chocolatey_package 'ruby' do
  action :Install
end

%w{nodejs yarn}.each do |nodejs_pack|
  chocolatey_package nodejs_pack do
    action :install
  end
end

chocolatey_package 'golang' do
  action :install
end

%w{jdk8 jdk9 maven gradle}.each do |java_pack|
  chocolatey_package java_pack do
    action :Install
  end
end

#Package currently broken
#chocolatey_package 'miktex' do
#  action :install
#end

##### Tools #####

%w{git openssh cmder winsshterm curl wget}.each do |sys_pack|
  chocolatey_package sys_pack do
    action :install
  end
end

%w{sumatrapdf pdfcreator calibre}.each do |doc_pack|
  chocolatey_package doc_pack do
    action :install
  end
end

%w{ffmpeg winff openshot activepresenter k-litecodecpackmega vlc}.each do |video_pack|
  chocolatey_package video_pack do
    action :install
  end
end

%w{imagemagick greenshot gimp irfanview irfanviewplugins}.each do |image_pack|
  chocolatey_package image_pack do
    action :install
  end
end

%w{hexchat skype steam}.each do |chat_pack|
  chocolatey_package chat_pack do
    action :install
  end
end

chocolatey_package 'TeamViewer' do
  action :install
end

##### Editors #####

%w{atom notepadplusplus vim}.each do |editor_pack|
  chocolatey_package editor_pack do
    action :install
  end
end

chocolatey_package 'netbeans' do
  action :install
end

chocolatey_package 'visualstudio2017enterprise' do
  action :install
end

# miktex package is currently broken
#%w{texstudio texmaker}.each do |tex_pack|
#  chocolatey_package tex_pack do
#    action :install
#  end
#end

##### Browsers #####

%w{googlechrome waterfox firefox}.each do |browser_pack|
  chocolatey_package browser_pack do
    action :install
  end
end

##### Cloud #####

%w{docker-for-windows docker-compose kubernetes-cli minikube kubernetes-kompose kubernetes-helm}.each do |container_pack|
  chocolatey_package container_pack do
    action :install
  end
end

chocolatey_package 'gcloudsdk' do
  action :install
  version '0.0.0.20171229'
  only_if { node[:cloud_dev][:GCLOUD] == 'true' }
end

%w{vagrant packer terraform vault}.each do |hashi_pack|
  chocolatey_package hashi_pack do
    action :install
  end
end

powershell_script 'Install the OpenStack CLI' do
  code <<-EOH
  pip install python-openstackclient
  EOH
end

powershell_script 'Install the AWS CLI' do
  code <<-EOH
  pip install awscli
  EOH
end

powershell_script 'Install CloudFlare API' do
  code <<-EOH
  pip install cloudflare
  EOH
end

powershell_script 'Install Digitalocean Python API' do
  code <<-EOH
  pip install dopy
  EOH
end

powershell_script 'Install DigitalOcean GO Doctl' do
  code <<-EOH
  go get -u github.com/digitalocean/doctl/cmd/doctl
  EOH
end

powershell_script 'Install CloudFlare GO API' do
  code <<-EOH
  go get -u github.com/cloudflare/cloudflare-go
  EOH
end

powershell_script 'Install CloudFlare GO flarectl' do
  code <<-EOH
  go get -u github.com/cloudflare/cloudflare-go/...
  EOH
end

chocolatey_package 'geforce-game-ready-driver' do
  action :install
  only_if { node[:cloud_dev][:NVIDIA_GPU] == 'true' }
end


include_recipe '::win_finalize'
