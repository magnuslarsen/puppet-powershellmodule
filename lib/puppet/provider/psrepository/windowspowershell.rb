Puppet::Type.type(:psrepository).provide(:windowspowershell, parent: :powershellcore) do
  desc 'Provider for managing powershell repositories on systems with powershell version 5.1 or lower.'
  initvars
  confine operatingsystem: :windows
  confine feature: :powershellgetwindows
  commands powershell: 'powershell'

  def self.invoke_ps_command(command)
    result = powershell(['-noprofile', '-executionpolicy', 'bypass', '-command', command])
    result.lines
  end
end
