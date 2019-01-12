powershell_script 'Disables AutoLogin of Administrator account' do
  guard_interpreter :powershell_script
  code <<-EOH
  Set-ItemProperty 'HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon' -name AutoAdminLogon -value 0
  EOH
end

reboot 'app_requires_reboot' do
  action :request_reboot
  reason 'Need to reboot when the run completes successfully.'
  delay_mins 1
end
