require "rake"
require "rake/testtask"
require "bundler/gem_tasks"

Rake::TestTask.new do |t|
  t.test_files = FileList["test/*_test.rb"]
  t.verbose = true
end

namespace :gem do
  desc "Outputs gemspec sources as files"
  task :files do
    files = Dir.glob("{lib,app,bin}/**/*") | ["config/routes.rb"]
    puts files.join(" ")
  end
end