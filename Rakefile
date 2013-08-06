$LOAD_PATH << "./lib"

require "bundler/gem_tasks"
require "rake"
require "rake/testtask"
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each {|file| require file }

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

Rake::TestTask.new(:test) do |test|
  test.libs << "lib" << "test"
  test.pattern = "test/**/*_test.rb"
  test.verbose = true
end

task default: :test
