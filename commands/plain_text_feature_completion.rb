require 'ruble'

content_assist 'Plain Text Feature Completions' do |ca|
  ca.scope = 'text.cucumber.feature'
  ca.invoke do
    ['As a', 'As an', 'I want to', 'So that', 'Story:', 'Scenario:', 'Scenario Outline:', 'Given', 'Then', 'When', 'And']
  end
end
