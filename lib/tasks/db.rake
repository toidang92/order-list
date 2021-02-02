
namespace :db do
  desc "Checks to see if the database exists"
  task :nonexists do
    begin
      Rake::Task['environment'].invoke
      ActiveRecord::Base.connection
    rescue
      exit 0
    else
      exit 1
    end
  end
end
