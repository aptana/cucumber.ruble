require 'ruble'

command t(:choose_alternate_file) do |cmd|
  cmd.key_binding = 'CONTROL+SHIFT+ARROW_UP'
  cmd.scope = 'text.cucumber.feature, source.ruby.rspec.cucumber.steps'
  cmd.output = :show_as_tooltip
  cmd.input = :none
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/feature_helper"
    begin
    	Cucumber::Mate::FeatureHelper.new(ENV['TM_FILEPATH']).choose_alternate_file
    rescue Cucumber::Mate::Files::InvalidFilePathError => e
    	Cucumber::Mate::TextMateHelper.alert e.message
    end
  end
end
