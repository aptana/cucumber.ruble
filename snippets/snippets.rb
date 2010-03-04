command 'Cucumber Multiline Steps' do |s|
  s.trigger = 'steps'
  s.input = :clipboard
  s.scope = 'source.ruby.rspec.cucumber.steps'
  s.output = :insert_as_snippet
  s.invoke do 
"steps <<-CUCUMBER
${1:#{STDIN.read}}
CUCUMBER"
  end
end

snippet 'Given Step' do |s|
  s.trigger = 'giv'
  s.scope = 'source.ruby.rspec.cucumber.steps'
  s.expansion = 'Given ${1:step name} do
  $0
end

'
end

snippet 'Scenario (heading only)' do |s|
  s.trigger = 'sc'
  s.scope = 'text.cucumber.feature'
  s.expansion = 'Scenario: ${1:title}
$0
'
end

snippet 'Scenario Outline' do |s|
  s.trigger = 'sco'
  s.scope = 'text.cucumber.feature'
  s.expansion = 'Scenario Outline: ${1:title}
  Given ${2:context}
  When ${3:event}
  Then ${4:outcome}
'
end

snippet 'Scenario' do |s|
  s.trigger = 'sce'
  s.scope = 'text.cucumber.feature'
  s.expansion = 'Scenario: ${1:title}
  Given ${2:context}
  When ${3:event}
  Then ${4:outcome}
$0
'
end

snippet 'Feature' do |s|
  s.trigger = 'fea'
  s.scope = 'text.cucumber.feature'
  s.input = :none
  s.output = :insert_as_snippet
  s.invoke do |context|  
    title = (ENV['TM_FILENAME'] || 'title').gsub(/\..*$/, '').gsub(/[-_]/, ' ')
    title = title[0..0].upcase + title[1..-1].downcase
"Feature: ${1:#{title}}
  In order to ${2:value}
  As a ${3:role}
  I want ${4:feature}

  $0
"
  end
end

snippet 'Then Step Plaintext' do |s|
  s.trigger = 'the'
  s.scope = 'text.cucumber.feature'
  s.expansion = 'Then ${1:outcome}'
end

snippet 'Then Step' do |s|
  s.trigger = 'the'
  s.scope = 'source.ruby.rspec.cucumber.steps'
  s.expansion = 'Then ${1:step name} do
  $0
end

'
end

snippet 'When Step Plaintext' do |s|
  s.trigger = 'whe'
  s.scope = 'text.cucumber.feature'
  s.expansion = 'When ${1:event}'
end

snippet 'When Step' do |s|
  s.trigger = 'whe'
  s.scope = 'source.ruby.rspec.cucumber.steps'
  s.expansion = 'When ${1:step name} do
  $0
end

'
end

