require 'ruble'

command 'Run Single Scenario' do |cmd|
  cmd.key_binding = 'M1+M2+R'
  cmd.scope = 'text.cucumber.feature'
  cmd.output = :show_as_html
  cmd.input = :document, :document
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/feature_helper"
    runner = Cucumber::Mate::Runner.new(STDOUT, ENV['TM_PROJECT_DIRECTORY'], ENV['TM_FILEPATH'], ENV['TM_CUCUMBER_BIN'], ENV['TM_CUCUMBER_OPTS'])
    
    runner.run_scenario(ENV['TM_LINE_NUMBER'])
  end
end
