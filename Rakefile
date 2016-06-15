require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:sample) do |t|
  t.pattern = Dir.glob('spec/*_spec.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

task :default => :sample
