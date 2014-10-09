# encoding: utf-8
require 'ruble'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = t(:bundle_name)
  bundle.description = "Cucumber RadRails bundle, ported from Ben Mabey's Cucumber TextMate bundle: http://github.com/bmabey/cucumber-tmbundle"
  bundle.repository = "git://github.com/aptana/cucumber.ruble.git"
  
  start_folding = /^\s*\b(Cenário|Cenario|Escenari|Escenario|Forgatókönyv|MISHUN|Mate|Scenarie|Scenarijus|Scenario|Scenariu|Scenariusz|Scenár|Scenārijs|Scénario|Scénář|Skenario|Stsenaarium|Szenario|Tapaus|Tình huống|Kịch bản|Сценарий|תרחיש|سيناريو|シナリオ|场景|場景|劇本|시나리오)/
  end_folding = /^\s*$/
  bundle.folding['text.cucumber.feature'] = start_folding, end_folding
  bundle.file_types['text.cucumber.feature'] = '*.feature'
  bundle.file_types['source.ruby.rspec.cucumber.steps'] = '*steps.rb'

  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.command t(:feature)
    main_menu.command t(:scenario)
    main_menu.command t(:scenario_heading_only)
    main_menu.command t(:scenario_outline)
    main_menu.command t(:given_step)
    main_menu.command t(:when_step)
    main_menu.command t(:then_step)
    main_menu.command t(:multiline_steps)
    main_menu.command t(:then_step_plaintext)
    main_menu.command t(:when_step_plaintext)
    main_menu.command t(:autocomplete_step)
    main_menu.command t(:create_all_undefined_steps)
    main_menu.command t(:choose_alternate_file)
    main_menu.command t(:goto_alternate_file)
    main_menu.command t(:goto_current_step)
    main_menu.command t(:run_feature)
    main_menu.command t(:run_single_scenario)
    main_menu.command t(:autoformat_feature)
    main_menu.command t(:align_table_cells)
  end
end

# Extend Ruble::Editor to add special ENV vars
env "text.cucumber.feature" do |e|
  e['TM_COMMENT_START'] = "# "
  e.delete('TM_COMMENT_END')
  e['TM_COMMENT_START_2'] = "=begin"
  e['TM_COMMENT_END_2'] = "=end"
  e.delete('TM_COMMENT_DISABLE_INDENT')
end
