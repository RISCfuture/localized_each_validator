require 'rake'
begin
  require 'bundler'
rescue LoadError
  puts "Bundler is not installed; install with `gem install bundler`."
  exit 1
end

Bundler.require :default

Jeweler::Tasks.new do |gem|
  gem.name = "localized_each_validator"
  gem.summary = %Q{Simple EachValidator with localization support}
  gem.description = %Q{Adds an abstract EachValidator superclass that you can use to create localizable validations.}
  gem.email = "git@timothymorgan.info"
  gem.homepage = "http://github.com/riscfuture/localized_each_validator"
  gem.authors = [ "Tim Morgan" ]
  gem.add_dependency 'activerecord', '>= 3.0'
  gem.add_dependency 'activesupport', '>= 3.0'
end
Jeweler::GemcutterTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

YARD::Rake::YardocTask.new('doc') do |doc|
  doc.options << "-m" << "textile"
  doc.options << "--protected"
  doc.options << "-r" << "README.textile"
  doc.options << "-o" << "doc"
  doc.options << "--title" << "Localized EachValidator Documentation".inspect
  
  doc.files = [ 'lib/**/*', 'README.textile' ]
end

task(default: :spec)
