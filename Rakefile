require 'rake'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb']
  t.verbose  = true
end

namespace :gem do
  desc "Outputs the files that should be sources in the gemspec"
  task :files do
    files = Dir.glob("{lib,app,bin}/**/*") | ["config/routes.rb"]
    puts files.join(" ")
  end
end