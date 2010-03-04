# Step snippets
with_defaults :scope => 'source.ruby.rspec.cucumber.steps' do
command 'Cucumber Multiline Steps' do |s|
  s.trigger = 'steps'
  s.input = :clipboard
  s.output = :insert_as_snippet
  s.invoke do 
"steps <<-CUCUMBER
${1:#{STDIN.read}}
CUCUMBER"
  end
end

snippet 'Given Step' do |s|
  s.trigger = 'giv'
  s.expansion = 'Given ${1:step_name} do
  $0
end

'
end

snippet 'Then Step' do |s|
  s.trigger = 'the'
  s.expansion = 'Then ${1:step name} do
  $0
end

'
end

snippet 'When Step' do |s|
  s.trigger = 'whe'
  s.expansion = 'When ${1:step name} do
  $0
end

'
end

end
