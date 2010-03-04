require 'ruble'

command 'Create All Undefined Steps' do |cmd|
  cmd.key_binding = 'CONTROL+ALT+SHIFT+COMMAND+ARROW_DOWN'
  cmd.scope = 'text.cucumber.feature, source.ruby.cucumber.steps'
  cmd.output = :show_as_tooltip
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/cucumber-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/cucumber/mate/feature_helper"
Cucumber::Mate::FeatureHelper.new(ENV['TM_FILEPATH']).create_all_undefined_steps

RUBYEOF

${TM_RUBY:-ruby} /tmp/cucumber-$$.rb; exit_status=$?; rm /tmp/cucumber-$$.rb; exit $exit_status
EOF
end
