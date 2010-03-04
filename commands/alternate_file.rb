require 'ruble'

command 'Goto Alternate File' do |cmd|
  cmd.key_binding = 'CONTROL+M2+DOWN_ARROW'
  cmd.scope = 'text.cucumber.feature, source.ruby.rspec.cucumber.steps'
  cmd.output = :show_as_tooltip
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/cucumber-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/cucumber/mate/feature_helper"
begin
	Cucumber::Mate::FeatureHelper.new(ENV['TM_FILEPATH']).goto_alternate_file
rescue Cucumber::Mate::Files::InvalidFilePathError => e
	Cucumber::Mate::TextMateHelper.alert e.message
end

RUBYEOF

${TM_RUBY:-ruby} /tmp/cucumber-$$.rb; exit_status=$?; rm /tmp/cucumber-$$.rb; exit $exit_status
EOF
end
