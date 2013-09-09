require "guard/preek/version"
require 'guard'
require 'guard/guard'

module Guard
  class Preek < Guard
    autoload :Runner, 'guard/preek/runner'

    def run_on_changes(paths)
      Runner.new(paths, options[:report]).perform
    end

    def run_all
      dir = options[:run_all_dir]
      raise_dir_missing unless dir
      UI.info %(Running Preek on '#{dir}'. Wait for it...!)
      Runner.new(dir, options[:report]).perform
    end

  private
    def raise_dir_missing
      UI.error "Please specify a dir for run all in your Guardfile!\nExample:\n\tguard :preek, run_all_dir: 'lib' do \n\t  watch(/lib\/(.*).rb/) \n\tend"
      throw :task_has_failed
    end
  end
end

