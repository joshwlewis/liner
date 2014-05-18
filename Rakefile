require "bundler/gem_tasks"

task :default => [:test]

task :test do
  $LOAD_PATH.unshift('lib', 'spec')
  require './test/test_helper.rb'
  Dir.glob('./test/**/*_test.rb') { |f| require f }
end

