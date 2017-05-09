require 'rake'
require 'hanami/rake_tasks'

begin
  task fetch_offer: :environment do
    FetchCurrentOffer.new.call
  end

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec



rescue LoadError
end

namespace :morning do
  desc "Turn off alarm."
  task :aaa do
    puts "Turned off alarm. Would have liked 5 more minutes, though."
  end
end