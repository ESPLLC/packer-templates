directory 'Remove old panther directory' do
  path 'C:\Windows\Panther'
  recursive true
  action :delete
end

directory 'create unattend directory' do
  path 'C:\Windows\Panther\Unattend'
  recursive true
end

template 'C:/Windows/Panther/Unattend/unattend.xml' do
  source 'postunattend.xml.erb'
  variables(
    username: node['credentials']['vm_username'],
    password: node['credentials']['vm_password']
  )
end

template 'C:/Windows/Panther/Unattend/packer_shutdown.bat' do
  source 'packer_shutdown.bat.erb'
end
