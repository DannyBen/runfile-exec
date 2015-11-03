Runfile Exec
============

[![Gem Version](https://badge.fury.io/rb/runfile-exec.svg)](http://badge.fury.io/rb/runfile-exec)

[Runfile](https://github.com/DannyBen/runfile) extensions for executing shell commands.

## Install

	$ gem install runfile-exec

## Usage

Put this in your Runfile

```ruby
require "runfile-exec"
include RunfileExec
```

And then you can use any of these commands in your Runfile actions:

```ruby
# Print and run a command. Wait until it is done and continue.
run 'pwd'

# Print and run a command. Wait until it is done and exit.
run! 'pwd'

# Run a command in the background
run_bg 'some-long-running --daemon'

# Run a command in the background, log to a log file and save the process 
# ID in a pid file for later reference
run_bg 'some-long-running --daemon', log: 'my.log', pid: 'daemon'

# Stop a command started with 'run_bg'. Provide the name of he pid file you 
# used in 'run_bg'
stop_bg 'daemon'
```

## About PID files ##

PID files are stored in the working directory by default.
To change the location, add this at the beginning of your Runfile:

```ruby
RunfileExec.pid_dir = './tmp'
```
