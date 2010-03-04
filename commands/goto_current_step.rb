require 'ruble'

command 'Goto Current Step' do |cmd|
  cmd.key_binding = 'CONTROL+M2+`+$+'
  cmd.scope = 'text.cucumber.feature, source.ruby.cucumber.steps'
  cmd.output = :show_as_tooltip
  cmd.input = :none, :document
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/cucumber-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/cucumber/mate/feature_helper"
Cucumber::Mate::FeatureHelper.new(ENV['TM_FILEPATH']).goto_current_step(ENV['TM_LINE_NUMBER'])

RUBYEOF

${TM_RUBY:-ruby} /tmp/cucumber-$$.rb; exit_status=$?; rm /tmp/cucumber-$$.rb; exit $exit_status
EOF
end
