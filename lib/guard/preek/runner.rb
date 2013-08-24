require 'reek'
require 'thor/shell/color'
require 'preek/smell_collector'
require 'preek/smell_reporter'
require 'preek/smell_warning'
require 'preek/smell_file'
require 'preek/klass_collector'

module Guard
  class Preek
    class Runner
      def initialize(files)
        @files = files
      end

      def perform
        sources = Reek::Source::SourceLocator.new(@files).all_sources
        smelly_files = ::Preek::SmellCollector.new(sources, []).smelly_files
        ::Preek::SmellReporter.new(smelly_files).print_smells
      end
    end
  end
end