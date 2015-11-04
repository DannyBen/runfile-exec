# This module provides methods for easily and politely run shell commands
# through a Runfile action.
# It is mainly a convenient wrapper around `system` and `exec` and it also
# adds functions for running background tasks with ease.

module RunfileExec
  @@pid_dir = nil

  def self.pid_dir=(dir)
    @@pid_dir = dir
  end

  def self.pid_dir
    @@pid_dir
  end

  # Run a command, wait until it is done and continue
  def run(cmd)
    say "!txtgrn!> #{cmd}"
    system cmd
  end
  module_function :run

  # Run a command, wait until it is done, then exit
  def run!(cmd)
    say "!txtgrn!> #{cmd}"
    exec cmd
  end
  module_function :run!

  # Run a command in the background, optionally log to a log file and save
  # the process ID in a pid file
  def run_bg(cmd, pid: nil, log: '/dev/null')
    full_cmd = "exec #{cmd} >#{log} 2>&1"
    say "!txtgrn!> #{full_cmd}"
    process = IO.popen "exec #{cmd} >#{log} 2>&1"
    File.write pidfile(pid), process.pid if pid
    return process.pid
  end

  # Stop a command started with 'run_bg'. Provide the name of he pid file you 
  # used in 'run_bg'
  def stop_bg(pid)
    file = pidfile(pid)
    if File.exist? file
      pid = File.read file
      File.delete file
      run "kill -s TERM #{pid}"
    else
      say "!txtred!PID file not found."
    end
  end

  private

  def pidfile(pid)
    @@pid_dir ? "#{@@pid_dir}/#{pid}.pid" : "#{pid}.pid"
  end

end

include RunfileExec
