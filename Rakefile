require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = ["test/**/*_test.rb"]
end

desc "Run tests"
task default: :test