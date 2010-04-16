require File.join(File.dirname(__FILE__), %w[.. mate])
require File.join(File.dirname(__FILE__), 'files')
require 'ruble/terminal'
require 'rbconfig'

module Cucumber
  module Mate

    class Runner
      
      if RbConfig::CONFIG['target_os'] =~ /(win|w)32$/
        CUCUMBER_BIN = "script/cucumber"
        RUBY_BIN = ENV['TM_RUBY'] || "ruby"
        RAKE_BIN = "rake"
      else  
        CUCUMBER_BIN = %x{which cucumber}.chomp
        RUBY_BIN = ENV['TM_RUBY'] || %x{which ruby}.chomp
        RAKE_BIN = %x{which rake}.chomp
      end
      
      def initialize(output, project_directory, full_file_path, cucumber_bin = nil, cucumber_opts=nil)
        @file = Files::Base.create_from_file_path(full_file_path)
        @output = output
        @project_directory = project_directory
        @filename_opts = ""
        @cucumber_bin = cucumber_bin || CUCUMBER_BIN
        @cucumber_opts = cucumber_opts || ""
        @cucumber_opts << " --profile=#{@file.profile}" if @file.profile
      end

      def run_scenario(line_number)
        @filename_opts << ":#{line_number}"
        run
      end

      def run_feature
        run
      end
      
      def autoformat_feature
        in_project_dir do
          Kernel.system("#{cucumber_cmd} --autoformat . #{@file.relative_path}")
        end
      end


    protected

      def run
        argv = []
        if @file.rake_task
          command = RAKE_BIN
          argv << "FEATURE=#{@file.full_file_path}"
          argv << %Q{CUCUMBER_OPTS="#{@cucumber_opts}"}
        else
          command = cucumber_cmd
          argv << "#{@file.full_file_path}#{@filename_opts}"
          argv << @cucumber_opts
        end
        in_project_dir do
          full_command = "#{RUBY_BIN} #{command} #{@file.rake_task} #{argv.join(' ')}"
          Ruble::Terminal.open( full_command, @project_directory)
        end
      end
      
      def cucumber_cmd
        File.exists?("#{@project_directory}/script/cucumber") ? "script/cucumber" : @cucumber_bin
      end

      def in_project_dir(&block)
        Dir.chdir(@project_directory, &block)
      end

    end

  end
end
