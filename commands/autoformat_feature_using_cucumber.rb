require 'ruble'

command 'Autoformat Feature (using Cucumber)' do |cmd|
  cmd.scope = 'text.cucumber.feature, source.ruby.rspec.cucumber.steps'
  cmd.output = :discard
  cmd.input = :none, :document
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/feature_helper"
    runner = Cucumber::Mate::Runner.new(STDOUT, ENV['TM_PROJECT_DIRECTORY'], ENV['TM_FILEPATH'], ENV['TM_CUCUMBER_BIN'], ENV['TM_CUCUMBER_OPTS'])
    
    runner.autoformat_feature
  end
end
