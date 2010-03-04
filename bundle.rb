require 'ruble'

bundle 'Cucumber' do |bundle|
  start_folding = /^\s*\b(Cenário|Cenario|Escenari|Escenario|Forgatókönyv|MISHUN|Mate|Scenarie|Scenarijus|Scenario|Scenariu|Scenariusz|Scenár|Scenārijs|Scénario|Scénář|Skenario|Stsenaarium|Szenario|Tapaus|Tình huống|Kịch bản|Сценарий|תרחיש|سيناريو|シナリオ|场景|場景|劇本|시나리오)/
  end_folding = /^\s*$/
  bundle.folding['text.cucumber.feature'] = start_folding, end_folding
  bundle.file_types['text.cucumber.feature'] = '*.feature'
  bundle.file_types['source.ruby.rspec.cucumber.steps'] = 'steps.rb'

  bundle.menu 'Cucumber' do |main_menu|
    main_menu.command 'Feature'
    main_menu.command 'Scenario'
    main_menu.command 'Scenario (heading only)'
    main_menu.command 'Scenario Outline'
    main_menu.command 'Given Step'
    main_menu.command 'When Step'
    main_menu.command 'Then Step'
    main_menu.command 'Cucumber Multiline Steps'
    main_menu.command 'Then Step Plaintext'
    main_menu.command 'When Step Plaintext'
    main_menu.command 'Autocomplete Step'
    main_menu.command 'Create All Undefined Steps'
    main_menu.command 'Choose Alternate File'
    main_menu.command 'Goto Alternate File'
    main_menu.command 'Goto Current Step'
    main_menu.command 'Run Feature'
    main_menu.command 'Run Single Scenario'
    main_menu.command 'Update Cucumber Bundle'
    main_menu.command 'Autoformat Feature (using Cucumber)'
    main_menu.command 'Save & Align Table Cells'
  end
end

# Extend Ruble::Editor to add special ENV vars
module Ruble
  class Editor
    unless method_defined?(:to_env_pre_cuke_bundle)
      alias :to_env_pre_cuke_bundle :to_env
      def to_env
        env_hash = to_env_pre_ruby_bundle
        scopes = current_scope.split(' ')
        if !scopes.select {|scope| scope.start_with? "text.cucumber.feature" }.empty?
          env_hash['TM_COMMENT_START'] = "# "
          env_hash.delete('TM_COMMENT_END')
          env_hash['TM_COMMENT_START_2'] = "=begin"
          env_hash['TM_COMMENT_END_2'] = "=end"
          env_hash.delete('TM_COMMENT_DISABLE_INDENT')
        end
        env_hash
      end
    end
  end
end
