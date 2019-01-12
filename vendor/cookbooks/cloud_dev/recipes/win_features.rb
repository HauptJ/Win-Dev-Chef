powershell_script 'Create AppModelUnlock' do
  guard_interpreter :powershell_script
  code <<-EOH
  $RegistryKeyPath = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\AppModelUnlock"
  if (-not(Test-Path -Path $RegistryKeyPath)) {
      New-Item -Path $RegistryKeyPath -ItemType Directory -Force
  }
  EOH
end

powershell_script 'Add registry value to enable Developer Mode' do
  guard_interpreter :powershell_script
  code <<-EOH
  New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1
  EOH
end

windows_feature 'Microsoft-Hyper-V-All' do
  action :install
  all true
  install_method :windows_feature_dism
end

windows_feature 'Microsoft-Windows-Subsystem-Linux' do
  action :install
  all true
  install_method :windows_feature_dism
end

include_recipe '::win_packages'
