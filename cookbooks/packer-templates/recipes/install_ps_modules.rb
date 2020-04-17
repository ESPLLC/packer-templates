powershell_script 'install Nuget package provider' do
  # See https://stackoverflow.com/questions/55826791/powershell-installing-nuget-says-unable-to-access-internet-but-i-actually-can
  code <<-PSHELL
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Install-PackageProvider -Name NuGet -Force
  PSHELL
  not_if '(Get-PackageProvider -Name Nuget -ListAvailable -ErrorAction SilentlyContinue) -ne $null'
end

%w{PSWindowsUpdate xNetworking xRemoteDesktopAdmin xCertificate}.each do |ps_module|
  powershell_script "install #{ps_module} module" do
    code <<-PSHELL
      [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12      
      Install-Module #{ps_module} -Force
    PSHELL
    not_if "(Get-Module #{ps_module} -list) -ne $null"
  end
end
