require 'rake'
require 'hanami/rake_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec

  task fetch_offer: :environment do
    FetchCurrentOffer.new.call
  end
rescue LoadError
end
