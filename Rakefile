require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name        = 'localized_each_validator'
  gem.summary     = "Simple EachValidator with localization support"
  gem.description = "Adds an abstract EachValidator superclass that you can use to create localizable validations."
  gem.email       = 'git@timothymorgan.info'
  gem.homepage    = 'http://github.com/riscfuture/localized_each_validator'
  gem.authors     = ['Tim Morgan']
  gem.files       = %w( lib/**/* localized_each_validator.gemspec README.textile LICENSE )
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

require 'yard'
YARD::Rake::YardocTask.new('doc') do |doc|
  doc.options << '-m' << 'textile'
  doc.options << '--protected'
  doc.options << '-r' << 'README.textile'
  doc.options << '-o' << 'doc'
  doc.options << '--title' << "Localized EachValidator Documentation"

  doc.files = %w(lib/**/* README.textile)
end

task(default: :spec)
