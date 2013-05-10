#!/usr/bin/env ruby

# starts the rails app configured in config/fafactory.yml in test mode off of the given ports
require 'fileutils'

def log(msg)
  puts "* [fafactory] #{msg}"
end

config = YAML.load_file('config/fafactory.yml')

config.each do |service, settings|
  exec_args = []
  if settings["port"]
    exec_args << "--port=#{settings["port"]}"
  end
  exec_args << "--environment=test"
  
  log "Starting application at #{settings["path"]}..."
  fork do 
    FileUtils.cd settings["path"]
    exec "script/server", *exec_args
  end
end

Signal.trap("TERM") do
  log "Terminating..."
  exit
end
Signal.trap("INT") do
  log "Terminating..."
  exit
end

begin
  Process.waitall
rescue
end

log "Exited the/all app(s)!"