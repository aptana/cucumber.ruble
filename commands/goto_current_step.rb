require 'ruble'

command t(:goto_current_step) do |cmd|
  cmd.key_binding = 'CONTROL+ALT+SHIFT+ARROW_DOWN'
  cmd.scope = 'text.cucumber.feature, source.ruby.cucumber.steps'
  cmd.output = :show_as_tooltip
  cmd.input = :none, :document
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/feature_helper"
    Cucumber::Mate::FeatureHelper.new(ENV['TM_FILEPATH']).goto_current_step(ENV['TM_LINE_NUMBER'])
    nil
  end
end
