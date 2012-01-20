require 'ruble'

command t(:create_all_undefined_steps) do |cmd|
  cmd.key_binding = 'CONTROL+ALT+SHIFT+COMMAND+ARROW_DOWN'
  cmd.scope = 'text.cucumber.feature, source.ruby.cucumber.steps'
  cmd.output = :show_as_tooltip
  cmd.input = :none
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/feature_helper"
    Cucumber::Mate::FeatureHelper.new(ENV['TM_FILEPATH']).create_all_undefined_steps
  end
end
