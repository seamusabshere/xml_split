require "bundler/gem_tasks"

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = %w{--format pretty}
end

task :default => [:cucumber]

require 'yard'
YARD::Rake::YardocTask.new
