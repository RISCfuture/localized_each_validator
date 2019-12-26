require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"
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
  gem.files       = %w[lib/**/* localized_each_validator.gemspec README.md LICENSE]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

require 'yard'

# bring sexy back (sexy == tables)
module YARD::Templates::Helpers::HtmlHelper
  def html_markup_markdown(text)
    markup_class(:markdown).new(text, :gh_blockcode, :fenced_code, :autolink, :tables, :no_intraemphasis).to_html
  end
end

YARD::Rake::YardocTask.new('doc') do |doc|
  doc.options << '-m' << 'markdown'
  doc.options << '-M' << 'redcarpet'
  doc.options << '--protected' << '--no-private'
  doc.options << '-r' << 'README.md'
  doc.options << '-o' << 'doc'
  doc.options << '--title' << "Localized EachValidator Documentation"

  doc.files = %w[lib/**/* README.md]
end

task(default: :spec)
