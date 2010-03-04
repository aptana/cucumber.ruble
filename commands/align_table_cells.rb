require 'ruble'

command 'Save & Align Table Cells' do |cmd|
  cmd.key_binding = 'M1+S'
  cmd.scope = 'text.cucumber.feature'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
#!/usr/bin/env sh
cat <<'RUBYEOF' > /tmp/cucumber-$$.rb

require ENV['TM_BUNDLE_SUPPORT'] + "/lib/cucumber/mate/table_aligner"

puts(Cucumber::Mate::TableAligner.new.align(STDIN.readlines))
RUBYEOF

${TM_RUBY:-ruby} -w -Ku /tmp/cucumber-$$.rb; exit_status=$?; rm /tmp/cucumber-$$.rb; exit $exit_status
EOF
end
