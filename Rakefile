require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:single) do |t|
  t.pattern = Dir.glob('spec/single_test.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

RSpec::Core::RakeTask.new(:local) do |t|
  t.pattern = Dir.glob('spec/local_test.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

task :default => :single
