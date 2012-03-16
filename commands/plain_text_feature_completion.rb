require 'ruble'

content_assist t(:plain_text_feature_completions) do |ca|
  ca.scope = 'text.cucumber.feature'
  ca.invoke do
    ['As a', 'As an', 'I want to', 'So that', 'Story:', 'Scenario:', 'Scenario Outline:', 'Given', 'Then', 'When', 'And']
  end
end
