require "guard/preek/version"
require 'guard'
require 'guard/guard'

module Guard
  class Preek < Guard
    autoload :Runner, 'guard/preek/runner'

    def run_on_changes(paths)
      Runner.new(paths).perform
    end

    def run_all
      dir = options[:run_all_dir]
      raise_dir_missing unless dir
      Runner.new(dir).perform
    end

  private
    def raise_dir_missing
      UI.error <<-EOF
Please specify a dir for run all in your Guardfile!
Example:

guard :preek, run_all_dir: 'lib' do
  watch(/lib\/(.*).rb/)
end
      EOF
      throw :task_has_failed
    end
  end
end

