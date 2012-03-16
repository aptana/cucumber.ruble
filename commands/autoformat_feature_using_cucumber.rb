require 'ruble'

command t(:autoformat_feature) do |cmd|
  cmd.scope = 'text.cucumber.feature, source.ruby.rspec.cucumber.steps'
  cmd.output = :discard
  cmd.input = :none, :document
  cmd.invoke do
    require 'stringio'
    output = StringIO.new
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/feature_helper"
    runner = Cucumber::Mate::Runner.new(output, ENV['TM_PROJECT_DIRECTORY'], ENV['TM_FILEPATH'], ENV['TM_CUCUMBER_BIN'], ENV['TM_CUCUMBER_OPTS'])
    
    runner.autoformat_feature
    output.string
  end
end
