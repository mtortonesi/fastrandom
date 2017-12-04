require "bundler/gem_tasks"
require "rake/testtask"

require 'ffi-compiler/export_task'

def gem_spec
  @gem_spec ||= Gem::Specification.load('fastrandom.gemspec')
end

FFI::Compiler::ExportTask.new('lib/fastrandom', 'ext', :gem_spec => gem_spec) do |t|
  t.export 'librandom.rb'
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test
