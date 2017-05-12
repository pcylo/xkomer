require 'rake'
require 'hanami/rake_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec

rescue LoadError
end

namespace :offers do
  desc "Loads the current hot shot offer"
  task fetch: :environment do
    FetchCurrentOffer.new.call
  end
end
