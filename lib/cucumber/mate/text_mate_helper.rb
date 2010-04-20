require "ruble/ui"
require "tempfile"
require "fileutils.rb"

module Cucumber
  module Mate

    class TextMateHelper
      class << self
        # Opens target file_path and sets cursor position
        # options:
        #   :line   - line number (default: ENV['TM_LINE_NUMBER'])
        #   :column - column number (default: 1)
        def goto_file(file_path, options = {})
          Ruble::Editor.go_to(options.merge(:file => file_path))
        end

        # FIXME What is Ninja Search?! How do we port this to Linux/Windows?
        def display_select_list(options)
          ninja_search = "/Applications/NinjaSearch.app/Contents/MacOS/NinjaSearch"
          list = options
          if list.size > too_many_to_select && File.exists?(ninja_search)
            data = list.join("\n") # TODO escape single quotes OR store in file
            res = nil
            Tempfile.open("ninjasearch-cucumber") do |f|
              f << data
              f.flush
              res = %x{NINJA_DATA='#{f.path}' #{e_sh ninja_search}  2>/dev/console}
            end
            list.index(res.strip)
          else
            Ruble::UI.menu(list)
          end
        end

        def alert(options = {})
          options = {:message => options} if options.kind_of?(String)
          options = {:style => :informational, :title => 'Alert!', :message => '', :buttons => 'OK'}.merge(options)
          Ruble::UI.alert(options[:style], options[:title], options[:message], options[:buttons])
        end

        def request_confirmation(options)
          Ruble::UI.request_confirmation(options)
        end

        def create_file(file_path)
          FileUtils.mkdir_p(File.dirname(file_path))
          FileUtils.touch(file_path)
        end

        def create_and_open_file(file_path)
          create_file(file_path)
          Ruble::Editor.open(file_path)
        end

        def insert_text(text)
          Ruble::Editor.active.insert_as_snippet(text)
        end
        
        def too_many_to_select
          9
        end
      end
    end

  end
end
