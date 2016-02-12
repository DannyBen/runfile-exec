Runfile Exec
============

[![Gem Version](https://badge.fury.io/rb/runfile-exec.svg)](http://badge.fury.io/rb/runfile-exec)

[Runfile](https://github.com/DannyBen/runfile) extensions for executing shell commands.

---

**Deprecation Notice:**  
This gem is being phased out. It has been merged 
directly into Runfile so there is no longer a need for you to include it. 

---

## Install

	$ gem install runfile-exec

## Usage

Put this in your Runfile

```ruby
require "runfile-exec"
```

And then you can use any of these commands in your Runfile actions:

```ruby
# Print and run a command. Wait until it is done and continue.
run 'pwd'

# Print and run a command. Wait until it is done and exit.
run! 'pwd'

# Run a command in the background
run_bg 'some/long-running/process'

# Run a command in the background, log to a log file and save the process 
# ID in a pid file for later reference
run_bg 'some/long-running/process', log: 'my.log', pid: 'daemon'

# Stop a command started with 'run_bg'. Provide the name of he pid file you 
# used in 'run_bg'
stop_bg 'daemon'

# Intercept each call before executed. Can be used to modify the command, run
# something before it, or cancel it altogether.
# Your block receives the command as argument, and should return a command to
# run or false to stop execution.
before_run do |command|
  cmd.gsub /^(rails|rake|cucumber)/, "bin/\\1"
end

# Intercept each call before it exits. Note this is only useful with `run` and
# `run_bg` but not with `run!` which exits after execution.
after_run do |command|
  puts "Finished #{command}"
end
```

## About PID files ##

PID files are stored in the working directory by default.
To change the location, add this at the beginning of your Runfile:

```ruby
RunfileExec.pid_dir = './tmp'
```

## Example ##

See the `example` folder for sample usage. To see the output:

	$ cd example
	$ run         # list commands
	$ run runbg   # start one of the sample commands
