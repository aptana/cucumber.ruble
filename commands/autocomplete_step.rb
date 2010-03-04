require 'ruble'

command 'Save & Align Table Cells' do |cmd|
  cmd.key_binding = 'ALT+ESC'
  cmd.scope = 'text.cucumber.feature'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/cucumber/mate/feature_helper"
begin
  Cucumber::Mate::FeatureHelper.new(ENV['TM_FILEPATH']).autocomplete_step($stdout, ENV['TM_CURRENT_LINE'])
rescue Cucumber::Mate::Files::InvalidFilePathError => e
  Cucumber::Mate::TextMateHelper.alert e.message
  print ENV['TM_CURRENT_LINE']
end
EOF
end
