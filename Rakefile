# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

namespace :test do
  desc 'Measures test coverage'
  task :coverage do
    rm_f "coverage/*"
    rm_f "coverage.data"
    rcov = "rcov -Itest --rails --aggregate coverage.data -T -x \" rubygems/*,rcov*\""
    system("#{rcov} --html test/unit/*_test.rb test/unit/helpers/*_test.rb")
    system("#{rcov} --html test/functional/*_test.rb")
  end
end

