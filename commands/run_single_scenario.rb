require 'ruble'

command 'Run Single Scenario' do |cmd|
  cmd.key_binding = 'M1+M2+R'
  cmd.scope = 'text.cucumber.feature'
  cmd.output = :show_as_html
  cmd.input = :document, :document
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/cucumber-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/cucumber/mate/feature_helper"
runner = Cucumber::Mate::Runner.new(STDOUT, ENV['TM_PROJECT_DIRECTORY'], ENV['TM_FILEPATH'], ENV['TM_CUCUMBER_BIN'], ENV['TM_CUCUMBER_OPTS'])

runner.run_scenario(ENV['TM_LINE_NUMBER'])

RUBYEOF

${TM_RUBY:-ruby} /tmp/cucumber-$$.rb; exit_status=$?; rm /tmp/cucumber-$$.rb; exit $exit_status
EOF
end
