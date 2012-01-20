require 'ruble'

command t(:run_feature) do |cmd|
  cmd.key_binding = 'M1+R'
  cmd.scope = 'text.cucumber.feature, source.ruby.rspec.cucumber.steps'
  cmd.output = :show_as_html
  cmd.input = :document, :document
  cmd.invoke do
    require 'stringio'
    output = StringIO.new
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/feature_helper"
    runner = Cucumber::Mate::Runner.new(output, ENV['TM_PROJECT_DIRECTORY'], ENV['TM_FILEPATH'], ENV['TM_CUCUMBER_BIN'], ENV['TM_CUCUMBER_OPTS'])
    
    runner.run_feature
    output.string
  end
end
